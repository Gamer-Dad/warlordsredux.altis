#include "..\warlords_constants.inc"

_blockW = safeZoneW / 1000;
_blockH = safeZoneH / (1000 / (getResolution # 4));
_displayW = _blockW * 180;
_displayH = _blockH * 54;
_displayX = safeZoneW + safeZoneX - _displayW - (_blockW * 10);
_displayY = safeZoneH + safeZoneY - _displayH - (_blockH * 50);


_ctrlBackgroundTimer = WL_DISPLAY_MAIN ctrlCreate ["RscPictureKeepAspect", -1];
_ctrlBackgroundTimer ctrlSetPosition [_displayX + (_blockW * 78), _displayY - (_blockH * 11), _blockW * 75, _blockH * 16];

_ctrlTimer = WL_DISPLAY_MAIN ctrlCreate ["RscStructuredText", -1];
_ctrlTimer ctrlSetPosition [_displayX + (_blockW * 108), _displayY - (_blockH * 12), _blockW * 75, _blockH * 16];


while {true} do {
	_timeLeft = 36000 - serverTime;
	_ctrlTimer ctrlSetScale 1.1;
	_ctrlTimer ctrlSetStructuredText parseText format ["<t color = '#ffffff'>%1</t>", [ _timeLeft, "HH:MM:SS"] call BIS_fnc_secondsToString];
	_ctrlTimer ctrlCommit 0;
	_ctrlBackgroundTimer ctrlSetText "img\timer_ca.paa";
	_ctrlBackgroundTimer ctrlSetScale 0.7;
	_ctrlBackgroundTimer ctrlCommit 0;
	sleep 0.5;
};