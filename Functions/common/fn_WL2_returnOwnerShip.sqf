#include "..\warlords_constants.inc"

params ["_owner", "_asset"];

_asset setVariable ["BIS_WL_ownerGrp", group _owner];
_asset setVariable ["BIS_WL_iconText", getText (configFile >> "CfgVehicles" >> typeOf _asset >> "displayName")];

private _removeActionID = _asset addAction [
	"",
	{
		_displayName = getText (configFile >> "CfgVehicles" >> (typeOf (_this # 0)) >> "displayName");
		_result = [format ["Are you sure you would like to delete: %1", _displayName], "Delete asset", true, true] call BIS_fnc_guiMessage;

		if (_result) exitWith {
			_ownedVehiclesVarName = format ["BIS_WL_%1_ownedVehicles", getPlayerUID player];
			missionNamespace setVariable [_ownedVehiclesVarName, WL_PLAYER_VEHS - [_this # 0]];
			publicVariableServer _ownedVehiclesVarName;
			(_this # 0) call BIS_fnc_WL2_sub_deleteAsset;
		};
	},
	[],
	-100,
	false,
	true,
	"",
	"alive _target && vehicle _this != _target && group _this == (_target getVariable ['BIS_WL_ownerGrp', grpNull])",
	30,
	false
];

_asset setUserActionText [_removeActionID, format ["<t color = '#ff4b4b'>%1</t>", localize "STR_xbox_hint_remove"]];