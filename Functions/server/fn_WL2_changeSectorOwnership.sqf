params ["_sector", "_owner"];

_sector setVariable ["BIS_WL_owner", _owner, true];
[_sector] remoteExec ["BIS_fnc_WL2_sectorOwnershipHandleClient", [0, -2] select isDedicated];

[format ["%1: %2", serverTime, "change ownership"]] remoteExec ["systemChat", 0];

private _previousOwners = _sector getVariable "BIS_WL_previousOwners";

[format ["%1: %2", serverTime, "co, line 10"]] remoteExec ["systemChat", 0];
if !(_owner in _previousOwners) then {
	[format ["%1: %2", serverTime, "co, line 12"]] remoteExec ["systemChat", 0];
	_previousOwners pushBack _owner;
	[format ["%1: %2", serverTime, "co, line 14"]] remoteExec ["systemChat", 0];
	if (serverTime > 0 && {count _previousOwners == 1}) then {
		[format ["%1: %2", serverTime, "co, line 16"]] remoteExec ["systemChat", 0];
		{
			private _uid = getPlayerUID _x;
			[_uid, (_sector getVariable "BIS_WL_value") * 30] call BIS_fnc_WL2_fundsDatabaseWrite;
		} forEach (allPlayers select {side group _x == _owner});
		[format ["%1: %2", serverTime, "co, line 21"]] remoteExec ["systemChat", 0];
	};
};

[format ["%1: %2", serverTime, "co, line 25"]] remoteExec ["systemChat", 0];
_previousOwners pushBackUnique _owner;
_sector setVariable ["BIS_WL_previousOwners", _previousOwners, true];
[format ["%1: %2", serverTime, "co, line 28"]] remoteExec ["systemChat", 0];

_detectionTrgs = (_sector getVariable "BIS_WL_detectionTrgs");
{
	if ((_x getVariable "BIS_WL_handledSide") == _owner) then {
		deleteVehicle _x;
	};
} forEach _detectionTrgs;
[format ["%1: %2", serverTime, "co, line 36"]] remoteExec ["systemChat", 0];

[format ["%1: %2", serverTime, "line 31"]] remoteExec ["systemChat", 0];
if (_sector == (missionNamespace getVariable format ["BIS_WL_currentTarget_%1", _owner])) then {[_owner, objNull] call BIS_fnc_WL2_selectTarget};
[format ["%1: %2", serverTime, "line 33"]] remoteExec ["systemChat", 0];

"server" call BIS_fnc_WL2_updateSectorArrays;

[format ["%1: %2", serverTime, "updated arrays"]] remoteExec ["systemChat", 0];

private _enemySide = (BIS_WL_competingSides - [_owner]) # 0;
if (isNull (missionNamespace getVariable format ["BIS_WL_currentTarget_%1", _enemySide])) then {
	missionNamespace setVariable [format ["BIS_WL_resetTargetSelection_server_%1", _enemySide], true];
	BIS_WL_resetTargetSelection_client = true;
	{
		(owner _x) publicVariableClient "BIS_WL_resetTargetSelection_client";
	} forEach (allPlayers select {side group _x == _enemySide});
	if !(isDedicated) then {
		if (BIS_WL_playerSide != _enemySide) then {
			BIS_WL_resetTargetSelection_client = false;
		};
	};
};

[format ["%1: %2", serverTime, "line 51"]] remoteExec ["systemChat", 0];

waitUntil {sleep 0.01; (_sector getVariable ["BIS_WL_owner", civilian]) == _owner};
if ((((profileNamespace getVariable "BIS_WL_lastBases") # 0) getVariable ["BIS_WL_owner", civilian]) == (((profileNamespace getVariable "BIS_WL_lastBases") # 1) getVariable ["BIS_WL_owner", independent])) then {
	0 remoteExec ["BIS_fnc_WL2_missionEndHandle", 0];
};

[format ["%1: %2", serverTime, "end of change ownership"]] remoteExec ["systemChat", 0];