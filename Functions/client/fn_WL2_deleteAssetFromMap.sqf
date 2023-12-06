#include "..\warlords_constants.inc"

params ["_target"];

_displayName = getText (configFile >> "CfgVehicles" >> (typeOf _target) >> "displayName");
_result = [format ["Are you sure you would like to delete: %1", _displayName], "Delete asset", true, true] call BIS_fnc_guiMessage;

if (_result) then {
	playSound "AddItemOK";
	[format [toUpper localize "STR_A3_WL_popup_asset_deleted", toUpper (getText (configFile >> "CfgVehicles" >> typeOf _target >> "displayName"))], 2] spawn BIS_fnc_WL2_smoothText;
	_vehicles = missionNamespace getVariable ["BIS_WL_ownedVehicles", []];
	_vehicles deleteAt (_vehicles find _target);
	missionNamespace setVariable ["BIS_WL_ownedVehicles", _vehicles];

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