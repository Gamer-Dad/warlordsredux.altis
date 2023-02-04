#include "..\warlords_constants.inc"


balanceKickIn = 2;


//CP Balancing here
[] spawn {
	private _westCount = playersNumber west;
	private _eastCount = playersNumber east;
	while {true} do {
		if (_westCount != 0 && _eastCount != 0) then {
			if (count allPlayers >= balanceKickIn) then {
				if (west > east) then {
					_imbalanceNumber = _westCount / _eastCount;
					_imbalanceMultiplier = 5;
					_imbalancePercentage = _imbalanceNumber * _imbalanceMultiplier;
					missionNamespace setVariable ["imbalance", _imbalancePercentage, true];
				} else {
					if (_eastCount > _westCount) then {
						_imbalanceNumber = _eastCount / _westCount;
						_imbalanceMultiplier = 5;
						_imbalancePercentage = _imbalanceNumber * _imbalanceMultiplier;
						missionNamespace setVariable ["imbalance", _imbalancePercentage, true];
					};
				};
			};
		};
		sleep 10;	
	};
};

while {true} do {
	sleep WL_SECTOR_PAYOFF_PERIOD;	
	{
		_side = _x;
		incomeStandard = _side call BIS_fnc_WL2_income;

		incomeImbalance = (incomeStandard / 100) * (missionNamespace getVariable "imbalance");

		incomeIncreased = incomeStandard + incomeImbalance;
		incomeDecreased = incomeStandard - incomeImbalance;

		private _westCount = playersNumber west;
		private _eastCount = playersNumber east;
		{
			if (count allPlayers >= balanceKickIn) then {
				if (_westCount > _eastCount) then {
					if (side _x == west) then {
						[_x, incomeDecreased] call BIS_fnc_WL2_fundsControl;
					} else {
						[_x, incomeIncreased] call BIS_fnc_WL2_fundsControl;
					};
				} else {
					if (_eastCount > _westCount) then {
						if (side _x == west) then {
							[_x, incomeIncreased] call BIS_fnc_WL2_fundsControl;
						} else {
							[_x, incomeDecreased] call BIS_fnc_WL2_fundsControl;
						};
					};
				};
			} else {
				[_x, incomeStandard] call BIS_fnc_WL2_fundsControl;
			};
		} forEach (BIS_WL_allWarlords select {side group _x == _side});
	} forEach BIS_WL_competingSides;
};
