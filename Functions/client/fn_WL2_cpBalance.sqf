#include "..\warlords_constants.inc"

waituntil {!isnull (findDisplay 46)};

_blockW = safeZoneW / 1000;
_blockH = safeZoneH / (1000 / (getResolution # 4));

_displayW = _blockW * 180;
_displayH = _blockH * 54;
_displayX = safeZoneW + safeZoneX - _displayW - (_blockW * 10);
_displayY = safeZoneH + safeZoneY - _displayH - (_blockH * 50);

_cpBalanceCtrl = findDisplay 46 ctrlCreate ["RscStructuredText", 9876];
_cpBalanceCtrl ctrlSetPosition [_displayX + (_blockW * 88), _displayY - (_blockH * 6), _blockW * 60, _blockH * 16];


while {true} do {
	_balanceMultiplier = missionNamespace getVariable "balanceMultiplier";
	_sideMultiplier = (_balanceMultiplier get (side group player)) - 1; // have to substract 1 here because we can be [0..2] with 1 being the middle. with -1 we get to [-1..1] which makes more sense for displaying.
	_sidePercentage = if(isNil "_sideMultiplier") then [{0}, {_sideMultiplier * 100}];
	_sidePercentage = round _sidePercentage;
	switch (true) do {
		case (_sidePercentage > 0): { 
			_cpBalanceCtrl ctrlSetStructuredText parseText format ["<t size = '%4' >%1%2%3</t>", "+", _sidePercentage,"%", (0.65 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
			_cpBalanceCtrl ctrlSetTextColor [0,1,0,1];
		};
		case (_sidePercentage < 0): { 
			_cpBalanceCtrl ctrlSetStructuredText parseText format ["<t size = '%4' >%1%2%3</t>", "", _sidePercentage,"%", (0.65 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
			_cpBalanceCtrl ctrlSetTextColor [1,0,0,1];
		};
		default { 
			_cpBalanceCtrl ctrlSetStructuredText parseText format ["<t size = '%4' >%1%2%3</t>", "", _sidePercentage,"%", (0.65 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
			_cpBalanceCtrl ctrlSetTextColor [1,1,1,1];
		};
	};
	_cpBalanceCtrl ctrlCommit 0;
	sleep 5;
};