-- Horde
SET @GameobjectEntryOrgrimmar    := 550100;
SET @GameobjectEntryUndercity    := @GameobjectEntryOrgrimmar + 1; -- 550101
SET @GameobjectEntryThunderBluff := @GameobjectEntryOrgrimmar + 2; -- 550102
SET @GameobjectEntrySilvermoon   := @GameobjectEntryOrgrimmar + 3; -- 550103

-- Alliance
SET @GameobjectEntryStormwind    := @GameobjectEntryOrgrimmar + 4; -- 550104
SET @GameobjectEntryIronforge    := @GameobjectEntryOrgrimmar + 5; -- 550105
SET @GameobjectEntryDarnassus    := @GameobjectEntryOrgrimmar + 6; -- 550106
SET @GameobjectEntryExodar       := @GameobjectEntryOrgrimmar + 7; -- 550107

-- Horde
SET @GameobjectGUIDOrgrimmar      := 1250600;
SET @GameobjectGUIDUndercity      := @GameobjectGUIDOrgrimmar + 1; -- 1250601
SET @GameobjectGUIDThunderBluff   := @GameobjectGUIDOrgrimmar + 2; -- 1250602
SET @GameobjectGUIDSilvermoon     := @GameobjectGUIDOrgrimmar + 3; -- 1250603
SET @GameobjectGUIDOrgrimmarExtra := @GameobjectGUIDOrgrimmar + 4; -- 1250604

-- Alliance
SET @GameobjectGUIDStormwind      := @GameobjectGUIDOrgrimmar + 5; -- 1250605
SET @GameobjectGUIDIronforge      := @GameobjectGUIDOrgrimmar + 6; -- 1250606
SET @GameobjectGUIDDarnassus      := @GameobjectGUIDOrgrimmar + 7; -- 1250607
SET @GameobjectGUIDExodar         := @GameobjectGUIDOrgrimmar + 8; -- 1250608
SET @GameobjectGUIDExodarExtra    := @GameobjectGUIDOrgrimmar + 9; -- 1250609

-- Horde
DELETE FROM `gameobject_template` WHERE (`entry` = @GameobjectEntryOrgrimmar);
DELETE FROM `gameobject_template` WHERE (`entry` = @GameobjectEntryUndercity);
DELETE FROM `gameobject_template` WHERE (`entry` = @GameobjectEntryThunderBluff);
DELETE FROM `gameobject_template` WHERE (`entry` = @GameobjectEntrySilvermoon);

-- Alliance
DELETE FROM `gameobject_template` WHERE (`entry` = @GameobjectEntryStormwind);
DELETE FROM `gameobject_template` WHERE (`entry` = @GameobjectEntryIronforge);
DELETE FROM `gameobject_template` WHERE (`entry` = @GameobjectEntryDarnassus);
DELETE FROM `gameobject_template` WHERE (`entry` = @GameobjectEntryExodar);

INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES
-- Horde
(@GameobjectEntryOrgrimmar,    19, 2128, 'Mailbox', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0),
(@GameobjectEntryUndercity,    19, 2128, 'Mailbox', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0),
(@GameobjectEntryThunderBluff, 19, 2128, 'Mailbox', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0),
(@GameobjectEntrySilvermoon,   19, 6870, 'Mailbox', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0),

-- Alliance
(@GameobjectEntryStormwind,    19, 1907, 'Mailbox', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0),
(@GameobjectEntryIronforge,    19, 1947, 'Mailbox', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0),
(@GameobjectEntryDarnassus,    19, 1948, 'Mailbox', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0),
(@GameobjectEntryExodar,       19, 7013, 'Mailbox', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0);

-- Horde
DELETE FROM `gameobject_template_addon` WHERE (`entry` = @GameobjectEntryOrgrimmar);
DELETE FROM `gameobject_template_addon` WHERE (`entry` = @GameobjectEntryUndercity);
DELETE FROM `gameobject_template_addon` WHERE (`entry` = @GameobjectEntryThunderBluff);
DELETE FROM `gameobject_template_addon` WHERE (`entry` = @GameobjectEntrySilvermoon);

-- Alliance
DELETE FROM `gameobject_template_addon` WHERE (`entry` = @GameobjectEntryStormwind);
DELETE FROM `gameobject_template_addon` WHERE (`entry` = @GameobjectEntryIronforge);
DELETE FROM `gameobject_template_addon` WHERE (`entry` = @GameobjectEntryDarnassus);
DELETE FROM `gameobject_template_addon` WHERE (`entry` = @GameobjectEntryExodar);

INSERT INTO `gameobject_template_addon` (`entry`, `faction`, `flags`, `mingold`, `maxgold`, `artkit0`, `artkit1`, `artkit2`, `artkit3`) VALUES
-- Horde
(@GameobjectEntryOrgrimmar,    29,   0, 0, 0, 0, 0, 0, 0),
(@GameobjectEntryUndercity,    68,   0, 0, 0, 0, 0, 0, 0),
(@GameobjectEntryThunderBluff, 104,  0, 0, 0, 0, 0, 0, 0),
(@GameobjectEntrySilvermoon,   1604, 0, 0, 0, 0, 0, 0, 0),

