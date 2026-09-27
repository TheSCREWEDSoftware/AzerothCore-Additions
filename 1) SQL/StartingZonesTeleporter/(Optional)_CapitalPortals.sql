SET @GameobjectEntryOrgrimmar    := 550000;
SET @GameobjectEntryUndercity    := @GameobjectEntryOrgrimmar + 1; -- 550001
SET @GameobjectEntryThunderBluff := @GameobjectEntryOrgrimmar + 2; -- 550002
SET @GameobjectEntrySilvermoon   := @GameobjectEntryOrgrimmar + 3; -- 550003
SET @GameobjectEntryStormwind    := @GameobjectEntryOrgrimmar + 4; -- 550004
SET @GameobjectEntryIronforge    := @GameobjectEntryOrgrimmar + 5; -- 550005
SET @GameobjectEntryDarnassus    := @GameobjectEntryOrgrimmar + 6; -- 550006
SET @GameobjectEntryExodar       := @GameobjectEntryOrgrimmar + 7; -- 550007

SET @GameobjectGUID                        := 1250500;
SET @GameobjectGUIDOrgrimmarValleyOfTrials := @GameobjectGUID + 0; -- 1250500
SET @GameobjectGUIDOrgrimmarSouthSeas      := @GameobjectGUID + 1; -- 1250501
SET @GameobjectGUIDUndercity               := @GameobjectGUID + 2; -- 1250502
SET @GameobjectGUIDThunderBluff            := @GameobjectGUID + 3; -- 1250503
SET @GameobjectGUIDSilvermoon              := @GameobjectGUID + 4; -- 1250504
SET @GameobjectGUIDStormwindNorthshire     := @GameobjectGUID + 5; -- 1250505
SET @GameobjectGUIDStormwindSouthSeas      := @GameobjectGUID + 6; -- 1250506
SET @GameobjectGUIDIronforge               := @GameobjectGUID + 7; -- 1250507
SET @GameobjectGUIDDarnassus               := @GameobjectGUID + 8; -- 1250508
SET @GameobjectGUIDExodar                  := @GameobjectGUID + 9; -- 1250509

SET @GossipTextID := 20001;
SET @GossipText    := "A shimmering portal. Do you wish to step through?";

SET @GossipMenuID              := 12001;
SET @GossipMenuIDOrgrimmar     := @GossipMenuID + 0; -- 12001
SET @GossipMenuIDUndercity     := @GossipMenuID + 1; -- 12002
SET @GossipMenuIDThunderBluff  := @GossipMenuID + 2; -- 12003
SET @GossipMenuIDSilvermoon    := @GossipMenuID + 3; -- 12004
SET @GossipMenuIDStormwind     := @GossipMenuID + 4; -- 12005
SET @GossipMenuIDIronforge     := @GossipMenuID + 5; -- 12006
SET @GossipMenuIDDarnassus     := @GossipMenuID + 6; -- 12007
SET @GossipMenuIDExodar        := @GossipMenuID + 7; -- 12008

DELETE FROM `gameobject_template` WHERE (`entry` = @GameobjectEntryOrgrimmar);
DELETE FROM `gameobject_template` WHERE (`entry` = @GameobjectEntryUndercity);
DELETE FROM `gameobject_template` WHERE (`entry` = @GameobjectEntryThunderBluff);
DELETE FROM `gameobject_template` WHERE (`entry` = @GameobjectEntrySilvermoon);

DELETE FROM `gameobject_template` WHERE (`entry` = @GameobjectEntryStormwind);
DELETE FROM `gameobject_template` WHERE (`entry` = @GameobjectEntryIronforge);
DELETE FROM `gameobject_template` WHERE (`entry` = @GameobjectEntryDarnassus);
DELETE FROM `gameobject_template` WHERE (`entry` = @GameobjectEntryExodar);

INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES
(@GameobjectEntryOrgrimmar,    10, 4395, 'Portal to Orgrimmar',     '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, @GossipMenuIDOrgrimmar,    0, 0, 0, 0, 'SmartGameObjectAI', '', 0),
(@GameobjectEntryUndercity,    10, 4398, 'Portal to Undercity',     '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, @GossipMenuIDUndercity,    0, 0, 0, 0, 'SmartGameObjectAI', '', 0),
(@GameobjectEntryThunderBluff, 10, 4397, 'Portal to Thunder Bluff', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, @GossipMenuIDThunderBluff, 0, 0, 0, 0, 'SmartGameObjectAI', '', 0),
(@GameobjectEntrySilvermoon,   10, 6956, 'Portal to Silvermoon',    '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, @GossipMenuIDSilvermoon,   0, 0, 0, 0, 'SmartGameObjectAI', '', 0),

(@GameobjectEntryStormwind,    10, 4396, 'Portal to Stormwind',     '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, @GossipMenuIDStormwind,    0, 0, 0, 0, 'SmartGameObjectAI', '', 0),
(@GameobjectEntryIronforge,    10, 4394, 'Portal to Ironforge',     '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, @GossipMenuIDIronforge,    0, 0, 0, 0, 'SmartGameObjectAI', '', 0),
(@GameobjectEntryDarnassus,    10, 4393, 'Portal to Darnassus',     '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, @GossipMenuIDDarnassus,    0, 0, 0, 0, 'SmartGameObjectAI', '', 0),
(@GameobjectEntryExodar,       10, 6955, 'Portal to Exodar',        '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, @GossipMenuIDExodar,       0, 0, 0, 0, 'SmartGameObjectAI', '', 0);

DELETE FROM `gameobject_template_addon` WHERE (`entry` = @GameobjectEntryOrgrimmar);
DELETE FROM `gameobject_template_addon` WHERE (`entry` = @GameobjectEntryUndercity);
DELETE FROM `gameobject_template_addon` WHERE (`entry` = @GameobjectEntryThunderBluff);
DELETE FROM `gameobject_template_addon` WHERE (`entry` = @GameobjectEntrySilvermoon);

DELETE FROM `gameobject_template_addon` WHERE (`entry` = @GameobjectEntryStormwind);
DELETE FROM `gameobject_template_addon` WHERE (`entry` = @GameobjectEntryIronforge);
DELETE FROM `gameobject_template_addon` WHERE (`entry` = @GameobjectEntryDarnassus);
DELETE FROM `gameobject_template_addon` WHERE (`entry` = @GameobjectEntryExodar);

INSERT INTO `gameobject_template_addon` (`entry`, `faction`, `flags`, `mingold`, `maxgold`, `artkit0`, `artkit1`, `artkit2`, `artkit3`) VALUES
(@GameobjectEntryOrgrimmar,    1735, 0, 0, 0, 0, 0, 0, 0),
(@GameobjectEntryUndercity,    1735, 0, 0, 0, 0, 0, 0, 0),
(@GameobjectEntryThunderBluff, 1735, 0, 0, 0, 0, 0, 0, 0),
(@GameobjectEntrySilvermoon,   1735, 0, 0, 0, 0, 0, 0, 0),

(@GameobjectEntryStormwind,    1732, 0, 0, 0, 0, 0, 0, 0),
(@GameobjectEntryIronforge,    1732, 0, 0, 0, 0, 0, 0, 0),
(@GameobjectEntryDarnassus,    1732, 0, 0, 0, 0, 0, 0, 0),
(@GameobjectEntryExodar,       1732, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM `npc_text` WHERE (`ID` = @GossipTextID);

INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `BroadcastTextID0`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `BroadcastTextID1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `BroadcastTextID2`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `BroadcastTextID3`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `BroadcastTextID4`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `BroadcastTextID5`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `BroadcastTextID6`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `BroadcastTextID7`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`) VALUES
(@GossipTextID, @GossipText, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM `gossip_menu` WHERE (`MenuID` = @GossipMenuIDOrgrimmar);
DELETE FROM `gossip_menu` WHERE (`MenuID` = @GossipMenuIDUndercity);
DELETE FROM `gossip_menu` WHERE (`MenuID` = @GossipMenuIDThunderBluff);
DELETE FROM `gossip_menu` WHERE (`MenuID` = @GossipMenuIDSilvermoon);

DELETE FROM `gossip_menu` WHERE (`MenuID` = @GossipMenuIDStormwind);
DELETE FROM `gossip_menu` WHERE (`MenuID` = @GossipMenuIDIronforge);
DELETE FROM `gossip_menu` WHERE (`MenuID` = @GossipMenuIDDarnassus);
DELETE FROM `gossip_menu` WHERE (`MenuID` = @GossipMenuIDExodar);

INSERT INTO `gossip_menu` (`MenuID`, `TextID`) VALUES
(@GossipMenuIDOrgrimmar,    @GossipTextID),
(@GossipMenuIDUndercity,    @GossipTextID),
(@GossipMenuIDThunderBluff, @GossipTextID),
(@GossipMenuIDSilvermoon,   @GossipTextID),

(@GossipMenuIDStormwind,    @GossipTextID),
(@GossipMenuIDIronforge,    @GossipTextID),
(@GossipMenuIDDarnassus,    @GossipTextID),
(@GossipMenuIDExodar,       @GossipTextID);

DELETE FROM `gossip_menu_option` WHERE (`MenuID` = @GossipMenuIDOrgrimmar);
DELETE FROM `gossip_menu_option` WHERE (`MenuID` = @GossipMenuIDUndercity);
DELETE FROM `gossip_menu_option` WHERE (`MenuID` = @GossipMenuIDThunderBluff);
DELETE FROM `gossip_menu_option` WHERE (`MenuID` = @GossipMenuIDSilvermoon);

DELETE FROM `gossip_menu_option` WHERE (`MenuID` = @GossipMenuIDStormwind);
DELETE FROM `gossip_menu_option` WHERE (`MenuID` = @GossipMenuIDIronforge);
DELETE FROM `gossip_menu_option` WHERE (`MenuID` = @GossipMenuIDDarnassus);
DELETE FROM `gossip_menu_option` WHERE (`MenuID` = @GossipMenuIDExodar);

INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`) VALUES
(@GossipMenuIDOrgrimmar,    0, 2, 'Orgrimmar',     0, 1, 1, 0, 0, 0, 0, 'Teleport to: Orgrimmar',     0, 0),
(@GossipMenuIDUndercity,    0, 2, 'Undercity',     0, 1, 1, 0, 0, 0, 0, 'Teleport to: Undercity',     0, 0),
(@GossipMenuIDThunderBluff, 0, 2, 'Thunder Bluff', 0, 1, 1, 0, 0, 0, 0, 'Teleport to: Thunder Bluff', 0, 0),
(@GossipMenuIDSilvermoon,   0, 2, 'Silvermoon',    0, 1, 1, 0, 0, 0, 0, 'Teleport to: Silvermoon',    0, 0),

(@GossipMenuIDStormwind,    0, 2, 'Stormwind',     0, 1, 1, 0, 0, 0, 0, 'Teleport to: Stormwind',     0, 0),
(@GossipMenuIDIronforge,    0, 2, 'Ironforge',     0, 1, 1, 0, 0, 0, 0, 'Teleport to: Ironforge',     0, 0),
(@GossipMenuIDDarnassus,    0, 2, 'Darnassus',     0, 1, 1, 0, 0, 0, 0, 'Teleport to: Darnassus',     0, 0),
(@GossipMenuIDExodar,       0, 2, 'Exodar',        0, 1, 1, 0, 0, 0, 0, 'Teleport to: Exodar',        0, 0);

DELETE FROM `smart_scripts` WHERE (`source_type` = 1 AND `entryorguid` = @GameobjectEntryOrgrimmar);
DELETE FROM `smart_scripts` WHERE (`source_type` = 1 AND `entryorguid` = @GameobjectEntryUndercity);
DELETE FROM `smart_scripts` WHERE (`source_type` = 1 AND `entryorguid` = @GameobjectEntryThunderBluff);
DELETE FROM `smart_scripts` WHERE (`source_type` = 1 AND `entryorguid` = @GameobjectEntrySilvermoon);

DELETE FROM `smart_scripts` WHERE (`source_type` = 1 AND `entryorguid` = @GameobjectEntryStormwind);
DELETE FROM `smart_scripts` WHERE (`source_type` = 1 AND `entryorguid` = @GameobjectEntryIronforge);
DELETE FROM `smart_scripts` WHERE (`source_type` = 1 AND `entryorguid` = @GameobjectEntryDarnassus);
DELETE FROM `smart_scripts` WHERE (`source_type` = 1 AND `entryorguid` = @GameobjectEntryExodar);

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@GameobjectEntryOrgrimmar,    1, 0, 1, 62, 0, 100, 0, @GossipMenuIDOrgrimmar,    0, 0, 0, 0, 0, 11, 17609, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 0 Selected - Teleport to Orgrimmar'),
(@GameobjectEntryOrgrimmar,    1, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 0 Selected - Close Gossip'),
(@GameobjectEntryUndercity,    1, 0, 1, 62, 0, 100, 0, @GossipMenuIDUndercity,    0, 0, 0, 0, 0, 11, 17611, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 0 Selected - Teleport to Undercity'),
(@GameobjectEntryUndercity,    1, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 0 Selected - Close Gossip'),
(@GameobjectEntryThunderBluff, 1, 0, 1, 62, 0, 100, 0, @GossipMenuIDThunderBluff, 0, 0, 0, 0, 0, 11, 17610, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 0 Selected - Teleport to Thunder Bluff'),
(@GameobjectEntryThunderBluff, 1, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 0 Selected - Close Gossip'),
(@GameobjectEntrySilvermoon,   1, 0, 1, 62, 0, 100, 0, @GossipMenuIDSilvermoon,   0, 0, 0, 0, 0, 11, 32270, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 0 Selected - Teleport to Silvermoon'),
(@GameobjectEntrySilvermoon,   1, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 0 Selected - Close Gossip'),

(@GameobjectEntryStormwind,    1, 0, 1, 62, 0, 100, 0, @GossipMenuIDStormwind,    0, 0, 0, 0, 0, 11, 17334, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 0 Selected - Teleport to Stormwind'),
(@GameobjectEntryStormwind,    1, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 0 Selected - Close Gossip'),
(@GameobjectEntryIronforge,    1, 0, 1, 62, 0, 100, 0, @GossipMenuIDIronforge,    0, 0, 0, 0, 0, 11, 17607, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 0 Selected - Teleport to Ironforge'),
(@GameobjectEntryIronforge,    1, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 0 Selected - Close Gossip'),
(@GameobjectEntryDarnassus,    1, 0, 1, 62, 0, 100, 0, @GossipMenuIDDarnassus,    0, 0, 0, 0, 0, 11, 17608, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 0 Selected - Teleport to Darnassus'),
(@GameobjectEntryDarnassus,    1, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 0 Selected - Close Gossip'),
(@GameobjectEntryExodar,       1, 0, 1, 62, 0, 100, 0, @GossipMenuIDExodar,       0, 0, 0, 0, 0, 11, 32268, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 0 Selected - Teleport to Exodar'),
(@GameobjectEntryExodar,       1, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 0 Selected - Close Gossip');

-- Horde
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDOrgrimmarValleyOfTrials); -- Valley of Trials (Orc/Troll), Orgrimmar
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDUndercity); -- Deathknell (Undead), Undercity
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDThunderBluff); -- Red Cloud Mesa (Orc/Troll), Thunder Bluff
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDSilvermoon); -- Sunstrider Isle (Blood Elf), Silvermoon
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDOrgrimmarSouthSeas); -- South Seas (Horde), Orgrimmar

-- Alliance
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDStormwindNorthshire); -- Northshire Abbey (Human), Stormwind
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDIronforge); -- Coldridge Valley (Dwarf/Gnome), Ironforge
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDDarnassus); -- Shadowglen (Night Elf), Darnassus
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDExodar); -- Ammen Vale (Draenei), Exodar
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDStormwindSouthSeas); -- South Seas (Alliance), Stormwind

INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES
-- Horde
(@GameobjectGUIDOrgrimmarValleyOfTrials, @GameobjectEntryOrgrimmar, 1, 0, 0, 1, 1, -642.721, -4211.15, 38.1349, 0.102846, 0, 0, 0.0514004, 0.998678, 300, 0, 1, '', NULL, NULL), -- Valley of Trials (Orc/Troll), Orgrimmar
(@GameobjectGUIDUndercity, @GameobjectEntryUndercity, 0, 0, 0, 1, 1, 1838.27, 1626.62, 96.9342, 0.91987, 0, 0, 0.44389, 0.896081, 300, 0, 1, '', NULL, NULL), -- Deathknell (Undead), Undercity
(@GameobjectGUIDThunderBluff, @GameobjectEntryThunderBluff, 1, 0, 0, 1, 1, -2886.91, -207.284, 54.8211, 5.49934, 0, 0, 0.381964, -0.924177, 300, 0, 1, '', NULL, NULL), -- Red Cloud Mesa (Orc/Troll), Thunder Bluff
(@GameobjectGUIDSilvermoon, @GameobjectEntrySilvermoon, 530, 0, 0, 1, 1, 10377.8, -6403.46, 49.7165, 5.60587, 0, 0, 0.33222, -0.943202, 300, 0, 1, '', NULL, NULL), -- Sunstrider Isle (Blood Elf), Silvermoon
(@GameobjectGUIDOrgrimmarSouthSeas, @GameobjectEntryOrgrimmar, 1, 0, 0, 1, 1, -11840.5, -4775.39, 6.1178, 6.06333, 0, 0, 0.109708, -0.993964, 300, 0, 1, '', NULL, NULL), -- South Seas (Horde), Orgrimmar

-- Alliance
(@GameobjectGUIDStormwindNorthshire, @GameobjectEntryStormwind, 0, 0, 0, 1, 1, -8859.66, -194.605, 89.3133, 1.13214, 0, 0, 0.53632, 0.844015, 300, 0, 1, '', NULL, NULL), -- Northshire Abbey (Human), Stormwind
(@GameobjectGUIDIronforge, @GameobjectEntryIronforge, 0, 0, 0, 1, 1, -6213.5, 329.338, 383.728, 3.08378, 0, 0, 0.999582, 0.0288999, 300, 0, 1, '', NULL, NULL), -- Coldridge Valley (Dwarf/Gnome), Ironforge
(@GameobjectGUIDDarnassus, @GameobjectEntryDarnassus, 1, 0, 0, 1, 1, 10332.9, 824.738, 1326.37, 2.46295, 0, 0, 0.94298, 0.332848, 300, 0, 1, '', NULL, NULL), -- Shadowglen (Night Elf), Darnassus
(@GameobjectGUIDExodar, @GameobjectEntryExodar, 530, 0, 0, 1, 1, -3963.11, -13897.4, 100.677, 2.54863, 0, 0, 0.95637, 0.292159, 300, 0, 1, '', NULL, NULL), -- Ammen Vale (Draenei), Exodar
(@GameobjectGUIDStormwindSouthSeas, @GameobjectEntryStormwind, 1, 0, 0, 1, 1, -11850, -4734.25, 6.81418, 1.09956, 0, 0, 0.5225, 0.852639, 300, 0, 1, '', NULL, NULL); -- South Seas (Alliance), Stormwind
