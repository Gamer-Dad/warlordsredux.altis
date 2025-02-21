_killTime = player getVariable "BIS_WL_zoneRestrictionKillTime";
["trespassing", [serverTime, _killTime]] spawn WL2_fnc_setOSDEvent;
[toUpper localize "STR_A3_WL_zone_warn"] spawn WL2_fnc_smoothText;
playSound "air_raid";
playSound "air_raid";

waitUntil {sleep 0.1; (player getVariable ["BIS_WL_zoneRestrictionKillTime", 1]) == -1 || {!alive player}};

player setVariable ["BIS_WL_zoneRestrictionKillTime", -1, [2, clientOwner]];
["trespassing", []] spawn WL2_fnc_setOSDEvent;