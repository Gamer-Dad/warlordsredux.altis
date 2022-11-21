#include "..\warlords_constants.inc"

_blockW = safeZoneW / 1000;
_blockH = safeZoneH / (1000 / (getResolution # 4));
_displayW = _blockW * 180;
_displayH = _blockH * 54;
_displayX = safeZoneW + safeZoneX - _displayW - (_blockW * 10);
_displayY = safeZoneH + safeZoneY - _displayH - (_blockH * 50);


_timeLeft = 36000 - serverTime;
_ctrlTimer = WL_DISPLAY_MAIN ctrlCreate ["RscStructuredText", -1];
_ctrlTimer ctrlSetPosition [_displayX + (_blockW * 105), _displayY - (_blockH * 10), _blockW * 75, _blockH * 16];


while {alive player} do {
	if (_timeleft <= 7200) then {
		_ctrlTimer ctrlSetStructuredText parseText format ["~<t color = '#6e0101'>%1</t>", [ _timeLeft, "HH:MM:SS"] call BIS_fnc_secondsToString];
		_ctrlTimer ctrlCommit 0;
		sleep 1;
	};
};