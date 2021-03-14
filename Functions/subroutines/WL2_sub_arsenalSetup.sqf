#include "..\warlords_constants.inc"

["Preload"] call BIS_fnc_arsenal;

BIS_WL_factionAppropriateUniforms = "getNumber (_x >> 'scope') == 2" configClasses (configFile >> "CfgWeapons");
BIS_WL_factionAppropriateUniforms = (BIS_WL_factionAppropriateUniforms select {player isUniformAllowed configName _x}) apply {configName _x};

BIS_fnc_arsenal_data set [3, BIS_WL_factionAppropriateUniforms];
BIS_fnc_arsenal_data set [5, (BIS_fnc_arsenal_data # 5) - BIS_WL_blacklistedBackpacks];
BIS_fnc_arsenal_data set [23, (BIS_fnc_arsenal_data # 23) - ["APERSMineDispenser_Mag"]];