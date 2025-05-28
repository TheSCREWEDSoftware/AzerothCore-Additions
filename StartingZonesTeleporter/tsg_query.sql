SET @GossipTextID := 20000;
SET @GossipText := "There you are! Where do you need to be teleported?";
SET @GossipMenuID := 12000;
SET @GossipMenuOptionID0 := 0;
SET @GossipMenuOptionID1 := @GossipMenuOptionID0+1;
SET @GossipMenuOptionID2 := @GossipMenuOptionID0+2;
SET @GossipMenuOptionID3 := @GossipMenuOptionID0+3;
SET @GossipMenuOptionID4 := @GossipMenuOptionID0+4;
SET @GossipMenuOptionID5 := @GossipMenuOptionID0+5;
SET @GossipMenuOptionID6 := @GossipMenuOptionID0+6;
SET @GossipMenuOptionID7 := @GossipMenuOptionID0+7;
SET @GossipMenuOptionID8 := @GossipMenuOptionID0+8;
SET @GossipMenuOptionIcon := 2;
SET @GossipMenuOptionTextDefaultConfirmation := "Teleport to: ";
SET @GossipMenuOptionText0 := "Valley of Trials";
SET @GossipMenuOptionText1 := "Deathknell";
SET @GossipMenuOptionText2 := "Red Cloud Mesa";
SET @GossipMenuOptionText3 := "Sunstrider Isle";
SET @GossipMenuOptionText4 := "Northshire Abbey";
SET @GossipMenuOptionText5 := "Coldridge Valley";
SET @GossipMenuOptionText6 := "Shadowglen";
SET @GossipMenuOptionText7 := "Ammen Vale";
SET @GossipMenuOptionText8 := "South Seas";
SET @GossipMenuOptionTextConfirmation0 := (CONCAT(@GossipMenuOptionTextDefaultConfirmation, @GossipMenuOptionText0));
SET @GossipMenuOptionTextConfirmation1 := (CONCAT(@GossipMenuOptionTextDefaultConfirmation, @GossipMenuOptionText1));
SET @GossipMenuOptionTextConfirmation2 := (CONCAT(@GossipMenuOptionTextDefaultConfirmation, @GossipMenuOptionText2));
SET @GossipMenuOptionTextConfirmation3 := (CONCAT(@GossipMenuOptionTextDefaultConfirmation, @GossipMenuOptionText3));
SET @GossipMenuOptionTextConfirmation4 := (CONCAT(@GossipMenuOptionTextDefaultConfirmation, @GossipMenuOptionText4));
SET @GossipMenuOptionTextConfirmation5 := (CONCAT(@GossipMenuOptionTextDefaultConfirmation, @GossipMenuOptionText5));
SET @GossipMenuOptionTextConfirmation6 := (CONCAT(@GossipMenuOptionTextDefaultConfirmation, @GossipMenuOptionText6));
SET @GossipMenuOptionTextConfirmation7 := (CONCAT(@GossipMenuOptionTextDefaultConfirmation, @GossipMenuOptionText7));
SET @GossipMenuOptionTextConfirmation8 := (CONCAT(@GossipMenuOptionTextDefaultConfirmation, @GossipMenuOptionText8));

SET @ConditionGossipMenuOptionDefaultMessage := "Only show teleport: ";
SET @ConditionGossipMenuOptionFactionHorde := " for Horde";
SET @ConditionGossipMenuOptionFactionAlliance := " for Alliance";
SET @ConditionGossipMenuOptionComment0 := (CONCAT(@ConditionGossipMenuOptionDefaultMessage, @GossipMenuOptionText0, @ConditionGossipMenuOptionFactionHorde));
SET @ConditionGossipMenuOptionComment1 := (CONCAT(@ConditionGossipMenuOptionDefaultMessage, @GossipMenuOptionText1, @ConditionGossipMenuOptionFactionHorde));
SET @ConditionGossipMenuOptionComment2 := (CONCAT(@ConditionGossipMenuOptionDefaultMessage, @GossipMenuOptionText2, @ConditionGossipMenuOptionFactionHorde));
SET @ConditionGossipMenuOptionComment3 := (CONCAT(@ConditionGossipMenuOptionDefaultMessage, @GossipMenuOptionText3, @ConditionGossipMenuOptionFactionHorde));
SET @ConditionGossipMenuOptionComment4 := (CONCAT(@ConditionGossipMenuOptionDefaultMessage, @GossipMenuOptionText4, @ConditionGossipMenuOptionFactionAlliance));
SET @ConditionGossipMenuOptionComment5 := (CONCAT(@ConditionGossipMenuOptionDefaultMessage, @GossipMenuOptionText5, @ConditionGossipMenuOptionFactionAlliance));
SET @ConditionGossipMenuOptionComment6 := (CONCAT(@ConditionGossipMenuOptionDefaultMessage, @GossipMenuOptionText6, @ConditionGossipMenuOptionFactionAlliance));
SET @ConditionGossipMenuOptionComment7 := (CONCAT(@ConditionGossipMenuOptionDefaultMessage, @GossipMenuOptionText7, @ConditionGossipMenuOptionFactionAlliance));

