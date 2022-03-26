#include "..\warlords_constants.inc"

params ["_sector", "_owner"];

_sector setVariable ["BIS_WL_owner", _owner, TRUE];

private _previousOwners = _sector getVariable "BIS_WL_previousOwners";

if !(_owner in _previousOwners) then {
	//Mine removal code
	_minecount = count allMines;
	if (_minecount > RD_MINECOUNT_DELETE_THRESHOLD) then {
		{ deleteVehicle _x } forEach allMines;
	};
	//UAV removal code
	_uavcount = count allUnitsUAV;
	if (_uavcount > RD_UAVCOUNT_DELETE_THRESHOLD) then {
		{ _x setDamage 1 } forEach (allUnitsUAV select {!(typeOf _x in ["B_SAM_System_03_F","B_Radar_System_01_F","O_SAM_System_04_F","O_Radar_System_02_F"])}); //better way to filter the ones u dont want to blow up.
	};

		
	_previousOwners pushBack _owner;
	if (WL_SYNCED_TIME > 0 && count _previousOwners == 1) then {
		{
			[_x, (_sector getVariable "BIS_WL_value") * WL_SECTOR_CAPTURE_REWARD_MULTIPLIER] call BIS_fnc_WL2_fundsControl;
		} forEach (BIS_WL_allWarlords select {side group _x == _owner});
	};
};

_previousOwners pushBackUnique _owner;
_sector setVariable ["BIS_WL_previousOwners", _previousOwners, TRUE];

_zoneRestrictionTrgs = _sector getVariable "BIS_WL_zoneRestrictionTrgs";
_detectionTrgs = (if (BIS_WL_fogOfWar != 0) then {_sector getVariable "BIS_WL_detectionTrgs"} else {[]});

{
	if ((_x getVariable "BIS_WL_handledSide") == _owner) then {
		deleteVehicle _x;
	};
} forEach (_zoneRestrictionTrgs + _detectionTrgs);

if (_zoneRestrictionTrgs findIf {!isNull _x} == -1) then {_zoneRestrictionTrgs = []};
if (_detectionTrgs findIf {!isNull _x} == -1) then {_detectionTrgs = []};

if (_sector == (missionNamespace getVariable format ["BIS_WL_currentTarget_%1", _owner])) then {[_owner, objNull] call BIS_fnc_WL2_selectTarget};

["server"] call BIS_fnc_WL2_updateSectorArrays;

private _enemySide = (BIS_WL_competingSides - [_owner]) # 0;
if (isNull (missionNamespace getVariable format ["BIS_WL_currentTarget_%1", _enemySide])) then {
	missionNamespace setVariable [format ["BIS_WL_resetTargetSelection_server_%1", _enemySide], TRUE];
	BIS_WL_resetTargetSelection_client = TRUE;
	{
		(owner _x) publicVariableClient "BIS_WL_resetTargetSelection_client";
	} forEach (BIS_WL_allWarlords select {side group _x == _enemySide});
	if !(isDedicated) then {
		if (BIS_WL_playerSide != _enemySide) then {
			BIS_WL_resetTargetSelection_client = FALSE;
		};
	};
};