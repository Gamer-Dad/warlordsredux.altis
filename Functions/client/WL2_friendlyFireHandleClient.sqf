#include "..\warlords_constants.inc"

if (BIS_WL_penalized) exitWith {};

_this spawn {
	params ["_varName", "_penaltyEnd"];

	BIS_WL_penalized = TRUE;
	["RequestMenu_close"] call BIS_fnc_WL2_setupUI;
	titleCut ["", "BLACK IN", 1];
	showCinemaBorder FALSE;
	private _camera = "Camera" camCreate position player;
	_camera camSetPos [0, 0, 10];
	_camera camSetTarget [-1000, -1000, 10];
	_camera camCommit 0;
	_camera cameraEffect ["Internal", "Back"];
	waitUntil {!isNull WL_DISPLAY_MAIN};
	WL_DISPLAY_MAIN ctrlCreate ["RscStructuredText", 994001];
	(WL_DISPLAY_MAIN displayCtrl 994001) ctrlSetPosition [safeZoneX, safeZoneY, safeZoneW, safeZoneH];
	(WL_DISPLAY_MAIN displayCtrl 994001) ctrlSetBackgroundColor [0, 0, 0, 0.75];
	(WL_DISPLAY_MAIN displayCtrl 994001) ctrlCommit 0;
	WL_DISPLAY_MAIN ctrlCreate ["RscStructuredText", 994000];
	(WL_DISPLAY_MAIN displayCtrl 994000) ctrlSetPosition [safeZoneX + 0.1, safeZoneY + (safeZoneH * 0.5), safeZoneW, safeZoneH];
	(WL_DISPLAY_MAIN displayCtrl 994000) ctrlCommit 0;
	
	while {_penaltyEnd > WL_SYNCED_TIME} do {
		(WL_DISPLAY_MAIN displayCtrl 994000) ctrlSetStructuredText parseText format [
			"<t shadow = '0'><t size = '%1' color = '#ff4b4b'>%2</t><br/><t size = '%3'>%4</t></t>",
			(2.5 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale),
			[(_penaltyEnd - WL_SYNCED_TIME) max 0, "MM:SS"] call BIS_fnc_secondsToString,
			(1.5 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale),
			localize "STR_A3_mission_failed_friendly_fire"
		];
		sleep WL_TIMEOUT_SHORT;
	};
	
	ctrlDelete (WL_DISPLAY_MAIN displayCtrl 994001);
	ctrlDelete (WL_DISPLAY_MAIN displayCtrl 994000);
	forceRespawn player;
	waitUntil {sleep WL_TIMEOUT_MIN; alive player};

	titleCut ["", "BLACK IN", 1];
	_camera cameraEffect ["Terminate", "Back"];
	camDestroy _camera;
	BIS_WL_penalized = FALSE;
};