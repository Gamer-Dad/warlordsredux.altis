#include "..\..\warlords_constants.inc"

params ["_target"];

private _displayName = [_target] call WL2_fnc_getAssetTypeName;
private _assetSector = BIS_WL_allSectors select { _target inArea (_x getVariable "objectAreaComplete") };
private _assetLocation = if (count _assetSector > 0) then {
	(_assetSector # 0) getVariable ["BIS_WL_name", str (mapGridPosition _target)];
} else {
	mapGridPosition _target;
};

private _result = ["Delete asset", format ["Are you sure you would like to delete: %1 @ %2", _displayName, _assetLocation], "Yes", "Cancel"] call WL2_fnc_prompt;

if (_result) then {
	private _access = [_target, player, "full"] call WL2_fnc_accessControl;
	if !(_access # 0) exitWith {
		systemChat format ["Can't remove: %1", _access # 1];
		playSound "AddItemFailed";
	};

	if (!alive player) exitWith {
		systemChat "You are dead!";
		playSound "AddItemFailed";
	};

	if (!(unitIsUAV _target) && !(_target isKindOf "Man") && (crew _target) findIf {alive _x} >= 0) exitWith {
		[toUpper localize "STR_A3_WL_popup_asset_not_empty"] spawn WL2_fnc_smoothText;
		playSound "AddItemFailed";
	};

	playSound "AddItemOK";
	[format [toUpper localize "STR_A3_WL_popup_asset_deleted", toUpper _displayName], 2] spawn WL2_fnc_smoothText;
	_vehicles = missionNamespace getVariable [format ["BIS_WL_ownedVehicles_%1", getPlayerUID player], []];
	_vehicles deleteAt (_vehicles find _target);
	missionNamespace setVariable [format ["BIS_WL_ownedVehicles_%1", getPlayerUID player], _vehicles, [2, clientOwner]];
	0 remoteExec ["WL2_fnc_updateVehicleList", 2];

	if (_target == (getConnectedUAV player)) then {
		player connectTerminalToUAV objNull;
	};

	if (unitIsUAV _target) then {
		private _grp = group effectiveCommander _target;
		{_target deleteVehicleCrew _x} forEach crew _target;
		deleteGroup _grp;
	};

	deleteVehicle _target;
	((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlShow false;
	((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlEnable true;
} else {
	playSound "AddItemFailed";
};