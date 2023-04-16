#include "..\warlords_constants.inc"

_uniform = uniform player;

["RequestMenu_close"] call BIS_fnc_WL2_setupUI;

[_uniform] spawn {
	params ["_uniform"];
	if (isNull (findDisplay 602)) then {

		["Open", TRUE] spawn BIS_fnc_arsenal;
		player setVariable ["arsenalOpened", true, true];

		_uniform spawn {
			waitUntil {!isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])};
			while {!isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])} do {
				if (side player == west) then {
					if !((backpack player) in NATObackpackWhitelist) then {
						removeBackpack player;
					};
					if !(uniform player in NATOuniformsWhitelist) then {
						player forceAddUniform _this;
					};
					if !(vest player in NATOvestWhitelist) then {
						removeVest player;
					};
					if !(headgear player in NATOhelmetsWhitelist) then {
						player addHeadgear "H_HelmetB";
					};
				};
				if (side player == east) then {
					if !((backpack player) in CSATbackpackWhitelist) then {
						removeBackpack player;
					};
					if !(uniform player in CSATuniformsWhitelist) then {
						player forceAddUniform _this;
					};
					if !(vest player in CSATvestWhitelist) then {
						removeVest player;
					};
					if !(headgear player in CSAThelmetsWhitelist) then {
						player addHeadgear "H_HelmetO_ocamo";
					};
				};
				sleep WL_TIMEOUT_MIN;
			};
			player setVariable ["arsenalOpened", false, true];
		};

		0 spawn {
			waitUntil {!isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])};
			while {!isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])} do {
				if !(isNull (findDisplay 602)) then {
					(findDisplay 602) closeDisplay 1;
				};
				sleep 0.1;
			};
		};
	};
};