/*
	Author: MrThomasM

	Description: Adds stats to the unit.
*/
params ["_event", "_info"];


if (["(EU) #11", serverName] call BIS_fnc_inString) then {
	if (_event == "Seized") exitWith {
		profileNamespace setVariable ["WL2_sectorsSeized", ((profileNamespace getVariable ["WL2_sectorsSeized", 0]) + 1)];
	};

	if (_event == "Won") exitWith {
		profileNamespace setVariable ["WL2_gamesWon", ((profileNamespace getVariable ["WL2_gamesWon", 0]) + 1)];
	};

	if (_event == "Lost") exitWith {
		profileNamespace setVariable ["WL2_gamesLost", ((profileNamespace getVariable ["WL2_gamesLost", 0]) + 1)];
	};

	if (_event == "Kill") exitWith {
		if ((isPlayer _info) && {_info isKindOf "Man"}) then {
			_kills = profileNamespace getVariable ["WL2_totalKills", 0];
			profileNamespace setVariable ["WL2_totalKills", (_kills + 1)];

			_dist = player distanceSqr _info;
			_distanceKill = profileNamespace getVariable ["WL2_longestDistanceKill", 0];
			if (_dist > _distanceKill) then {
				profileNamespace setVariable ["WL2_longestDistanceKill", round _dist];
			};
		};
	};
	if (_event == "Died") exitWith {
		_deaths = profileNamespace getVariable ["WL2_totalDeaths", 0];
		profileNamespace setVariable ["WL2_totalDeaths", (_deaths + 1)];
	};
};