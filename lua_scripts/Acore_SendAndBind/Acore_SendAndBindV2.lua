--
-- Created by IntelliJ IDEA.
-- User: Silvia
-- Date: 21/05/2021
-- Time: 13:16
-- To change this template use File | Settings | File Templates.
-- Originally created by Honey for Azerothcore
-- Modified by Ryan
-- requires ElunaLua module


--Items which are Bind on Equip by default will arrive soulbound in the mail
------------------------------------------------------------------------------------------------
-- ADMIN GUIDE:  -  compile the core with ElunaLua module
--               -  adjust config in this file
--               -  Change the '.send mail' in your webshop to '.senditemandbind'
--               -  add this script to ../lua_scripts/
------------------------------------------------------------------------------------------------

local Config = {}

Config.subject = "Shop Item"
Config.message = ""
Config.minGMRankForSend = 2

------------------------------------------
-- NO ADJUSTMENTS REQUIRED BELOW THIS LINE
------------------------------------------

local function log(line, chatHandler, logToConsole)
    local f = io.open(debug.getinfo(1).source:match("@?(.*/)") .. "/send-and-bind.log", "a")
    f:write(line)
    f:write("\n")
    f:close()

    if logToConsole == nil or logToConsole == true then
        if chatHandler ~= nil then
            if line == "" then
                chatHandler:SendSysMessage("")
            else
                chatHandler:SendSysMessage("[SendAndBind] " .. line)
            end
        else
            if line == "" then
                print("")
            else
                print("[SendAndBind] " .. line)
            end
        end
    end
end

local function onError(err, chatHandler)
    log("Error: " .. err, chatHandler)
end

