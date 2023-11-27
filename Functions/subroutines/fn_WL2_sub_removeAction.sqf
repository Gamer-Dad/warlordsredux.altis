#include "..\warlords_constants.inc"
params ["_asset"];

private _removeActionID = _asset addAction [
	"",
	{
		_displayName = getText (configFile >> "CfgVehicles" >> (typeOf (_this # 0)) >> "displayName");
		_result = [format ["Are you sure you would like to delete: %1", _displayName], "Delete asset", true, true] call BIS_fnc_guiMessage;

		if (_result) exitWith {
			if (unitIsUAV (_this # 0)) then {
				private _grp = group effectiveCommander (_this # 0);
				{(_this # 0) deleteVehicleCrew _x} forEach crew (_this # 0);
				deleteGroup _grp;
			};
			
			deleteVehicle (_this # 0);
		};
	},
	[],
	-98,
	false,
	true,
	"",
	"vehicle _this != _target && {_this == (_target getVariable ['BIS_WL_ownerAsset', '123'])}",
	30,
	false
];

_asset setUserActionText [_removeActionID, format ["<t color = '#ff4b4b'>%1</t>", localize "STR_xbox_hint_remove"], "<img size='2' color='#ff4b4b' image='\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_cancel_ca'/>"];