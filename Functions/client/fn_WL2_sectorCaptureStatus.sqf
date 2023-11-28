_previousSeizingInfo = [];
_visitedSector = objNull;

while {!BIS_WL_missionEnd} do {
	sleep (if (count _previousSeizingInfo == 0) then {1} else {0.25});
	
	_sectorsToCheck = +(BIS_WL_sectorsArray # 3);
	_visitedSectorID = _sectorsToCheck findIf {player inArea (_x getVariable "objectAreaComplete")};
	
	if (_visitedSectorID != -1) then {
		_visitedSector = _sectorsToCheck # _visitedSectorID;
		_info = _visitedSector getVariable ["BIS_WL_seizingInfo", []];
		if !(_previousSeizingInfo isEqualTo _info) then {
			if (count _info > 1) then {
				["seizing", [_visitedSector, _info # 0, _info # 1, _info # 2]] spawn BIS_fnc_WL2_setOSDEvent;
			} else {
				["seizing", []] spawn BIS_fnc_WL2_setOSDEvent;
			};
			_previousSeizingInfo = _info;
		} else {
			if (((_visitedSector getVariable "BIS_WL_owner") != BIS_WL_playerSide) && {(count _info == 0) && {(_visitedSector in (BIS_WL_sectorsArray # 7)) && {(_visitedSector != (missionNamespace getVariable format ["BIS_WL_currentTarget_%1", BIS_WL_playerSide]))}}}) then {
				["seizingDisabled", [_visitedSector getVariable "BIS_WL_owner"]] spawn BIS_fnc_WL2_setOSDEvent;
				_visitedSector setVariable ["BIS_WL_seizingInfo", ["seizingDisabled"]];
				_previousSeizingInfo = ["seizingDisabled"];
			};
		};
	} else {
		if (count _previousSeizingInfo > 0) then {
			["seizing", []] spawn BIS_fnc_WL2_setOSDEvent;
			["seizingDisabled", []] spawn BIS_fnc_WL2_setOSDEvent;
			_previousSeizingInfo = [];
		};
	};
};