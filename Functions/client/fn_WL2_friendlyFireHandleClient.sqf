params ["_penalty"];

if (isNil "BIS_WL_penalized" || {BIS_WL_penalized}) exitWith {};

_penalty spawn {
	params ["_penaltyEnd"];
	
	BIS_WL_penalized = TRUE;
	["RequestMenu_close"] call BIS_fnc_WL2_setupUI;
	titleCut ["", "BLACK IN", 1];
	[([(_penaltyEnd - serverTime) max 0, "MM:SS"] call BIS_fnc_secondsToString), localize "STR_A3_mission_failed_friendly_fire"] call BIS_fnc_WL2_blockScreen;
	
	player setVariable ["BIS_WL_incomeBlocked", true, [clientOwner, 2]];
	while {_penaltyEnd > serverTime} do {
		((findDisplay 46) displayCtrl 994000) ctrlSetStructuredText parseText format [
			"<t shadow = '0'><t size = '%1' color = '#ff4b4b'>%2</t><br/><t size = '%3'>%4</t></t>",
			(2.5 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale),
			[(_penaltyEnd - serverTime) max 0, "MM:SS"] call BIS_fnc_secondsToString,
			(1.5 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale),
			localize "STR_A3_mission_failed_friendly_fire"
		];
		sleep 1;
	};
	player setVariable ["BIS_WL_incomeBlocked", false, [clientOwner, 2]];
	
	ctrlDelete ((findDisplay 46) displayCtrl 994001);
	ctrlDelete ((findDisplay 46) displayCtrl 994000);
	forceRespawn player;
	waitUntil {sleep 0.1; alive player};

	titleCut ["", "BLACK IN", 1];
	_camera cameraEffect ["Terminate", "Back"];
	camDestroy _camera;
	BIS_WL_penalized = FALSE;
	player setVariable ["BIS_WL_friendlyKillTimestamps", [], [2, clientOwner]];
};