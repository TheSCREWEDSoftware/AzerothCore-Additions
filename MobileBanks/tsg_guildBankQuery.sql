SET
@ObjectEntry := 450500,
@ObjectName := "Mobile Guild Bank",
@ObjectModel := 259,
@ObjectScale := 0.50,

@GossipTextID := 21000,
@GossipText := "What service do you need?",
@GossipMenuID := 11000,
-- Missing Options for Guild Bank or normal Bank
-- SMART_AI for the chosen unit via gossip to spawn the gameobject with a dispawn of a chosen timer (60?, 120?) with an off-set
-- Conditions? for a "cooldown" the gossip can be used? not sure if possible.

@CreatureEntry := 32841;

DELETE FROM `gameobject_template` WHERE (`entry` = @ObjectEntry);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES
(@ObjectEntry, 34, @ObjectModel, 'Guild Vault', '', '', '', @ObjectScale, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', NULL);

UPDATE `creature_template` SET `npcflag` = `npcflag` | 1, `AIName` = 'SmartAI' WHERE `entry` = @CreatureEntry;
