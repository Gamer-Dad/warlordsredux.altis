["Preload"] call BIS_fnc_arsenal;

private _playerSide = str BIS_WL_playerSide;
BIS_fnc_arsenal_data set [0, ((BIS_fnc_arsenal_data select 0) select {!(_x in (getArray (missionConfigFile >> "arsenalConfig" >> _playerSide >> "riflesBlacklist")))})];
BIS_fnc_arsenal_data set [1, ((BIS_fnc_arsenal_data select 1) select {!(_x in (getArray (missionConfigFile >> "arsenalConfig" >> _playerSide >> "launchersBlacklist")))})];
BIS_fnc_arsenal_data set [3, (getArray (missionConfigFile >> "arsenalConfig" >> _playerSide >> "Uniforms"))];
BIS_fnc_arsenal_data set [4, (getArray (missionConfigFile >> "arsenalConfig" >> _playerSide >> "Vests"))];
BIS_fnc_arsenal_data set [5, (getArray (missionConfigFile >> "arsenalConfig" >> _playerSide >> "Backpacks"))];
BIS_fnc_arsenal_data set [6, (getArray (missionConfigFile >> "arsenalConfig" >> _playerSide >> "Helmets"))];
BIS_fnc_arsenal_data set [11, (getArray (missionConfigFile >> "arsenalConfig" >> _playerSide >> "Terminals"))];
BIS_fnc_arsenal_data set [23, []];