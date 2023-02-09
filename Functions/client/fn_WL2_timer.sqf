#include "..\warlords_constants.inc"

waituntil {!isnull (findDisplay 46)};

_blockW = safeZoneW / 1000;
_blockH = safeZoneH / (1000 / (getResolution # 4));

_displayW = _blockW * 180;
_displayH = _blockH * 54;
_displayX = safeZoneW + safeZoneX - _displayW - (_blockW * 10);
_displayY = safeZoneH + safeZoneY - _displayH - (_blockH * 50);


_ctrlBackgroundTimer = findDisplay 46 ctrlCreate ["RscPictureKeepAspect", 4567];
_ctrlBackgroundTimer ctrlSetPosition [_displayX + (_blockW * 80), _displayY + (_blockH * - 13), _blockW * 40, _blockH * 16];

_ctrlTimer = findDisplay 46 ctrlCreate ["RscStructuredText", 45671];
_ctrlTimer ctrlSetPosition [_displayX + (_blockW * 100), _displayY + (_blockH * - 13), _blockW * 90, _blockH * 16];

while {true} do {
	private _serverTime = missionNamespace getVariable "serverTimer";
	_timeLeft = 36000 - _serverTime;
	_ctrlTimer ctrlSetScale 1.2;
	_ctrlTimer ctrlSetStructuredText parseText format ["<t color = '#ffffff'>%1</t>", [ _timeLeft, "HH:MM:SS"] call BIS_fnc_secondsToString];
	_ctrlTimer ctrlCommit 0;
	_ctrlBackgroundTimer ctrlSetText "img\timer_ca.paa";
	_ctrlBackgroundTimer ctrlSetScale 0.8;
	_ctrlBackgroundTimer ctrlCommit 0;
	sleep 0.5;
};