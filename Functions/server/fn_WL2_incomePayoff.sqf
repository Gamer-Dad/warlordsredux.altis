#include "..\warlords_constants.inc"


while {true} do {
	sleep WL_SECTOR_PAYOFF_PERIOD;
	{
		_side = _x;
		_income = _side call BIS_fnc_WL2_income;
		{
			[_x, _income] call BIS_fnc_WL2_fundsControl;
		} forEach (BIS_WL_allWarlords select {side group _x == _side});
	} forEach BIS_WL_competingSides;
};

/*
balanceKickIn = 50;


//CP Balancing here
[] spawn {
	_west = playersNumber west;
	_east = playersNumber east;
	if (count allPlayers >= balanceKickIn) then {
		if (_west > _east) then {
			_imbalanceNumber = _west / _east;
			_imbalanceMultiplier = 5;
			_imbalancePercentage = _imbalanceNumber * _imbalanceMultiplier;
			missionNamespace setVariable ["imbalance", _imbalancePercentage, true];
		} else {
			if (_east > _west) then {
				_imbalanceNumber = _east / _west;
				_imbalanceMultiplier = 5;
				_imbalancePercentage = _imbalanceNumber * _imbalanceMultiplier;
				missionNamespace setVariable ["imbalance", _imbalancePercentage, true];
			};
		};
	};
	sleep 10;
};

while {true} do {
	sleep WL_SECTOR_PAYOFF_PERIOD;	
	{
		_side = _x;
		incomeStandard = _side call BIS_fnc_WL2_income;

		incomeImbalance = (incomeStandard / 100) * (missionNamespace getVariable "imbalance");

		incomeIncreased = incomeStandard + incomeImbalance;
		incomeDecreased = incomeStandard - incomeImbalance;
		{
			if (count allPlayers >= balanceKickIn) then {
				if (_west > _east) then {
					if (side _x == west) then {
						[_x, incomeDecreased] call BIS_fnc_WL2_fundsControl;
					} else {
						[_x, incomeIncreased] call BIS_fnc_WL2_fundsControl;
					};
				} else {
					if (_east > _west) then {
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
*/