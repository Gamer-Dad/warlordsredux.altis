["Preload"] call BIS_fnc_arsenal;

private _minesBlacklist = ["APERSMineDispenser_Mag", "ATMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSMine_Range_Mag", "APERSTripMine_Wire_Mag", "ClaymoreDirectionalMine_Remote_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag", "IEDUrbanBig_Remote_Mag", "IEDLandBig_Remote_Mag", "SLAMDirectionalMine_Wire_Mag", "IEDUrbanSmall_Remote_Mag", "IEDLandSmall_Remote_Mag", "TrainingMine_Mag"];


private _playerSide = str BIS_WL_playerSide;
BIS_fnc_arsenal_data set [0, ((BIS_fnc_arsenal_data select 0) select {!(_x in (getArray (missionConfigFile >> "arsenalConfig" >> _playerSide >> "riflesBlacklist")))})];
BIS_fnc_arsenal_data set [1, ((BIS_fnc_arsenal_data select 0) select {!(_x in (getArray (missionConfigFile >> "arsenalConfig" >> _playerSide >> "launchersBlacklist")))})];
BIS_fnc_arsenal_data set [2, ((BIS_fnc_arsenal_data select 0) select {!(_x in (getArray (missionConfigFile >> "arsenalConfig" >> _playerSide >> "handgunsBlacklist")))})];
BIS_fnc_arsenal_data set [3, (getArray (missionConfigFile >> "arsenalConfig" >> _playerSide >> "Uniforms"))];
BIS_fnc_arsenal_data set [4, (getArray (missionConfigFile >> "arsenalConfig" >> _playerSide >> "Vests"))];
BIS_fnc_arsenal_data set [5, (getArray (missionConfigFile >> "arsenalConfig" >> _playerSide >> "Backpacks"))];
BIS_fnc_arsenal_data set [6, (getArray (missionConfigFile >> "arsenalConfig" >> _playerSide >> "Helmets"))];
BIS_fnc_arsenal_data set [8, (getArray (missionConfigFile >> "arsenalConfig" >> _playerSide >> "HMD"))];
BIS_fnc_arsenal_data set [11, (getArray (missionConfigFile >> "arsenalConfig" >> _playerSide >> "Terminals"))];
BIS_fnc_arsenal_data set [23, (BIS_fnc_arsenal_data # 23) - _minesBlacklist];
