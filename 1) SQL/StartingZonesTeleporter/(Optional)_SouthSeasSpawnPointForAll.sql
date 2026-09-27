-- Horde
SET @RaceOrc      := 2;
SET @RaceUndead   := 5;
SET @RaceTauren   := 6;
SET @RaceTroll    := 8;
SET @RaceBloodElf := 10;

-- Alliance
SET @RaceHuman    := 1;
SET @RaceDwarf    := 3;
SET @RaceNightElf := 4;
SET @RaceGnome    := 7;
SET @RaceDraenei  := 11;

SET @ClassDeathKnight := 6;

SET @SouthSeasMap  := 1;
SET @SouthSeasZone := 0;

-- Horde
UPDATE `playercreateinfo` SET `map` = @SouthSeasMap, `zone` = @SouthSeasZone, `position_x` = -11852.01,  `position_y` = -4766.9395, `position_z` = 5.7219214, `orientation` = 4.85532    WHERE (`race` = @RaceOrc      AND `class` != @ClassDeathKnight); -- Orc
UPDATE `playercreateinfo` SET `map` = @SouthSeasMap, `zone` = @SouthSeasZone, `position_x` = -11853.603, `position_y` = -4767.844,  `position_z` = 5.772049,  `orientation` = 6.0883756  WHERE (`race` = @RaceUndead   AND `class` != @ClassDeathKnight); -- Undead
UPDATE `playercreateinfo` SET `map` = @SouthSeasMap, `zone` = @SouthSeasZone, `position_x` = -11852.77,  `position_y` = -4771.214,  `position_z` = 5.764895,  `orientation` = 1.0225538  WHERE (`race` = @RaceTauren   AND `class` != @ClassDeathKnight); -- Tauren
UPDATE `playercreateinfo` SET `map` = @SouthSeasMap, `zone` = @SouthSeasZone, `position_x` = -11849.524, `position_y` = -4769.73,   `position_z` = 5.734631,  `orientation` = 2.5815697  WHERE (`race` = @RaceTroll    AND `class` != @ClassDeathKnight); -- Troll
UPDATE `playercreateinfo` SET `map` = @SouthSeasMap, `zone` = @SouthSeasZone, `position_x` = -11852.264, `position_y` = -4769.1455, `position_z` = 5.857906,  `orientation` = 0.7987151  WHERE (`race` = @RaceBloodElf AND `class` != @ClassDeathKnight); -- Blood Elf

-- Alliance
UPDATE `playercreateinfo` SET `map` = @SouthSeasMap, `zone` = @SouthSeasZone, `position_x` = -11854.22,  `position_y` = -4747.4976, `position_z` = 6.438386,  `orientation` = 3.4730456  WHERE (`race` = @RaceHuman    AND `class` != @ClassDeathKnight); -- Human
UPDATE `playercreateinfo` SET `map` = @SouthSeasMap, `zone` = @SouthSeasZone, `position_x` = -11857.287, `position_y` = -4745.318,  `position_z` = 6.4975233, `orientation` = 4.7689414  WHERE (`race` = @RaceDwarf    AND `class` != @ClassDeathKnight); -- Dwarf
UPDATE `playercreateinfo` SET `map` = @SouthSeasMap, `zone` = @SouthSeasZone, `position_x` = -11859.497, `position_y` = -4748.4727, `position_z` = 6.5070133, `orientation` = 0.18613479 WHERE (`race` = @RaceNightElf AND `class` != @ClassDeathKnight); -- Night Elf
UPDATE `playercreateinfo` SET `map` = @SouthSeasMap, `zone` = @SouthSeasZone, `position_x` = -11854.929, `position_y` = -4749.7544, `position_z` = 6.6918426, `orientation` = 2.2085357  WHERE (`race` = @RaceGnome    AND `class` != @ClassDeathKnight); -- Gnome
UPDATE `playercreateinfo` SET `map` = @SouthSeasMap, `zone` = @SouthSeasZone, `position_x` = -11857,      `position_y` = -4748.1084, `position_z` = 6.61803,   `orientation` = 5.844923   WHERE (`race` = @RaceDraenei  AND `class` != @ClassDeathKnight); -- Draenei