local function SendAndBind(event, player, command, chatHandler)
    local itemGUID
    local item_id
    local item_name
    local item_amount
    local targetGUID
    local target_name
    local SAB_eventId
    local mailText
    local executedBy

    local commandArray = SAB_splitString(command)

    if commandArray[1] ~= "senditemandbind" and commandArray[1] ~= "sendandbind" then
        return
    end

    if commandArray[1] == "senditemandbind" or commandArray[1] == "sendandbind" then
        -- make sure the player is properly ranked
        if not chatHandler:IsAvailable(Config.minGMRankForSend) then
            return
        end

        if commandArray[2] == nil or commandArray[3] == nil or commandArray[2] == "help" then
            chatHandler:SendSysMessage("Expected Syntax: .senditemandbind $target $itemID [$amount] [by][message]")
            chatHandler:SendSysMessage("Alternative: .sendandbind $target $itemID [$amount] [by][message]")
            chatHandler:SendSysMessage("$target can be either character name or GUID")
            chatHandler:SendSysMessage("Note: [by] parameter only needed for console commands, optional for players")
            return false
        end

        commandArray[2] = commandArray[2]:gsub("[';\\, ]", "")
        commandArray[3] = commandArray[3]:gsub("[';\\, ]", "")
        if commandArray[4] ~= nil then
            commandArray[4] = commandArray[4]:gsub("[';\\, ]", "")
        end

        -- Handle both character name and GUID
        local targetInput = commandArray[2]
        local isNumeric = string.match(targetInput, "^%d+$") -- Check if input is all digits (GUID)
        
        if isNumeric then
            -- Input is a GUID
            targetGUID = tostring(targetInput)
            local targetPlayer = GetPlayerByGUID(targetGUID)
            if targetPlayer == nil then
                -- Player is offline, get name from database
                local result = CharDBQuery("SELECT name FROM characters WHERE guid = " .. targetGUID)
                if result then
                    target_name = targetGUID .. " (" .. result:GetString(0) .. " is offline)"
                else
                    target_name = targetGUID .. " (unknown player is offline)"
                end
            else
                -- Player is online
                target_name = targetGUID .. " (" .. targetPlayer:GetName() .. ")"
            end
        else
            -- Input is a character name - format it properly (first letter uppercase, rest lowercase)
            local formattedName = targetInput:sub(1,1):upper() .. targetInput:sub(2):lower()
            local targetPlayer = GetPlayerByName(formattedName)
            if targetPlayer == nil then
                -- Player is offline, get GUID from database
                local result = CharDBQuery("SELECT guid FROM characters WHERE name = '" .. formattedName .. "'")
                if result then
                    targetGUID = tostring(result:GetUInt32(0))
                    target_name = targetGUID .. " (" .. formattedName .. " is offline)"
                else
                    chatHandler:SendSysMessage("Error: Character '" .. formattedName .. "' not found!")
                    return false
                end
            else
                -- Player is online
                targetGUID = tostring(targetPlayer:GetGUIDLow())
                target_name = targetGUID .. " (" .. targetPlayer:GetName() .. ")"
            end
        end

        item_id = commandArray[3]
        item_name =  item_id .. " (" .. GetItemTemplate(item_id):GetName() .. ")"

        if commandArray[4] == nil then
            item_amount = 1
        else
            item_amount = commandArray[4]
        end

        -- Initialize mailText
        mailText = ""
        
        -- Handle parameter parsing based on who runs the command
        if player == nil then
            -- Console command - position 5 should be executor name, position 6+ should be message
            if commandArray[5] ~= nil then
                executedBy = "console (" .. commandArray[5] .. ")"
                -- Message starts from position 6
                for index,value in ipairs(commandArray) do
                    if index >= 6 then
                        if mailText == "" then
                            mailText = commandArray[index].." "
                        else
                            mailText = mailText..commandArray[index].." "
                        end
                    end
                end
            else
                executedBy = "console"
            end
        else
            -- Player command - position 5+ should be message (no "by" parameter needed)
            executedBy = player:GetName()
            -- Message starts from position 5
            if commandArray[5] ~= nil then
                for index,value in ipairs(commandArray) do
                    if index >= 5 then
                        if mailText == "" then
                            mailText = commandArray[index].." "
                        else
                            mailText = mailText..commandArray[index].." "
                        end
                    end
                end
            end
        end

        log("", chatHandler, false)
        log("[====" ..  os.date("%m-%d-%Y %I:%M %p") .. "====]", chatHandler, false)
        log("targetGUID = " .. target_name, chatHandler)
        log("item_id = " .. item_name, chatHandler)
        log("item_amount = " .. item_amount, chatHandler)
        log("executed by: " .. executedBy, chatHandler)
        if mailText ~= "" then
            log("message: " .. mailText:gsub("%s+$", ""), chatHandler)
        end
        log("", chatHandler)

        local success
        success, itemGUID = xpcall(SendMail,
            function(err)
                onError(err, chatHandler)
            end,
            Config.subject, Config.message..mailText, targetGUID, 0, 61, 15, 0, 0, item_id, item_amount)
        if not success then
            return false
        end
        log("Sent mail, itemGUID = " .. tonumber(itemGUID), chatHandler)

        local recipient = GetPlayerByGUID(targetGUID)
        if recipient == nil then
            -- Player is offline
            local sql = 'UPDATE `item_instance` SET `flags` = `flags` | 1 WHERE `guid` = '..tonumber(itemGUID)..';'
            log(sql, chatHandler)
            CharDBExecute(sql)

            sql = 'UPDATE `item_instance` SET `owner_guid` = '..tonumber(targetGUID)..' WHERE `guid` = '..tonumber(itemGUID)..';'
            log(sql, chatHandler)
            CharDBExecute(sql)

            log("Executed UPDATE queries.", chatHandler)
        else
            -- Player is online
            local item = recipient:GetMailItem(itemGUID)
            if item == nil then
                onError("Player:GetMailItem returned nil item reference.")
                return false
            end

            item:SetOwner(recipient)
            item:SetBinding(true)
            log("Executed SetOwner and SetBinding.", chatHandler)
            
            -- Notify the player they received mail
            recipient:SendBroadcastMessage("You've received mail from the customer support.")
        end

        return false
    end
end


local PLAYER_EVENT_ON_COMMAND = 42            --(event, player, command)
RegisterPlayerEvent(PLAYER_EVENT_ON_COMMAND, SendAndBind)

function SAB_splitString(inputstr, seperator)
    if seperator == nil then
        seperator = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..seperator.."]+)") do
        table.insert(t, str)
    end
    return t
end
