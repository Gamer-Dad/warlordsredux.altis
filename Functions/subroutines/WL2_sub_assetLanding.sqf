#include "..\warlords_constants.inc"


params ["_asset", "_sender"];

_assetPilotGrp = createGroup side group _sender;

_assetPilot = _assetPilotGrp createUnit [typeOf _sender, [100, 100, 0], [], 0, "NONE"];
_assetPilot allowDamage FALSE;
_assetPilot forceAddUniform "U_VirtualMan_F";
_assetPilot assignAsDriver _asset;
_assetPilot moveInDriver _asset;
_assetPilot setBehaviour "CARELESS";
_assetPilot setCombatMode "BLUE";
_assetPilot allowFleeing 0;

_assetPilotGrp deleteGroupWhenEmpty TRUE;

_wpGetOut = _assetPilotGrp addWaypoint [position _asset, 0];
_wpGetOut setWaypointType "GETOUT";
_wpGetOut setWaypointStatements ["TRUE", "deleteVehicle this"];

[_asset, _assetPilot] spawn {
	params ["_asset", "_assetPilot"];
	waitUntil {sleep WL_TIMEOUT_SHORT; !alive _asset || isNull _assetPilot};
	if (!isNull _assetPilot) then {
		if (vehicle _assetPilot == _asset) then {
			_asset deleteVehicleCrew _assetPilot;
		} else {
			deleteVehicle _assetPilot;
		};
	};
};