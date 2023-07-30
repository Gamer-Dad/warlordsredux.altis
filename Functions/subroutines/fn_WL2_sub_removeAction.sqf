params ["_asset"];

private _removeActionID = _asset addAction [
	"",
	{
		_displayName = getText (configFile >> "CfgVehicles" >> (typeOf (_this # 0)) >> "displayName");
		_result = [format ["Are you sure you would like to delete: %1", _displayName], "Delete asset", true, true] call BIS_fnc_guiMessage;

		if (_result) exitWith {
			_ownedVehiclesVarName = format ["BIS_WL_%1_ownedVehicles", getPlayerUID player];
			missionNamespace setVariable [_ownedVehiclesVarName, WL_PLAYER_VEHS - [_this # 0]];
			publicVariableServer _ownedVehiclesVarName;
			if ((_this # 0) isKindOf "Man") then {
				deleteVehicle (_this # 0);
			} else {
				(_this # 0) spawn BIS_fnc_WL2_sub_deleteAsset;
			};
		};
	},
	[],
	-98,
	false,
	true,
	"",
	"alive _target && {vehicle _this != _target && {(group _this) == (_target getVariable ['BIS_WL_ownerAsset', grpNull])}}",
	30,
	false
];

_asset setUserActionText [_removeActionID, format ["<t color = '#ff4b4b'>%1</t>", localize "STR_xbox_hint_remove"], "<img size='2' color='#ff4b4b' image='\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_cancel_ca'/>"];