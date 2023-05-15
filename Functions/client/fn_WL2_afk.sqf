#include "..\warlords_constants.inc"

player setVariable ["BIS_WL_AFK", false, true];
time_to_idle = serverTime + 600;

waitUntil {sleep 0.1; !isNull (findDisplay 46)};
(findDisplay 46) displayAddEventHandler ["keyDown", {
	params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
	if (_key == 42) then {
		time_to_idle = serverTime + 600;
		player setVariable ["BIS_WL_AFK", false, true];
	};
	false;
}];

MRTM_fnc_idle = {
	player setVariable ["BIS_WL_AFK", true, true];
	hintSilent "You are AFK you will not be receiving any income.";
	time_to_idle = serverTime + 600;
};

while {true} do {
	sleep 10;
	if ( serverTime >= time_to_idle) then {
		0 spawn MRTM_fnc_idle;
	};
};