SET @CreatureEntry := 450000;
SET @CreatureName := "Eek Smalls";
SET @CreatureSubName := "B.I.G. Travel Agency";
SET @CreatureModelID := 30712;

SET @SmartAIMapID0 := 1;
SET @SmartAITargetX0 := -590.846;
SET @SmartAITargetY0 := -4110.44;
SET @SmartAITargetZ0 := 43.9789;
SET @SmartAITargetO0 := 4.9409;
SET @SmartAIMapID1 := 0;
SET @SmartAITargetX1 := 1849.19;
SET @SmartAITargetY1 := 1561.88;
SET @SmartAITargetZ1 := 94.8201;
SET @SmartAITargetO1 := 1.4029;
SET @SmartAIMapID2 := 1;
SET @SmartAITargetX2 := -2849.34;
SET @SmartAITargetY2 := -254.493;
SET @SmartAITargetZ2 := 53.9177;
SET @SmartAITargetO2 := 2.98216;
SET @SmartAIMapID3 := 530;
SET @SmartAITargetX3 := 10334.2;
SET @SmartAITargetY3 := -6397.3;
SET @SmartAITargetZ3 := 38.5289;
SET @SmartAITargetO3 := 1.14875;
SET @SmartAIMapID4 := 0;
SET @SmartAITargetX4 := -8930.77;
SET @SmartAITargetY4 := -161.451;
SET @SmartAITargetZ4 := 81.0316;
SET @SmartAITargetO4 := 2.75393;
SET @SmartAIMapID5 := 0;
SET @SmartAITargetX5 := -6208.39;
SET @SmartAITargetY5 := 310.34;
SET @SmartAITargetZ5 := 388.397;
SET @SmartAITargetO5 := 2.38868;
SET @SmartAIMapID6 := 1;
SET @SmartAITargetX6 := 10300.5;
SET @SmartAITargetY6 := 831.158;
SET @SmartAITargetZ6 := 1328.14;
SET @SmartAITargetO6 := 6.12291;
SET @SmartAIMapID7 := 530;
SET @SmartAITargetX7 := -3948.98;
SET @SmartAITargetY7 := -13955.2;
SET @SmartAITargetZ7 := 100.746;
SET @SmartAITargetO7 := 2.06004;
SET @SmartAIMapID8 := 1;
SET @SmartAITargetX8 := -11858.2;
SET @SmartAITargetY8 := -4759.62;
SET @SmartAITargetZ8 := 6.1694;
SET @SmartAITargetO8 := 0.233273;

DELETE FROM `npc_text` WHERE (`ID` = @GossipTextID);
DELETE FROM `gossip_menu` WHERE (`MenuID` = @GossipMenuID);
DELETE FROM `gossip_menu_option` WHERE (`MenuID` = @GossipMenuID);

DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId` = 15 AND `SourceGroup` = @GossipMenuID);

DELETE FROM `creature_template` WHERE (`entry` = @CreatureEntry);
DELETE FROM `creature_template_model` WHERE (`CreatureID` = @CreatureEntry);

DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = @CreatureEntry);

INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `BroadcastTextID0`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `BroadcastTextID1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `BroadcastTextID2`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `BroadcastTextID3`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `BroadcastTextID4`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `BroadcastTextID5`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `BroadcastTextID6`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `BroadcastTextID7`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`) VALUES
(@GossipTextID, @GossipText, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

INSERT INTO `gossip_menu` (`MenuID`, `TextID`) VALUES
(@GossipMenuID, @GossipTextID);

INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`) VALUES
(@GossipMenuID, @GossipMenuOptionID0, @GossipMenuOptionIcon, @GossipMenuOptionText0, 0, 1, 1, 0, 0, 0, 0, @GossipMenuOptionTextConfirmation0, 0, 0),
(@GossipMenuID, @GossipMenuOptionID1, @GossipMenuOptionIcon, @GossipMenuOptionText1, 0, 1, 1, 0, 0, 0, 0, @GossipMenuOptionTextConfirmation1, 0, 0),
(@GossipMenuID, @GossipMenuOptionID2, @GossipMenuOptionIcon, @GossipMenuOptionText2, 0, 1, 1, 0, 0, 0, 0, @GossipMenuOptionTextConfirmation2, 0, 0),
(@GossipMenuID, @GossipMenuOptionID3, @GossipMenuOptionIcon, @GossipMenuOptionText3, 0, 1, 1, 0, 0, 0, 0, @GossipMenuOptionTextConfirmation3, 0, 0),
(@GossipMenuID, @GossipMenuOptionID4, @GossipMenuOptionIcon, @GossipMenuOptionText4, 0, 1, 1, 0, 0, 0, 0, @GossipMenuOptionTextConfirmation4, 0, 0),
(@GossipMenuID, @GossipMenuOptionID5, @GossipMenuOptionIcon, @GossipMenuOptionText5, 0, 1, 1, 0, 0, 0, 0, @GossipMenuOptionTextConfirmation5, 0, 0),
(@GossipMenuID, @GossipMenuOptionID6, @GossipMenuOptionIcon, @GossipMenuOptionText6, 0, 1, 1, 0, 0, 0, 0, @GossipMenuOptionTextConfirmation6, 0, 0),
(@GossipMenuID, @GossipMenuOptionID7, @GossipMenuOptionIcon, @GossipMenuOptionText7, 0, 1, 1, 0, 0, 0, 0, @GossipMenuOptionTextConfirmation7, 0, 0),
(@GossipMenuID, @GossipMenuOptionID8, @GossipMenuOptionIcon, @GossipMenuOptionText8, 0, 1, 1, 0, 0, 0, 0, @GossipMenuOptionTextConfirmation8, 0, 0);

INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, @GossipMenuID, @GossipMenuOptionID0, 0, 0, 6, 0, 67, 0, 0, 0, 0, 0, '', @ConditionGossipMenuOptionComment0),
(15, @GossipMenuID, @GossipMenuOptionID1, 0, 0, 6, 0, 67, 0, 0, 0, 0, 0, '', @ConditionGossipMenuOptionComment1),
(15, @GossipMenuID, @GossipMenuOptionID2, 0, 0, 6, 0, 67, 0, 0, 0, 0, 0, '', @ConditionGossipMenuOptionComment2),
(15, @GossipMenuID, @GossipMenuOptionID3, 0, 0, 6, 0, 67, 0, 0, 0, 0, 0, '', @ConditionGossipMenuOptionComment3),
(15, @GossipMenuID, @GossipMenuOptionID4, 0, 0, 6, 0, 469, 0, 0, 0, 0, 0, '', @ConditionGossipMenuOptionComment4),
(15, @GossipMenuID, @GossipMenuOptionID5, 0, 0, 6, 0, 469, 0, 0, 0, 0, 0, '', @ConditionGossipMenuOptionComment5),
(15, @GossipMenuID, @GossipMenuOptionID6, 0, 0, 6, 0, 469, 0, 0, 0, 0, 0, '', @ConditionGossipMenuOptionComment6),
(15, @GossipMenuID, @GossipMenuOptionID7, 0, 0, 6, 0, 469, 0, 0, 0, 0, 0, '', @ConditionGossipMenuOptionComment7);

INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@CreatureEntry, 0, 0, 0, 0, 0, @CreatureName, @CreatureSubName, '', @GossipMenuID, 1, 80, 2, 35, 1, 1, 1.14286, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, '', 0);

INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(@CreatureEntry, 0, @CreatureModelID, 1, 1, 0);

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@CreatureEntry, 0, 0, 1, 62, 0, 100, 0, @GossipMenuID, @GossipMenuOptionID0, 0, 0, 0, 0, 62, @SmartAIMapID0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, @SmartAITargetX0, @SmartAITargetY0, @SmartAITargetZ0, @SmartAITargetO0, 'On Gossip Option 0 Selected - Teleport to Valley of Trials'),
(@CreatureEntry, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 0 Selected - Close Gossip'),
(@CreatureEntry, 0, 2, 3, 62, 0, 100, 0, @GossipMenuID, @GossipMenuOptionID1, 0, 0, 0, 0, 62, @SmartAIMapID1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, @SmartAITargetX1, @SmartAITargetY1, @SmartAITargetZ1, @SmartAITargetO1, 'On Gossip Option 0 Selected - Teleport Deathknell'),
(@CreatureEntry, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 1 Selected - Close Gossip'),
(@CreatureEntry, 0, 4, 5, 62, 0, 100, 0, @GossipMenuID, @GossipMenuOptionID2, 0, 0, 0, 0, 62, @SmartAIMapID2, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, @SmartAITargetX2, @SmartAITargetY2, @SmartAITargetZ2, @SmartAITargetO2, 'On Gossip Option 0 Selected - Teleport Red Cloud mesa'),
(@CreatureEntry, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 2 Selected - Close Gossip'),
(@CreatureEntry, 0, 6, 7, 62, 0, 100, 0, @GossipMenuID, @GossipMenuOptionID3, 0, 0, 0, 0, 62, @SmartAIMapID3, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, @SmartAITargetX3, @SmartAITargetY3, @SmartAITargetZ3, @SmartAITargetO3, 'On Gossip Option 0 Selected - Teleport Sunstrider Isle'),
(@CreatureEntry, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 3 Selected - Close Gossip'),
(@CreatureEntry, 0, 8, 9, 62, 0, 100, 0, @GossipMenuID, @GossipMenuOptionID4, 0, 0, 0, 0, 62, @SmartAIMapID4, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, @SmartAITargetX4, @SmartAITargetY4, @SmartAITargetZ4, @SmartAITargetO4, 'On Gossip Option 0 Selected - Teleport Northshire Abbey'),
(@CreatureEntry, 0, 9, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 4 Selected - Close Gossip'),
(@CreatureEntry, 0, 10, 11, 62, 0, 100, 0, @GossipMenuID, @GossipMenuOptionID5, 0, 0, 0, 0, 62, @SmartAIMapID5, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, @SmartAITargetX5, @SmartAITargetY5, @SmartAITargetZ5, @SmartAITargetO5, 'On Gossip Option 0 Selected - Teleport Coldridge Valley'),
(@CreatureEntry, 0, 11, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 5 Selected - Close Gossip'),
(@CreatureEntry, 0, 12, 13, 62, 0, 100, 0, @GossipMenuID, @GossipMenuOptionID6, 0, 0, 0, 0, 62, @SmartAIMapID6, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, @SmartAITargetX6, @SmartAITargetY6, @SmartAITargetZ6, @SmartAITargetO6, 'On Gossip Option 0 Selected - Teleport Shadowglen'),
(@CreatureEntry, 0, 13, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 6 Selected - Close Gossip'),
(@CreatureEntry, 0, 14, 15, 62, 0, 100, 0, @GossipMenuID, @GossipMenuOptionID7, 0, 0, 0, 0, 62, @SmartAIMapID7, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, @SmartAITargetX7, @SmartAITargetY7, @SmartAITargetZ7, @SmartAITargetO7, 'On Gossip Option 0 Selected - Teleport Ammen Vale'),
(@CreatureEntry, 0, 15, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 7 Selected - Close Gossip'),
(@CreatureEntry, 0, 16, 17, 62, 0, 100, 0, @GossipMenuID, @GossipMenuOptionID8, 0, 0, 0, 0, 62, @SmartAIMapID8, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, @SmartAITargetX8, @SmartAITargetY8, @SmartAITargetZ8, @SmartAITargetO8, 'On Gossip Option 0 Selected - Teleport South Seas'),
(@CreatureEntry, 0, 17, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Option 8 Selected - Close Gossip');
