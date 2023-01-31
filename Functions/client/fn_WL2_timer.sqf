#include "..\warlords_constants.inc"

sleep 3;

private _zoneX = safeZoneX;
private _zoneY = safeZoneY;
private _zoneW = safeZoneW;
private _zoneH = safeZoneH;


_ctrlBackgroundTimer = findDisplay 46 ctrlCreate ["RscPictureKeepAspect", 4567];
_ctrlBackgroundTimer ctrlSetPosition [ 0.896219 * _zoneW + _zoneX, 0.790 * _zoneH + _zoneY, 0.0271875 * _zoneW, 0.040 * _zoneH];

_ctrlTimer = findDisplay 46 ctrlCreate ["RscStructuredText", 45671];
_ctrlTimer ctrlSetPosition [ 0.910219 * _zoneW + _zoneX, 0.790 * _zoneH + _zoneY, 0.0571875 * _zoneW, 0.040 * _zoneH];

while {true} do {
	private _serverTime = missionNamespace getVariable "serverTimer";
	_timeLeft = 36000 - _serverTime;
	_ctrlTimer ctrlSetScale 1.2;
	_ctrlTimer ctrlSetStructuredText parseText format ["<t color = '#ffffff'>%1</t>", [ _timeLeft, "HH:MM:SS"] call BIS_fnc_secondsToString];
	_ctrlTimer ctrlCommit 0;
	_ctrlBackgroundTimer ctrlSetText "img\timer_ca.paa";
	_ctrlBackgroundTimer ctrlSetScale 0.6;
	_ctrlBackgroundTimer ctrlCommit 0;
	sleep 0.5;
};