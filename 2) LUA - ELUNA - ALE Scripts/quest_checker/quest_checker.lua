-- Quest Status Checker Command for AzerothCore Eluna
-- Usage: .check quest id <questID> [playerName]
--        .check quest name <questName> [playerName]

local function GetQuestStatusText(status)
    if status == 0 then
        return "QUEST_STATUS_NONE", "Quest isn't shown in quest list"
    elseif status == 1 then
        return "QUEST_STATUS_COMPLETE", "Quest has been completed"
    elseif status == 3 then
        return "QUEST_STATUS_INCOMPLETE", "Quest is active in quest log but incomplete"
    elseif status == 5 then
        return "QUEST_STATUS_FAILED", "failed to complete the quest"
    else
        return "UNKNOWN_STATUS", ""
    end
end

local function GetQuestByName(questName)
    -- Escape single quotes and other special characters for SQL safety
    local escapedName = questName:gsub("'", "\\'")
    local query = WorldDBQuery("SELECT ID, LogTitle FROM quest_template WHERE LogTitle LIKE '%" .. escapedName .. "%'")
    local results = {}
    
    if query then
        repeat
            table.insert(results, {query:GetUInt32(0), query:GetString(1)})
        until not query:NextRow()
    end
    
    return results
end

local function GetQuestById(questId)
    local query = WorldDBQuery("SELECT ID, LogTitle, Flags FROM quest_template WHERE ID = " .. questId)
    if query then
        return query:GetUInt32(0), query:GetString(1), query:GetUInt32(2)
    end
    return nil, nil, nil
end

local function GetQuestChainInfo(questId)
    local query = WorldDBQuery("SELECT PrevQuestID, NextQuestID FROM quest_template_addon WHERE ID = " .. questId)
    if query then
        return query:GetInt32(0), query:GetInt32(1) -- Using GetInt32 since these can be negative
    end
    return 0, 0 -- Default to 0 if no addon record found
end

local function GetQuestNameById(questId)
    local query = WorldDBQuery("SELECT LogTitle FROM quest_template WHERE ID = " .. questId)
    if query then
        return query:GetString(0)
    end
    return "Unknown Quest"
end

local function GetPlayerByNameFormatted(playerName)
    -- Format name: First letter capital, rest lowercase (same as SendAndBind script)
    local formattedName = playerName:sub(1,1):upper() .. playerName:sub(2):lower()
    -- Escape single quotes for SQL safety
    local escapedName = formattedName:gsub("'", "\\'")
    
    -- Try to get online player first
    local targetPlayer = GetPlayerByName(formattedName)
    if targetPlayer then
        return targetPlayer, false -- Return the actual online player object, not offline
    else
        -- Player is offline, create mock object with database lookup (same approach as SendAndBind)
        local result = CharDBQuery("SELECT guid FROM characters WHERE name = '" .. escapedName .. "'")
        if result then
            local guid = result:GetUInt32(0)
            return {
                GetName = function() return formattedName end,
                GetGUIDLow = function() return guid end
            }, true -- Return mock object, is offline
        else
            return nil, false -- Player not found
        end
    end
end

local function GetQuestStatus(player, questId)
    local guid = player:GetGUIDLow()
    if not guid then
        return 0, 0 -- Player not found
    end
    
    local query = CharDBQuery("SELECT status, explored FROM character_queststatus WHERE guid = " .. guid .. " AND quest = " .. questId)
    
    if query then
        return query:GetUInt32(0), query:GetUInt32(1)
    else
        return 0, 0 -- Default to QUEST_STATUS_NONE if no record found
    end
end

local function HasExplorationFlag(questFlags)
    -- Check if exploration flag (4) is set using AzerothCore's bitwise method
    -- In AzerothCore: flags = flags | 4 means the flag is set
    return (questFlags % 8) >= 4 -- Check if bit 2 (value 4) is set
end

