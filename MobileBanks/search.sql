-- To be used along side this: https://wowgaming.altervista.org/aowow/?items=15.2&filter=cr=128;crs=2;crv=0#0-12-2
SELECT `entry`, `name`, `type`, `AIName`, `ScriptName` FROM `creature_template` WHERE `type` = 12 AND `ScriptName` = "" AND `AIName` = "";
