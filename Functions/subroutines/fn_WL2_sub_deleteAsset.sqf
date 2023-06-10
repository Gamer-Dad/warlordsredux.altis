#include "..\warlords_constants.inc"

params ["_asset"];

if (isServer) exitWith {
	if (getNumber (configFile >> "CfgVehicles" >> typeOf _asset >> "isUav") == 1) then {
		private _grp = group effectiveCommander _asset;
		{_asset deleteVehicleCrew _x} forEach crew _asset;
		deleteGroup _grp;
	} else {
		{_x setPos position _asset} forEach crew _asset;
	};
	deleteVehicle _asset;

	private _groupUnit = local _asset && _asset isKindOf "Man";
	if (_groupUnit) then {
		0 spawn {
			[] spawn BIS_fnc_WL2_refreshOSD;
		};
	};
};

if (typeOf _asset == "B_Truck_01_medical_F") then {
	missionNamespace setVariable ["ftVehicleExistsBlu", false, true];
	deleteVehicle _asset;
};

if (typeOf _asset == "O_Truck_03_medical_F") then {
	missionNamespace setVariable ["ftVehicleExistsOpf", false, true];
	deleteVehicle _asset;
};

private _groupUnit = local _asset && _asset isKindOf "Man";
if (_groupUnit) then {
	0 spawn {
		[] spawn BIS_fnc_WL2_refreshOSD;
	};
};

[_asset] remoteExec ["BIS_fnc_WL2_sub_deleteAsset", 2];