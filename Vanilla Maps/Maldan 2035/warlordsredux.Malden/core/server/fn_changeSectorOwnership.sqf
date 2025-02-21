params ["_sector", "_owner"];

_sector setVariable ["BIS_WL_owner", _owner, true];
[_sector] remoteExec ["WL2_fnc_sectorOwnershipHandleClient", [0, -2] select isDedicated];

private _previousOwners = _sector getVariable "BIS_WL_previousOwners";
private _isNeutralSector = count _previousOwners == 0;
if !(_owner in _previousOwners) then {
	_previousOwners pushBack _owner;
	if (serverTime > 0 && {count _previousOwners == 1}) then {
		private _relevantNeighbors = (synchronizedObjects _sector) select {(_x getVariable "BIS_WL_owner") == _owner};
		private _neighborList = _relevantNeighbors apply {[_x distance2D _sector, _x]};
		_neighborList sort true;
		private _closestNeighborDistance = (_neighborList # 0) # 0;
		private _reward = ((round (_closestNeighborDistance / 3)) min 1000) max 100;
		{
			private _uid = getPlayerUID _x;
			_reward call WL2_fnc_fundsDatabaseWrite;
			[objNull, _reward, localize "STR_A3_sector_captured"] remoteExec ["WL2_fnc_killRewardClient", _x];
		} forEach (allPlayers select {side group _x == _owner});
	};
};

_previousOwners pushBackUnique _owner;
_sector setVariable ["BIS_WL_previousOwners", _previousOwners, true];

_detectionTrgs = (_sector getVariable "BIS_WL_detectionTrgs");
{
	if ((_x getVariable "BIS_WL_handledSide") == _owner) then {
		deleteVehicle _x;
	};
} forEach _detectionTrgs;

if (_sector == (missionNamespace getVariable format ["BIS_WL_currentTarget_%1", _owner])) then {[_owner, objNull] call WL2_fnc_selectTarget};

["server", true] call WL2_fnc_updateSectorArrays;

_side = [west, east];
_side deleteAt (_side find _owner);
private _enemySide = _side # 0;
if (isNull (missionNamespace getVariable format ["BIS_WL_currentTarget_%1", _enemySide]) && !_isNeutralSector) then {
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

waitUntil {sleep 0.01; (_sector getVariable ["BIS_WL_owner", civilian]) == _owner};
if ((((profileNamespace getVariable "BIS_WL_lastBases") # 0) getVariable ["BIS_WL_owner", civilian]) == (((profileNamespace getVariable "BIS_WL_lastBases") # 1) getVariable ["BIS_WL_owner", independent])) then {
	0 remoteExec ["WL2_fnc_missionEndHandle", 0];
};