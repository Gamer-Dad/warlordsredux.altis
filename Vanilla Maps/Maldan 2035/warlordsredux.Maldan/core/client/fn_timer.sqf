waituntil {!isnull (findDisplay 46)};

_blockW = safeZoneW / 1000;
_blockH = safeZoneH / (1000 / (getResolution # 4));

_displayW = _blockW * 180;
_displayH = _blockH * 54;
_displayX = safeZoneW + safeZoneX - _displayW - (_blockW * 10);
_displayY = safeZoneH + safeZoneY - _displayH - (_blockH * 50);
_scale = (0.8 call WL2_fnc_purchaseMenuGetUIScale);
_start = missionNamespace getVariable "gameStart";


private _ctrlBackgroundTimer = findDisplay 46 ctrlCreate ["RscStructuredText", 4567];
_ctrlBackgroundTimer ctrlSetPosition [_displayX + (_blockW * 88), _displayY + (_blockH * - 30), _blockW * 40, _blockH * 16];
_ctrlBackgroundTimer ctrlSetStructuredText parseText format ["<img size = '%1' color='#ffffff' image='a3\ui_f\data\igui\cfg\actions\settimer_ca.paa'></img>", _scale];
_ctrlBackgroundTimer ctrlCommit 0;

private _ctrlTimer = findDisplay 46 ctrlCreate ["RscStructuredText", 45671];
_ctrlTimer ctrlSetPosition [_displayX + (_blockW * 105), _displayY + (_blockH * - 29), _blockW * 90, _blockH * 16];

while {(36000 - (serverTime - _start)) > 0} do {
	_ctrlTimer ctrlSetStructuredText parseText format ["<t size = '%2' color = '#ffffff'>%1</t>", [(36000 - (serverTime - _start)), "HH:MM:SS"] call BIS_fnc_secondsToString, _scale];
	_ctrlTimer ctrlCommit 0;
	sleep 0.5;
};