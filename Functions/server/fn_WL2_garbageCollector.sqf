#include "..\warlords_constants.inc"

0 spawn {
	sleep 600;
	
	{
		_asset = _x;
		if !(alive _x) then {
			deleteVehicle _asset;
		};
	} forEach ((allMissionObjects "") select {(_x isKindOf "WeaponHolder" || _x isKindOf "WeaponHolderSimulated" || ["BIS_WL_", str _x, false] call BIS_fnc_inString) && !(["BIS_WL_init", str _x, false] call BIS_fnc_inString)});
};

while {!BIS_WL_missionEnd} do {
	sleep WL_TIMEOUT_MAX;
	{
		_asset = _x;
		if (serverTime >= (_x getVariable ["BIS_WL_deleteAt", 0])) then {
			if (BIS_WL_allWarlords findIf {_x distance2D _asset < WL_ASSET_REMOVAL_SAFEZONE} == -1) then {
				if (_asset isKindOf "Man") then {
					if (vehicle _asset != _asset) then {
						(vehicle _asset) deleteVehicleCrew _asset;
					} else {
						deleteVehicle _asset;
					};
				} else {
					{_x setPos position _asset} forEach crew _asset;
					deleteVehicle _asset;
				};
			};
		};
	} forEach allDead;
};