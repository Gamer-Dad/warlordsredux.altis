params ["_time"];

waituntil {sleep 1; !isnull (findDisplay 46)};

_blockW = safeZoneW / 1000;
_blockH = safeZoneH / (1000 / (getResolution # 4));

_displayW = _blockW * 180;
_displayH = _blockH * 54;
_displayX = safeZoneW + safeZoneX - _displayW - (_blockW * 10);
_displayY = safeZoneH + safeZoneY - _displayH - (_blockH * 50);

private _ctrlTimer = findDisplay 46 ctrlCreate ["RscStructuredText", 45671];
_ctrlTimer ctrlSetPosition [_displayX + (_blockW * 115), _displayY + (_blockH * - 39), _blockW * 90, _blockH * 16];
_colorArr = ['#d85900', '#000000'];

while {_time >= serverTime} do {
	_timeLeft = _time - serverTime;
	_ctrlTimer ctrlSetStructuredText parseText format ["<t size = '%2' color = '%3'>%1</t>", [ _timeLeft, "MM:SS"] call BIS_fnc_secondsToString, (0.8 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale), (selectRandom _colorArr)];
	_ctrlTimer ctrlCommit 0;
	sleep 0.5;
};

ctrlDelete _ctrlTimer;