["Preload"] call BIS_fnc_arsenal;

private _minesBlacklist = ["APERSMineDispenser_Mag", "ATMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSMine_Range_Mag", "APERSTripMine_Wire_Mag", "ClaymoreDirectionalMine_Remote_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag", "IEDUrbanBig_Remote_Mag", "IEDLandBig_Remote_Mag", "SLAMDirectionalMine_Wire_Mag", "IEDUrbanSmall_Remote_Mag", "IEDLandSmall_Remote_Mag", "TrainingMine_Mag"];
private _nvgWhitelist = ["NVGoggles","NVGoggles_OPFOR","NVGoggles_INDEP","O_NVGoggles_hex_F","O_NVGoggles_urb_F","O_NVGoggles_ghex_F","NVGoggles_tna_F","NVGogglesB_blk_F","NVGogglesB_grn_F","NVGogglesB_gry_F","O_NVGoggles_grn_F","Integrated_NVG_TI_0_F"];

BIS_fnc_arsenal_data set [3, (getArray (missionConfigFile >> "arsenalConfig" >> str playerSide >> "Uniforms"))];
BIS_fnc_arsenal_data set [4, (getArray (missionConfigFile >> "arsenalConfig" >> str playerSide >> "Vests"))];
BIS_fnc_arsenal_data set [5, (getArray (missionConfigFile >> "arsenalConfig" >> str playerSide >> "Backpacks"))];
BIS_fnc_arsenal_data set [6, (getArray (missionConfigFile >> "arsenalConfig" >> str playerSide >> "Helmets"))];
BIS_fnc_arsenal_data set [11, (getArray (missionConfigFile >> "arsenalConfig" >> str playerSide >> "Terminals"))];
BIS_fnc_arsenal_data set [23, (BIS_fnc_arsenal_data # 23) - _minesBlacklist];
BIS_fnc_arsenal_data set [8, _nvgWhitelist];