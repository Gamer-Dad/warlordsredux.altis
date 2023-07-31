params ["_event", "_info"];


if (["(EU) #11", serverName] call BIS_fnc_inString) then {
	if (_event == "Seized") exitWith {
		profileNamespace setVariable ["WL2_sectorsSeized", ((profileNamespace getVariable ["WL2_sectorsSeized", 0]) + 1)];
	};

	if (_event == "Won") exitWith {
		profileNamespace setVariable ["WL2_gamesWon", ((profileNamespace getVariable ["WL2_gamesWon", 0]) + 1)];
	};

	if (_event == "Lost") exitWith {
		((profileNamespace getVariable ["WL2_gamesLost", 0]) + 1);
	};

	if (_event == "Kill") exitWith {
		if (_info isKindOf "Man") then {
			_dist = player distance _info;
			_distanceKill = profileNamespace getVariable ["WL2_longestDistanceKill", 0];
			if (_dist > _distanceKill) then {
				profileNamespace setVariable ["WL2_longestDistanceKill", _dist];
			};
		};
	};
};