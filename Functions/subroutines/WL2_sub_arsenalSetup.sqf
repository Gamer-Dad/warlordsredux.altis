#include "..\warlords_constants.inc"

["Preload"] call BIS_fnc_arsenal;

BIS_WL_factionAppropriateUniforms = "getNumber (_x >> 'scope') == 2" configClasses (configFile >> "CfgWeapons");
BIS_WL_factionAppropriateUniforms = (BIS_WL_factionAppropriateUniforms select {player isUniformAllowed configName _x}) apply {configName _x};

BIS_fnc_arsenal_data set [3, BIS_WL_factionAppropriateUniforms];
BIS_fnc_arsenal_data set [5, (BIS_fnc_arsenal_data # 5) - BIS_WL_blacklistedBackpacks];
BIS_fnc_arsenal_data set [23, (BIS_fnc_arsenal_data # 23) - ["APERSMineDispenser_Mag", "ATMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSMine_Range_Mag", "APERSTripMine_Wire_Mag", "ClaymoreDirectionalMine_Remote_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag", "IEDUrbanBig_Remote_Mag", "IEDLandBig_Remote_Mag", "SLAMDirectionalMine_Wire_Mag", "IEDUrbanSmall_Remote_Mag", "IEDLandSmall_Remote_Mag", "TrainingMine_Mag"]];