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
	if (missionNamespace getVariable "imbalance" == 0) then {
		_cpBalanceCtrl ctrlSetStructuredText parseText format ["+ %1%2", missionNamespace getVariable "imbalance", "%"];
		_cpBalanceCtrl ctrlSetScale 0.9;
		_cpBalanceCtrl ctrlSetTextColor [1, 1, 1, 1];
	} else {
		if (missionNamespace getVariable "imbalance" > 0) then {
			_west = playersNumber west;
			_east = playersNumber east;
			if (_west > _east) then {
				if (side player == west) then {
					private _imbalance = missionNamespace getVariable "imbalance";
					_cpBalanceCtrl ctrlSetStructuredText parseText format ["<t size = '%3' >- %1%2</t>", round _imbalance, "%", (1 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
					_cpBalanceCtrl ctrlSetTextColor [1, 0, 0, 1];
				} else {
					private _imbalance = missionNamespace getVariable "imbalance";
					_cpBalanceCtrl ctrlSetStructuredText parseText format ["<t size = '%3' >+ %1%2</t>", round _imbalance, "%", (1 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
					_cpBalanceCtrl ctrlSetTextColor [0, 1, 0, 1];
				};
			} else {
				if (_east > _west) then {
					if (side player == west) then {
						private _imbalance = missionNamespace getVariable "imbalance";
						_cpBalanceCtrl ctrlSetStructuredText parseText format ["<t size = '%3' >+ %1%2</t>", round _imbalance, "%", (1 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
						_cpBalanceCtrl ctrlSetTextColor [0, 1, 0, 1];
					} else {
						private _imbalance = missionNamespace getVariable "imbalance";
						_cpBalanceCtrl ctrlSetStructuredText parseText format ["<t size = '%3' >- %1%2</t>", round _imbalance, "%", (1 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale)];
						_cpBalanceCtrl ctrlSetTextColor [1, 0, 0, 1];
					};
				};
			};
		};
	};
	_cpBalanceCtrl ctrlCommit 0;
	sleep 5;
};