-- Alliance
(@GameobjectEntryStormwind,    12,   0, 0, 0, 0, 0, 0, 0),
(@GameobjectEntryIronforge,    55,   0, 0, 0, 0, 0, 0, 0),
(@GameobjectEntryDarnassus,    80,   0, 0, 0, 0, 0, 0, 0),
(@GameobjectEntryExodar,       1638, 0, 0, 0, 0, 0, 0, 0);

-- Horde
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDOrgrimmar); -- Valley of Trials (Faction: Orgrimmar [76])
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDUndercity); -- Deathknell (Faction: Undercity [68])
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDThunderBluff); -- Red Cloud Mesa (Faction: Thunder Bluff [81])
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDSilvermoon); -- Sunstrider Isle (Faction: Silvermoon [911])
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDOrgrimmarExtra); -- Sen'jin Village (Faction: Orgrimmar [76])

-- Alliance
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDStormwind); -- Northshire Abbey (Faction: Stormwind [72])
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDIronforge); -- Coldridge Valley (Faction: Ironforge [47])
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDDarnassus); -- Shadowglen (Faction: Darnassus [69])
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDExodar); -- Ammen Vale, Draenei Spawn (Faction: Exodar [930])
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDExodarExtra); -- Ammen Vale, Crash Site (Faction: Exodar [930])

INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES
-- Horde
(@GameobjectGUIDOrgrimmar, @GameobjectEntryOrgrimmar, 1, 0, 0, 1, 1, -598.171, -4205.66, 38.9502, 3.49579, 0, 0, 0.984359, -0.176175, 300, 0, 1, '', NULL, NULL), -- Valley of Trials (Faction: Orgrimmar [76])
(@GameobjectGUIDUndercity, @GameobjectEntryUndercity, 0, 0, 0, 1, 1, 1849.84, 1610.16, 95.6224, 2.74593, 0, 0, 0.980495, 0.196543, 300, 0, 1, '', NULL, NULL), -- Deathknell (Faction: Undercity [68])
(@GameobjectGUIDThunderBluff, @GameobjectEntryThunderBluff, 1, 0, 0, 1, 1, -2887.13, -226.826, 53.9147, 5.23624, 0, 0, 0.499889, -0.86609, 300, 0, 1, '', NULL, NULL), -- Red Cloud Mesa (Faction: Thunder Bluff [81])
(@GameobjectGUIDSilvermoon, @GameobjectEntrySilvermoon, 530, 0, 0, 1, 1, 10347.6, -6386.46, 38.5275, 4.94801, 0, 0, 0.619094, -0.785317, 300, 0, 1, '', NULL, NULL), -- Sunstrider Isle (Faction: Silvermoon [911])
(@GameobjectGUIDOrgrimmarExtra, @GameobjectEntryOrgrimmar, 1, 0, 0, 1, 1, -822.231, -4886.06, 19.4205, 3.74709, 0, 0, 0.954521, -0.298143, 300, 0, 1, '', NULL, NULL), -- Sen'jin Village (Faction: Orgrimmar [76])

-- Alliance
(@GameobjectGUIDStormwind, @GameobjectEntryStormwind, 0, 0, 0, 1, 1, -8940.91, -118.573, 82.6885, 3.17413, 0, 0, 0.999868, -0.0162704, 300, 0, 1, '', NULL, NULL), -- Northshire Abbey (Faction: Stormwind [72])
(@GameobjectGUIDIronforge, @GameobjectEntryIronforge, 0, 0, 0, 1, 1, -6223.8, 342.71, 383.291, 3.6953, 0, 0, 0.96192, -0.27333, 300, 0, 1, '', NULL, NULL), -- Coldridge Valley (Faction: Ironforge [47])
(@GameobjectGUIDDarnassus, @GameobjectEntryDarnassus, 1, 0, 0, 1, 1, 10326.7, 820.863, 1326.47, 5.59278, 0, 0, 0.338388, -0.941007, 300, 0, 1, '', NULL, NULL), -- Shadowglen (Faction: Darnassus [69])
(@GameobjectGUIDExodar, @GameobjectEntryExodar, 530, 0, 0, 1, 1, -3970.05, -13926.6, 100.205, 5.9494, 0, 0, 0.166119, -0.986106, 300, 0, 1, '', NULL, NULL), -- Ammen Vale, Draenei Spawn (Faction: Exodar [930])
(@GameobjectGUIDExodarExtra, @GameobjectEntryExodar, 530, 0, 0, 1, 1, -4114.99, -13754.9, 73.5099, 2.82746, 0, 0, 0.98769, 0.156423, 300, 0, 1, '', NULL, NULL); -- Ammen Vale, Crash Site (Faction: Exodar [930])
