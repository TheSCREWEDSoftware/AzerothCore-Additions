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

SET @GameobjectGUIDValormok          := 1250700;
SET @GameobjectGUIDZoramgarOutpost   := @GameobjectGUIDValormok + 1;  -- 1250701
SET @GameobjectGUIDCampMojache       := @GameobjectGUIDValormok + 2;  -- 1250702
SET @GameobjectGUIDCampTaurajo       := @GameobjectGUIDValormok + 3;  -- 1250703
SET @GameobjectGUIDBloodhoofVillage  := @GameobjectGUIDValormok + 4;  -- 1250704
SET @GameobjectGUIDSplintertreePost  := @GameobjectGUIDValormok + 5;  -- 1250705
SET @GameobjectGUIDShadowpreyVillage := @GameobjectGUIDValormok + 6;  -- 1250706
SET @GameobjectGUIDFreewindPost      := @GameobjectGUIDValormok + 7;  -- 1250707
SET @GameobjectGUIDRazorHill         := @GameobjectGUIDValormok + 8;  -- 1250708
SET @GameobjectGUIDSenjinVillage     := @GameobjectGUIDValormok + 9;  -- 1250709
SET @GameobjectGUIDBloodvenomPost    := @GameobjectGUIDValormok + 10; -- 1250710
SET @GameobjectGUIDCrossroads        := @GameobjectGUIDValormok + 11; -- 1250711
SET @GameobjectGUIDSunRockRetreat    := @GameobjectGUIDValormok + 12; -- 1250712
SET @GameobjectGUIDHiveRegal         := @GameobjectGUIDValormok + 13; -- 1250713
SET @GameobjectGUIDBrill             := @GameobjectGUIDValormok + 14; -- 1250714
SET @GameobjectGUIDTheBulwark        := @GameobjectGUIDValormok + 15; -- 1250715
SET @GameobjectGUIDLightsHopeChapel  := @GameobjectGUIDValormok + 16; -- 1250716
SET @GameobjectGUIDTranquillien      := @GameobjectGUIDValormok + 17; -- 1250717
SET @GameobjectGUIDFalconwingSquare  := @GameobjectGUIDValormok + 18; -- 1250718
SET @GameobjectGUIDFairbreezeVillage := @GameobjectGUIDValormok + 19; -- 1250719
SET @GameobjectGUIDTheSepulcher      := @GameobjectGUIDValormok + 20; -- 1250720
SET @GameobjectGUIDTarrenMill        := @GameobjectGUIDValormok + 21; -- 1250721
SET @GameobjectGUIDHammerfall        := @GameobjectGUIDValormok + 22; -- 1250722
SET @GameobjectGUIDKargath           := @GameobjectGUIDValormok + 23; -- 1250723
SET @GameobjectGUIDRevantuskVillage  := @GameobjectGUIDValormok + 24; -- 1250724
SET @GameobjectGUIDStonard           := @GameobjectGUIDValormok + 25; -- 1250725
SET @GameobjectGUIDGromgolBaseCamp   := @GameobjectGUIDValormok + 26; -- 1250726
SET @GameobjectGUIDSunsReachHarbor   := @GameobjectGUIDValormok + 27; -- 1250727
SET @GameobjectGUIDStairOfDestiny    := @GameobjectGUIDValormok + 28; -- 1250728
SET @GameobjectGUIDThrallmar         := @GameobjectGUIDValormok + 29; -- 1250729

DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDValormok);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDZoramgarOutpost);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDCampMojache);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDCampTaurajo);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDBloodhoofVillage);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDSplintertreePost);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDShadowpreyVillage);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDFreewindPost);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDRazorHill);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDSenjinVillage);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDBloodvenomPost);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDCrossroads);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDSunRockRetreat);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDHiveRegal);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDBrill);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDTheBulwark);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDLightsHopeChapel);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDTranquillien);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDFalconwingSquare);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDFairbreezeVillage);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDTheSepulcher);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDTarrenMill);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDHammerfall);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDKargath);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDRevantuskVillage);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDStonard);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDGromgolBaseCamp);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDSunsReachHarbor);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDStairOfDestiny);
DELETE FROM `gameobject` WHERE (`guid` = @GameobjectGUIDThrallmar);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES
(@GameobjectGUIDValormok,          @GameobjectEntryOrgrimmar,    1, 0, 0, 1, 1, 3344.57,  989.163,   4.06991,  0.718646,  0, 0, 0.35164,      0.936135,   300, 0, 1, '', NULL, NULL), -- Valormok (Horde)
(@GameobjectGUIDZoramgarOutpost,   @GameobjectEntryOrgrimmar,    1, 0, 0, 1, 1, -7573.45, 756.211,   -17.1748, 3.96539,   0, 0, 0.916361,     -0.400352,  300, 0, 1, '', NULL, NULL), -- Zoram'gar Outpost (Horde)
(@GameobjectGUIDCampMojache,       @GameobjectEntryThunderBluff, 1, 0, 0, 1, 1, -5474.11, -2439.23,  89.6795,  0.0783739, 0, 0, 0.0391769,    0.999232,   300, 0, 1, '', NULL, NULL), -- Camp Mojache (Tauren)
(@GameobjectGUIDCampTaurajo,       @GameobjectEntryThunderBluff, 1, 0, 0, 1, 1, -4363.68, 240.26,    25.4452,  3.18932,   0, 0, 0.999715,     -0.0238623, 300, 0, 1, '', NULL, NULL), -- Camp Taurajo (Tauren)
(@GameobjectGUIDBloodhoofVillage,  @GameobjectEntryThunderBluff, 1, 0, 0, 1, 1, -2341.52, -366.371,  -8.3592,  0.825288,  0, 0, 0.401033,     0.916064,   300, 0, 1, '', NULL, NULL), -- Bloodhoof Village (Tauren)
(@GameobjectGUIDSplintertreePost,  @GameobjectEntryOrgrimmar,    1, 0, 0, 1, 1, -1650.98, 3190.42,   44.8174,  6.28234,   0, 0, 0.000425013, -1,         300, 0, 1, '', NULL, NULL), -- Splintertree Post (Horde)
(@GameobjectGUIDShadowpreyVillage, @GameobjectEntryOrgrimmar,    1, 0, 0, 1, 1, 3583.47,  -4426.02,  110.545,  3.38899,   0, 0, 0.992359,     -0.123386,  300, 0, 1, '', NULL, NULL), -- Shadowprey Village (Horde)
(@GameobjectGUIDFreewindPost,      @GameobjectEntryThunderBluff, 1, 0, 0, 1, 1, 5107.42,  -365.177,  357.179,  1.67676,   0, 0, 0.74356,      0.668669,   300, 0, 1, '', NULL, NULL), -- Freewind Post (Tauren)
(@GameobjectGUIDRazorHill,         @GameobjectEntryOrgrimmar,    1, 0, 0, 1, 1, 2483.55,  -2467.72,  109.156,  3.27663,   0, 0, 0.997722,     -0.0674657, 300, 0, 1, '', NULL, NULL), -- Razor Hill (Horde)
(@GameobjectGUIDSenjinVillage,     @GameobjectEntryOrgrimmar,    1, 0, 0, 1, 1, 1021.29,  1012.31,   105.1,    4.15868,   0, 0, 0.873454,     -0.486907,  300, 0, 1, '', NULL, NULL), -- Sen'jin Village (Horde)
(@GameobjectGUIDBloodvenomPost,    @GameobjectEntryThunderBluff, 1, 0, 0, 1, 1, -2360.59, -1954.95,  96.6921,  0.306962,  0, 0, 0.152879,     0.988245,   300, 0, 1, '', NULL, NULL), -- Bloodvenom Post (Tauren)
(@GameobjectGUIDCrossroads,        @GameobjectEntryOrgrimmar,    1, 0, 0, 1, 1, -432.763, -2578.55,  95.7907,  5.38545,   0, 0, 0.433947,     -0.900939,  300, 0, 1, '', NULL, NULL), -- Crossroads (Horde)
(@GameobjectGUIDSunRockRetreat,    @GameobjectEntryOrgrimmar,    1, 0, 0, 1, 1, 312.014,  -4821.56,  9.57881,  4.35816,   0, 0, 0.82063,      -0.57146,   300, 0, 1, '', NULL, NULL), -- Sun Rock Retreat (Horde)
(@GameobjectGUIDHiveRegal,         @GameobjectEntryOrgrimmar,    1,   0, 0, 1, 1, -784.792,  -4943.06,  38,       2.81093,   0, 0, 0.986363,  0.164581,   300, 0, 1, '', NULL, NULL), -- Hive'Regal (Horde)
(@GameobjectGUIDBrill,             @GameobjectEntryOrgrimmar,    0,   0, 0, 1, 1, 2289.95,   301.169,   35.1875,  2.6721,    0, 0, 0.972574,  0.232596,   300, 0, 1, '', NULL, NULL), -- Brill (Horde)
(@GameobjectGUIDTheBulwark,        @GameobjectEntryOrgrimmar,    0,   0, 0, 1, 1, 1768.04,   -731.952,  59.6987,  1.58258,   0, 0, 0.711259,  0.70293,    300, 0, 1, '', NULL, NULL), -- The Bulwark (Horde)
(@GameobjectGUIDLightsHopeChapel,  @GameobjectEntryOrgrimmar,    0,   0, 0, 1, 1, 2330.97,   -5313.47,  81.9963,  2.64286,   0, 0, 0.969069,  0.246791,   300, 0, 1, '', NULL, NULL), -- Light's Hope Chapel (Horde)
(@GameobjectGUIDTranquillien,      @GameobjectEntryOrgrimmar,    530, 0, 0, 1, 1, 7545.42,   -6911.99,  111.913,  2.01353,   0, 0, 0.845106,  0.534599,   300, 0, 1, '', NULL, NULL), -- Tranquillien (Horde)
(@GameobjectGUIDFalconwingSquare,  @GameobjectEntrySilvermoon,   530, 0, 0, 1, 1, 9491.29,   -6874.46,  20.4274,  5.46247,   0, 0, 0.398936,  -0.916979,  300, 0, 1, '', NULL, NULL), -- Falconwing Square (Silvermoon)
(@GameobjectGUIDFairbreezeVillage, @GameobjectEntryOrgrimmar,    530, 0, 0, 1, 1, 8733.91,   -6647.11,  70.449,   4.54352,   0, 0, 0.76422,   -0.644956,  300, 0, 1, '', NULL, NULL), -- Fairbreeze Village (Horde)
(@GameobjectGUIDTheSepulcher,      @GameobjectEntryOrgrimmar,    0,   0, 0, 1, 1, 572.411,   1584.51,   131.605,  2.78423,   0, 0, 0.984079,  0.177732,   300, 0, 1, '', NULL, NULL), -- The Sepulcher (Horde)
(@GameobjectGUIDTarrenMill,        @GameobjectEntryOrgrimmar,    0,   0, 0, 1, 1, -30.5893,  -918.464,  54.7246,  4.26863,   0, 0, 0.845381,  -0.534163,  300, 0, 1, '', NULL, NULL), -- Tarren Mill (Horde)
(@GameobjectGUIDHammerfall,        @GameobjectEntryOrgrimmar,    0,   0, 0, 1, 1, -935.041,  -3541.03,  70.9352,  4.4846,    0, 0, 0.782887,  -0.622164,  300, 0, 1, '', NULL, NULL), -- Hammerfall (Horde)
(@GameobjectGUIDKargath,           @GameobjectEntryOrgrimmar,    0,   0, 0, 1, 1, -6664.26,  -2135.91,  244.144,  3.94274,   0, 0, 0.920838,  -0.389945,  300, 0, 1, '', NULL, NULL), -- Kargath (Horde)
(@GameobjectGUIDRevantuskVillage,  @GameobjectEntryOrgrimmar,    0,   0, 0, 1, 1, -619.324,  -4601.97,  9.57938,  5.17966,   0, 0, 0.524189,  -0.851602,  300, 0, 1, '', NULL, NULL), -- Revantusk Village (Horde)
(@GameobjectGUIDStonard,           @GameobjectEntryOrgrimmar,    0,   0, 0, 1, 1, -10434.3,  -3283.4,   20.1793,  4.72022,   0, 0, 0.704334,  -0.709869,  300, 0, 1, '', NULL, NULL), -- Stonard (Horde)
(@GameobjectGUIDGromgolBaseCamp,   @GameobjectEntryOrgrimmar,    0,   0, 0, 1, 1, -12402.1,  185.117,   2.15913,  5.13651,   0, 0, 0.54244,   -0.840094,  300, 0, 1, '', NULL, NULL), -- Grom'gol Base Camp (Horde)
(@GameobjectGUIDSunsReachHarbor,   @GameobjectEntryOrgrimmar,    530, 0, 0, 1, 1, 12943.1,   -6917.76,  4.6364,   5.6745,    0, 0, 0.299668,  -0.954044,  300, 0, 1, '', NULL, NULL), -- Sun's Reach Harbor (Horde)
(@GameobjectGUIDStairOfDestiny,    @GameobjectEntryOrgrimmar,    530, 0, 0, 1, 1, -129.394,  974.786,   54.1728,  3.09998,   0, 0, 0.999784,  0.0208056,  300, 0, 1, '', NULL, NULL), -- The Stair of Destiny (Horde)
(@GameobjectGUIDThrallmar,         @GameobjectEntryOrgrimmar,    530, 0, 0, 1, 1, 238.259,   2663.24,   86.3764,  1.92932,   0, 0, 0.821855,  0.569697,   300, 0, 1, '', NULL, NULL); -- Thrallmar (Horde)

-- TODO: Kalimdor (14) and Eastern Kingdoms/Quel'Danas/Hellfire Peninsula Horde guild bank spawns (16) are done, 30 locations above.
-- Still missing:
--   - Outland (Horde) - Zangarmarsh, Terokkar Forest, Nagrand, Blade's Edge Mountains, Shadowmoon Valley
--   - Northrend (Horde) - same as Outland
