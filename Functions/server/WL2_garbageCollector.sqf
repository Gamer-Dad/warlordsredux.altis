#include "..\warlords_constants.inc"

[] spawn {
	sleep 600;
	
	{
		if (_x isKindOf "WeaponHolder" || _x isKindOf "WeaponHolderSimulated") then {
			_asset = _x;
			
			if (BIS_WL_allWarlords findIf {_x distance2D _asset < WL_ASSET_REMOVAL_SAFEZONE} == -1) then {
				deleteVehicle _asset;
			};
		};
	} forEach allMissionObjects "";
};

while {!BIS_WL_missionEnd} do {
	sleep WL_TIMEOUT_MAX;
	{
		_asset = _x;
		if (WL_SYNCED_TIME >= (_x getVariable ["BIS_WL_deleteAt", 0])) then {
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