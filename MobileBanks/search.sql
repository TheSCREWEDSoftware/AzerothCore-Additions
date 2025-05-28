-- To be used along side this: https://wowgaming.altervista.org/aowow/?items=15.2&filter=cr=128;crs=2;crv=0;qu=1:2:3:4:5:6:7#0-2
SELECT `entry`, `name`, `type`, `AIName`, `ScriptName` FROM `creature_template` WHERE `type` = 12 AND `ScriptName` = "" AND `AIName` = "";
