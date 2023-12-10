["Preload"] call BIS_fnc_arsenal;

private _playerSide = str BIS_WL_playerSide;
BIS_fnc_arsenal_data set [3, (getArray (missionConfigFile >> "arsenalConfig" >> _playerSide >> "Uniforms"))];
BIS_fnc_arsenal_data set [4, (getArray (missionConfigFile >> "arsenalConfig" >> _playerSide >> "Vests"))];
BIS_fnc_arsenal_data set [5, (getArray (missionConfigFile >> "arsenalConfig" >> _playerSide >> "Backpacks"))];
BIS_fnc_arsenal_data set [6, (getArray (missionConfigFile >> "arsenalConfig" >> _playerSide >> "Helmets"))];
BIS_fnc_arsenal_data set [8, ((BIS_fnc_arsenal_data select 8) + ["Integrated_NVG_TI_0_F"])];
BIS_fnc_arsenal_data set [11, (getArray (missionConfigFile >> "arsenalConfig" >> _playerSide >> "Terminals"))];
BIS_fnc_arsenal_data set [23, []];