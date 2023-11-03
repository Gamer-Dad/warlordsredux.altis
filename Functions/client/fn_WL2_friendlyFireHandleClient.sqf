params ["_penalty"];

if (isNil "BIS_WL_penalized" || {BIS_WL_penalized}) exitWith {};

_penalty spawn {
	params ["_penaltyEnd"];
	
	BIS_WL_penalized = true;
	["RequestMenu_close"] call BIS_fnc_WL2_setupUI;
	titleCut ["", "BLACK IN", 1];

	showCinemaBorder true;
	private _camera = "Camera" camCreate position player;
	_camera camSetPos [0, 0, 10];
	_camera camSetTarget [-1000, -1000, 10];
	_camera camCommit 0;
	_camera cameraEffect ["Internal", "Back"];
	waitUntil {!isNull (findDisplay 46)};
	(findDisplay 46) ctrlCreate ["RscStructuredText", 994001];
	((findDisplay 46) displayCtrl 994001) ctrlSetPosition [safeZoneX, safeZoneY, safeZoneW, safeZoneH];
	((findDisplay 46) displayCtrl 994001) ctrlSetBackgroundColor [0, 0, 0, 0.75];
	((findDisplay 46) displayCtrl 994001) ctrlCommit 0;
	(findDisplay 46) ctrlCreate ["RscStructuredText", 994000];
	((findDisplay 46) displayCtrl 994000) ctrlSetPosition [safeZoneX + 0.1, safeZoneY + (safeZoneH * 0.5), (safeZoneW * 0.8), safeZoneH];
	((findDisplay 46) displayCtrl 994000) ctrlCommit 0;
	((findDisplay 46) displayCtrl 994000) ctrlSetStructuredText parseText format [
		"<t shadow = '0'><t size = '%1' color = '#ff4b4b'>%2</t><br/><t size = '%3'>%4</t></t>",
		(2.5 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale),
		([(_penaltyEnd - serverTime) max 0, "MM:SS"] call BIS_fnc_secondsToString),
		(1.3 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale),
		localize "STR_A3_mission_failed_friendly_fire"
	];
	
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
	BIS_WL_penalized = false;
	player setVariable ["BIS_WL_friendlyKillTimestamps", [], [2, clientOwner]];
};