local function HandleQuestStatusCommand(event, player, command)
    -- Only handle commands that start with "check quest"
    if not command:match("^check%s+quest") then
        return true -- Let other commands pass through
    end
    
    local args = {}
    for word in command:gmatch("%S+") do
        table.insert(args, word)
    end
    
    -- Check if command has proper format
    if #args < 3 or args[1] ~= "check" or args[2] ~= "quest" then
        return true -- Let other commands pass through
    end
    
    local searchType = args[3] -- "id" or "name"
    local searchValue = args[4]
    local targetPlayerName = args[5]
    
    if not searchValue then
        if player then
            player:SendBroadcastMessage("Usage: .check quest id <questID> [playerName] or .check quest name <questName> [playerName]")
        else
            print("Usage: .check quest id <questID> [playerName] or .check quest name <questName> [playerName]")
        end
        return true -- Command handled, but let other systems continue
    end
    
    -- Check permissions for targeting other players
    local targetPlayer = player
    local isTargetOffline = false
    if targetPlayerName then
        -- Check if command is run from console (player is nil)
        if player == nil then
            -- Console commands have full permissions
            targetPlayer, isTargetOffline = GetPlayerByNameFormatted(targetPlayerName)
            if not targetPlayer or not targetPlayer:GetGUIDLow() then
                print("Player '" .. targetPlayerName .. "' not found.")
                return true -- Command handled
            end
        else
            -- Command run by a player, check GM rank
            if player:GetGMRank() == 0 then
                player:SendBroadcastMessage("You don't have permission to check other players' quest status.")
                return true -- Command handled
            end
            
            targetPlayer, isTargetOffline = GetPlayerByNameFormatted(targetPlayerName)
            if not targetPlayer or not targetPlayer:GetGUIDLow() then
                player:SendBroadcastMessage("Player '" .. targetPlayerName .. "' not found.")
                return true -- Command handled
            end
        end
    end
    
    local questId, questTitle, questFlags
    
    if searchType == "id" then
        questId = tonumber(searchValue)
        if not questId then
            if player then
                player:SendBroadcastMessage("Invalid quest ID: " .. searchValue)
            else
                print("Invalid quest ID: " .. searchValue)
            end
            return true -- Command handled
        end
        
        questId, questTitle, questFlags = GetQuestById(questId)
        if not questId then
            if player then
                player:SendBroadcastMessage("Quest with ID " .. searchValue .. " not found.")
            else
                print("Quest with ID " .. searchValue .. " not found.")
            end
            return true -- Command handled
        end
        
    elseif searchType == "name" then
        local results = GetQuestByName(searchValue)
        if #results == 0 then
            if player then
                player:SendBroadcastMessage("Quest with name containing '" .. searchValue .. "' not found.")
            else
                print("Quest with name containing '" .. searchValue .. "' not found.")
            end
            return true -- Command handled
        elseif #results > 1 then
            -- Multiple results found, show all and ask to use ID
            local message = "Multiple quests found with '" .. searchValue .. "':"
            for i, result in ipairs(results) do
                message = message .. "\n" .. result[2] .. " (ID: " .. result[1] .. ")"
            end
            message = message .. "\nPlease use '.check quest id <ID>' to check a specific quest."
            if player then
                player:SendBroadcastMessage(message)
            else
                print(message)
            end
            return false -- Command handled
        else
            -- Single result found, proceed normally
            questId = results[1][1]
            questTitle = results[1][2]
            -- Get flags for the found quest
            _, _, questFlags = GetQuestById(questId)
        end
        
    else
        if player then
            player:SendBroadcastMessage("Invalid search type. Use 'id' or 'name'.")
        else
            print("Invalid search type. Use 'id' or 'name'.")
        end
        return true -- Command handled
    end
    
    -- Get quest status for the target player
    local status, explored = GetQuestStatus(targetPlayer, questId)
    local statusText, statusComment = GetQuestStatusText(status)
    
    -- Build response message
    local message = "Quest: " .. questTitle .. " (ID: " .. questId .. ")"
    message = message .. "\nStatus: " .. statusText
    if statusComment and statusComment ~= "" then
        message = message .. "\nComment: " .. statusComment
    end
    
    -- Check and display exploration requirement if quest has exploration flag
    if questFlags and HasExplorationFlag(questFlags) then
        local exploredText = explored == 1 and "Yes" or "No"
        if explored == 0 then
            exploredText = exploredText .. " (you may need to logout to update, not /reload)"
        end
        message = message .. "\nExplored: " .. exploredText
    end
    
    -- Get and display quest chain information
    local prevQuestId, nextQuestId = GetQuestChainInfo(questId)
    
    if prevQuestId ~= 0 then
        local prevQuestName = GetQuestNameById(math.abs(prevQuestId))
        local prevStatus, _ = GetQuestStatus(targetPlayer, math.abs(prevQuestId))
        local prevStatusText = (prevStatus == 1) and "Completed" or "Not Completed"
        
        if prevQuestId > 0 then
            message = message .. "\nRequires Quest: " .. prevQuestName .. " (" .. prevQuestId .. ") - " .. prevStatusText
        else
            message = message .. "\nRequires Quest: " .. prevQuestName .. " (" .. prevQuestId .. ") - " .. prevStatusText
        end
    end
    
    if nextQuestId ~= 0 then
        local nextQuestName = GetQuestNameById(nextQuestId)
        local nextStatus, _ = GetQuestStatus(targetPlayer, nextQuestId)
        local nextStatusText = (nextStatus == 1) and "Completed" or "Not Completed"
        message = message .. "\nOpens Quest: " .. nextQuestName .. " (" .. nextQuestId .. ") - " .. nextStatusText
    end
    
    -- Add target player info if checking another player
    if targetPlayerName then
        local playerStatus = isTargetOffline and " (offline)" or ""
        message = "Player: " .. targetPlayer:GetName() .. playerStatus .. "\n" .. message
    end
    
    if player then
        player:SendBroadcastMessage(message)
    else
        print(message)
    end
    return false -- Command successfully handled, suppress error message
end

-- Register the command handler
RegisterPlayerEvent(42, HandleQuestStatusCommand) -- PLAYER_EVENT_ON_COMMAND
