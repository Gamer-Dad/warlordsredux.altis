#include "..\warlords_constants.inc"

params ["_side"];

_varName = format ["BIS_WL_targetResetVotingSince_%1", _side];
_terminate = false;

while {!_terminate && {serverTime < ((missionNamespace getVariable [_varName, -1]) + WL_TARGET_RESET_VOTING_TIME)}} do {
	sleep WL_TIMEOUT_SHORT;
	
	_warlords = (BIS_WL_allWarlords select {(side group _x == _side) && {!(isNil {_x})}});
	_limit = ceil ((count _warlords) / 4);
	_votedYes = count (_warlords select {(_x getVariable ["BIS_WL_targetResetVote", -1]) == 1});
	_votedNo = count (_warlords select {(_x getVariable ["BIS_WL_targetResetVote", -1]) == 0});
	
	if (_votedYes >= _limit) then {
		_terminate = true;
		missionNamespace setVariable [format ["BIS_WL_recentTargetReset_%1", _side], true];
		missionNamespace setVariable [format ["BIS_WL_currentTarget_%1", _side], objNull, true];
		["server", true] call BIS_fnc_WL2_updateSectorArrays;
		_side spawn {
			params ["_side"];
			sleep (30 min (getMissionConfigValue ["BIS_WL_sectorResetTimeout", 300]));
			missionNamespace setVariable [format ["BIS_WL_recentTargetReset_%1", _side], false];
		};
	} else {
		if (_votedNo >= _limit) then {
			_terminate = true;
			missionNamespace setVariable [_varName, (serverTime - WL_TARGET_RESET_VOTING_TIME), true];
		};
	};
};

{
	if ((_x getVariable ["BIS_WL_targetResetVote", -1]) != -1) then {
		_x setVariable ["BIS_WL_targetResetVote", -1, [2, (owner _x)]];
	};
} forEach (BIS_WL_allWarlords select {(side group _x == _side) && {!(isNil {_x})}});
