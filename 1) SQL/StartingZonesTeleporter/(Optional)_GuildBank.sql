-- Horde
SET @GameobjectEntryOrgrimmar    := 550200;
SET @GameobjectEntryUndercity    := @GameobjectEntryOrgrimmar + 1; -- 550201
SET @GameobjectEntryThunderBluff := @GameobjectEntryOrgrimmar + 2; -- 550202
SET @GameobjectEntrySilvermoon   := @GameobjectEntryOrgrimmar + 3; -- 550203

-- Alliance
SET @GameobjectEntryStormwind    := @GameobjectEntryOrgrimmar + 4; -- 550204
SET @GameobjectEntryIronforge    := @GameobjectEntryOrgrimmar + 5; -- 550205
SET @GameobjectEntryDarnassus    := @GameobjectEntryOrgrimmar + 6; -- 550206
SET @GameobjectEntryExodar       := @GameobjectEntryOrgrimmar + 7; -- 550207

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
(@GameobjectEntryOrgrimmar,    34, 7613, 'Guild Vault', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0),
(@GameobjectEntryUndercity,    34, 7606, 'Guild Vault', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0),
(@GameobjectEntryThunderBluff, 34, 7616, 'Guild Vault', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0),
(@GameobjectEntrySilvermoon,   34, 7604, 'Guild Vault', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0),

-- Alliance
(@GameobjectEntryStormwind,    34, 7607, 'Guild Vault', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0),
(@GameobjectEntryIronforge,    34, 7608, 'Guild Vault', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0),
(@GameobjectEntryDarnassus,    34, 7615, 'Guild Vault', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0),
(@GameobjectEntryExodar,       34, 7612, 'Guild Vault', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0);

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
(@GameobjectEntryOrgrimmar,    1735, 0, 0, 0, 0, 0, 0, 0),
(@GameobjectEntryUndercity,    1735, 0, 0, 0, 0, 0, 0, 0),
(@GameobjectEntryThunderBluff, 1735, 0, 0, 0, 0, 0, 0, 0),
(@GameobjectEntrySilvermoon,   1735, 0, 0, 0, 0, 0, 0, 0),

-- Alliance
(@GameobjectEntryStormwind,    1732, 0, 0, 0, 0, 0, 0, 0),
(@GameobjectEntryIronforge,    1732, 0, 0, 0, 0, 0, 0, 0),
(@GameobjectEntryDarnassus,    1732, 0, 0, 0, 0, 0, 0, 0),
(@GameobjectEntryExodar,       1732, 0, 0, 0, 0, 0, 0, 0);
