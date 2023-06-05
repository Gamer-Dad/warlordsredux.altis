#include "..\warlords_constants.inc"

waituntil {!isnull (findDisplay 46)};

private _blockW = safeZoneW / 1000;
private _blockH = safeZoneH / (1000 / (getResolution # 4));

private _displayW = _blockW * 180;
private _displayH = _blockH * 54;
private _displayX = safeZoneW + safeZoneX - _displayW - (_blockW * 10);
private _displayY = safeZoneH + safeZoneY - _displayH - (_blockH * 50);


private _ctrlBackgroundTimer = findDisplay 46 ctrlCreate ["RscStructuredText", 4567];
_ctrlBackgroundTimer ctrlSetPosition [_displayX + (_blockW * 88), _displayY + (_blockH * - 30), _blockW * 40, _blockH * 16];

private _ctrlTimer = findDisplay 46 ctrlCreate ["RscStructuredText", 45671];
_ctrlTimer ctrlSetPosition [_displayX + (_blockW * 105), _displayY + (_blockH * - 29), _blockW * 90, _blockH * 16];

while {[0] call BIS_fnc_countdown > 0} do {
	private _timeLeft = [0] call BIS_fnc_countdown;
	_ctrlTimer ctrlSetStructuredText parseText format ["<t size = '%2' color = '#ffffff'>%1</t>", [ _timeLeft, "HH:MM:SS"] call BIS_fnc_secondsToString, (0.8 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
	_ctrlTimer ctrlCommit 0;
	_ctrlBackgroundTimer ctrlSetStructuredText parseText format ["<img size = '%1' color = '#ffffff' image='img\timer_ca.paa'></img>", (0.8 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
	_ctrlBackgroundTimer ctrlCommit 0;
	sleep 0.2;
};
