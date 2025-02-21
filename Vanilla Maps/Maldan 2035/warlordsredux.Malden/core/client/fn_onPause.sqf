#include "..\warlords_constants.inc"

params ["_display"];

if (isMultiplayer) then {
	if !(isServer) then {
		(_display displayCtrl 1010) ctrlAddEventHandler ["ButtonClick", {
			0 spawn {
				sleep WL_TIMEOUT_SHORT;
				(findDisplay 49 displayCtrl 235106) ctrlAddEventHandler ["ButtonClick", {(findDisplay 49) closeDisplay 1; [player, "kill"] remoteExec ["WL2_fnc_handleClientRequest", 2];}];
			};
		}];
	};
};