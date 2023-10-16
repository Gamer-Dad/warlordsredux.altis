params ["_largeText", "_smallText"];

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
	_largeText,
	(1.3 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale),
	_smallText
];