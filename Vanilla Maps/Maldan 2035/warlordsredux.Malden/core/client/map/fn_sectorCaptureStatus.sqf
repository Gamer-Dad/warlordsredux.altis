_previousSeizingInfo = [];
_visitedSector = objNull;

while { !BIS_WL_missionEnd } do {
	private _sleepTimer = if (count _previousSeizingInfo == 0) then { 1 } else { 0.25 };
	sleep _sleepTimer;

	private _sectorsToCheck = +(BIS_WL_sectorsArray # 3);
	private _visitedSectorID = _sectorsToCheck findIf {player inArea (_x getVariable "objectAreaComplete")};

	if (_visitedSectorID != -1) then {
		private _sector = _sectorsToCheck # _visitedSectorID;

		private _captureProgress = _sector getVariable ["BIS_WL_captureProgress", 0];
		private _capturingTeam = _sector getVariable ["BIS_WL_capturingTeam", independent];

		private _seizingInfo = [_sector, _capturingTeam, _captureProgress];

		if !(_previousSeizingInfo isEqualTo _seizingInfo) then {
			["seizing", _seizingInfo] spawn WL2_fnc_setOSDEvent;
			_previousSeizingInfo = _seizingInfo;
		} else {
			private _isNotOwned = (_sector getVariable "BIS_WL_owner") != BIS_WL_playerSide;
			private _notSeizing = _captureProgress == 0;
			private _notCapturedBefore = _sector in (BIS_WL_sectorsArray # 7);
			private _notCurrentTarget = if (BIS_WL_playerSide == independent) then {
				true;
			} else {
				_sector != (missionNamespace getVariable format ["BIS_WL_currentTarget_%1", BIS_WL_playerSide]);
			};

			if (_isNotOwned && _notSeizing && _notCapturedBefore && _notCurrentTarget) then {
				["seizingDisabled", [_sector getVariable "BIS_WL_owner"]] spawn WL2_fnc_setOSDEvent;
			};
		};
	} else {
		if (count _previousSeizingInfo > 0) then {
			["seizing", []] spawn WL2_fnc_setOSDEvent;
			["seizingDisabled", []] spawn WL2_fnc_setOSDEvent;
			_previousSeizingInfo = [];
		};
	};
};