#include "..\warlords_constants.inc"

params ["_asset"];

private _groupUnit = local _asset && {_asset isKindOf "Man"};
if (_groupUnit) then {
	0 spawn {
		[] spawn BIS_fnc_WL2_refreshOSD;
	};
};

if (isServer) exitWith {
	if (getNumber (configFile >> "CfgVehicles" >> typeOf _asset >> "isUav") == 1) then {
		private _grp = group effectiveCommander _asset;
		{_asset deleteVehicleCrew _x} forEach crew _asset;
		deleteGroup _grp;
	};
	
	deleteVehicle _asset;
};

[_asset] remoteExec ["BIS_fnc_WL2_sub_deleteAsset", 2];