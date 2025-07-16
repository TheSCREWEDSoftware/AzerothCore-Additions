--
-- Self Services Script made for ChromieCraft PTR
-- Uses the existing GM commands for customise, race and faction changes.
-- Commands: .selfcustomise | .selfcustomize | .selfchangerace | .selfchangefaction
-- Inspired by original script from 55Honey (https://github.com/55Honey)
--

-- 1 = Enable | 0 = Disable
local ENABLE_LOGGING = 0

-- Get the current script filename dynamically and removes lua extension for log file
local scriptName = debug.getinfo(1, "S").source:match("([^/\\]+)$") or "self_services.lua"
local logFileName = scriptName:match("(.+)%.lua$") or scriptName:match("(.+)%.") or scriptName

-- Logging function
local function log(line, player)
    if ENABLE_LOGGING ~= 1 then
        return  -- If Logging disabled, skip this
    end
    
    local f = io.open(debug.getinfo(1).source:match("@?(.*/)") .. "/" .. logFileName .. ".log", "a")
    if f then
        -- If it's just a newline, removes the timestamp
        if line == "" then
            f:write("\n")
        else
            local logEntry = "[" .. os.date("%m-%d-%Y %I:%M %p") .. "] "
            
            -- Prefix for system/eluna logs will have "Console Log: "
            if not player then
                logEntry = logEntry .. "Console Log: "
            end
            
            logEntry = logEntry .. line
            
            -- Adds the player name, lowguid, account name and account id
            if player then
                local playerName = player:GetName()
                local playerGuid = player:GetGUIDLow()
                local accountName = player:GetAccountName() or "Unknown"
                local accountId = player:GetAccountId() or "Unknown"
                
                logEntry = logEntry .. " | " .. playerName .. " (GUID: " .. playerGuid .. ") from " .. accountName .. " (Account ID: " .. accountId .. ")"
            end
            
            f:write(logEntry .. "\n")
        end
        f:close()
    end
    
    -- If it's an empty line do not print for the worldserver
    if line ~= "" then
        print("[SelfServices] " .. line)
    end
end

-- Function to apply character service using server commands
local function ApplyService(player, commandName, serviceName)
    local playerGuid = player:GetGUIDLow()
    local playerName = player:GetName()
    
    -- Execute the server command
    local serverCommand = string.format("%s %s", commandName, playerName)
    log("Executing: " .. serverCommand, player)
    
    -- Execute via both methods to ensure it works
    -- Note: Currently implemented/using RunCommand() which works at server level and bypasses player permissions
    RunCommand(serverCommand)
    local playerCommand = string.format(".%s %s", commandName, playerName)
    -- Skip player:RunCommand() to avoid permission errors
    
    -- Save character data then notify player
    RunCommand(string.format("save %s", playerName))
    log(playerName .. " used " .. serviceName, player)
    
    player:SendBroadcastMessage("Success! " .. serviceName .. " has been applied.")
    player:SendBroadcastMessage("You will be disconnected in 5 seconds...")
    
    -- Kick player after 5 seconds
    CreateLuaEvent(function()
        local currentPlayer = GetPlayerByGUID(playerGuid)
        if currentPlayer and currentPlayer:IsInWorld() then
            currentPlayer:KickPlayer()
        end
    end, 5000, 1) -- value (default: 5000) in milliesecond(s) value / 1000 = value (default: 5) in seconds
    
    log("") -- Add spacing after complete command execution
    
    return true
end

-- Main command handler function
local function HandleSelfServiceCommand(event, player, command, chatHandler)
    -- Parse the command first, so it can check if it's our command or not
    local cmd = command:lower():match("^(%S+)")
    
    -- Only handle defined commands (so it doesn't hijack the entire command handler)
    if cmd ~= "selfcustomise" and cmd ~= "selfcustomize" and cmd ~= "selfchangerace" and cmd ~= "selfchangefaction" then
        -- Not our command, let other handlers process it
        return true
    end
    
    -- checks if the commands are ran by the worldserver, if not a player it complains
    if not player then
        if chatHandler then
            chatHandler:SendSysMessage("This command can only be used in-game by players.")
        else
            print("Self-service commands can only be used in-game by players.")
        end
        return false
    end
    
    if cmd == "selfcustomise" or cmd == "selfcustomize" then
        ApplyService(player, "character customize", "Character Customization")
        return false
        
    elseif cmd == "selfchangerace" then
        ApplyService(player, "character changerace", "Race Change")
        return false
        
    elseif cmd == "selfchangefaction" then
        ApplyService(player, "character changefaction", "Faction Change")
        return false
    end
    
    -- Never should get here, in the case it does, just prevention
    return true
end

-- Register the command handler
local PLAYER_EVENT_ON_COMMAND = 42
RegisterPlayerEvent(PLAYER_EVENT_ON_COMMAND, HandleSelfServiceCommand)

log("Self Services (" .. scriptName .. ") script loaded successfully")
log("Available commands: .selfcustomise | .selfcustomize | .selfchangerace | .selfchangefaction")
log("") -- Add spacing after startup logs
