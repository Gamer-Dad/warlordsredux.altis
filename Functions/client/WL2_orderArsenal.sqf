#include "..\warlords_constants.inc"

_uniform = uniform player;

["RequestMenu_close"] call BIS_fnc_WL2_setupUI;
[player, -BIS_WL_arsenalCost] call BIS_fnc_WL2_fundsControl;
["Open", TRUE] spawn BIS_fnc_arsenal;

_uniform spawn {
	waitUntil {!isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])};
	while {!isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])} do {
		if ((backpack player) in BIS_WL_blacklistedBackpacks) then {
			removeBackpack player;
		};
		if !(uniform player in BIS_WL_factionAppropriateUniforms) then {
			player forceAddUniform _this;
		};
		sleep WL_TIMEOUT_MIN;
	};
};