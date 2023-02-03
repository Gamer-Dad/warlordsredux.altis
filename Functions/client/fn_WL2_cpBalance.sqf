#include "..\warlords_constants.inc"

private _zoneX = safeZoneX;
private _zoneY = safeZoneY;
private _zoneW = safeZoneW;
private _zoneH = safeZoneH;

_cpBalanceCtrl = findDisplay 46 ctrlCreate ["RscStructuredText", 9876];
_cpBalanceCtrl ctrlSetPosition [ 0.895219 * _zoneW + _zoneX, 0.832 * _zoneH + _zoneY, 0.0271875 * _zoneW, 0.040 * _zoneH];


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
					_cpBalanceCtrl ctrlSetStructuredText parseText format ["- %1%2", _imbalance, "%"];
					_cpBalanceCtrl ctrlSetScale 0.9;
					_cpBalanceCtrl ctrlSetTextColor [1, 0, 0, 1];
				} else {
					private _imbalance = missionNamespace getVariable "imbalance";
					_cpBalanceCtrl ctrlSetStructuredText parseText format ["+ %1%2", _imbalance, "%"];
					_cpBalanceCtrl ctrlSetScale 0.9;
					_cpBalanceCtrl ctrlSetTextColor [0, 1, 0, 1];
				};
			} else {
				if (_east > _west) then {
					if (side player == west) then {
						private _imbalance = missionNamespace getVariable "imbalance";
						_cpBalanceCtrl ctrlSetStructuredText parseText format ["+ %1%2", _imbalance, "%"];
						_cpBalanceCtrl ctrlSetScale 0.9;
						_cpBalanceCtrl ctrlSetTextColor [0, 1, 0, 1];
					} else {
						private _imbalance = missionNamespace getVariable "imbalance";
						_cpBalanceCtrl ctrlSetStructuredText parseText format ["- %1%2", _imbalance, "%"];
						_cpBalanceCtrl ctrlSetScale 0.9;
						_cpBalanceCtrl ctrlSetTextColor [1, 0, 0, 1];
					};
				};
			};
		};
	};
	_cpBalanceCtrl ctrlCommit 0;
	sleep 5;
};