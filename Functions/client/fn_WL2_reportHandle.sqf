#include "..\warlords_constants.inc"

params ["_killer"];

sleep 5;

[_killer, "report", true] call BIS_fnc_WL2_hintHandle;

BIS_WL_spacePressed = false;
BIS_WL_backspacePressed = false;

_deployKeyHandle = WL_DISPLAY_MAIN displayAddEventHandler ["KeyDown", {
	if (_this # 1 == 57) then {
		if !(BIS_WL_backspacePressed) then {
			BIS_WL_spacePressed = TRUE;
		};
	};
	if (_this # 1 == 14) then {
		if !(BIS_WL_spacePressed) then {
			BIS_WL_backspacePressed = TRUE;
		};
	};
}];

uiNamespace setVariable ["BIS_WL_deployKeyHandle", _deployKeyHandle];

0 spawn {
	waitUntil {
		sleep 15;
		BIS_WL_spacePressed ||
		BIS_WL_backspacePressed
	};
	if !(BIS_WL_spacePressed) then {
		BIS_WL_backspacePressed = TRUE;
	};
};

waitUntil {sleep WL_TIMEOUT_MIN; BIS_WL_spacePressed || BIS_WL_backspacePressed};

WL_DISPLAY_MAIN displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "BIS_WL_deployKeyHandle"];
uiNamespace setVariable ['BIS_WL_deployKeyHandle', nil];

[_killer, "report", false] call BIS_fnc_WL2_hintHandle;

if (BIS_WL_spacePressed) then {
	playSound "AddItemOK";
	_killer setVariable [format ["BIS_WL_ReportedBy_%1", getPlayerUID player], false, true];
} else {
	playSound "AddItemOK";
	_killer setVariable [format ["BIS_WL_ReportedBy_%1", getPlayerUID player], true, true];
};