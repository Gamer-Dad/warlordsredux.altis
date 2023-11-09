private _sectorsWithRunways = BIS_WL_allSectors select {"A" in (_x getVariable "BIS_WL_services")};

if (count _sectorsWithRunways > 0) then {
	{
		private _class = _x;
		private _runwayPos = getArray (_class >> "ilsPosition");
		
		{
			if (_x isEqualType "") then {_runwayPos set [_forEachIndex, parseNumber _x]};
		} forEach _runwayPos;
		
		if (count _runwayPos > 0) then {
			private _taxiInArr = getArray (_class >> "ilsTaxiIn");
			private _spawnPosArr = [];
			_taxiInArrCnt = count _taxiInArr;
			
			for [{_i = 0}, {_i <= (_taxiInArrCnt - 1)}, {_i = _i + 2}] do {
				_spawnPosArr pushBack [_taxiInArr # _i, _taxiInArr # (_i + 1), 0];
			};
			
			private _sectorsWithRunwaysSorted = _sectorsWithRunways apply {[_x distance2D _runwayPos, _x]};
			_sectorsWithRunwaysSorted sort true;
			((_sectorsWithRunwaysSorted # 0) # 1) setVariable ["BIS_WL_runwaySpawnPosArr", _spawnPosArr];
		};
	} forEach ([configFile >> "CfgWorlds" >> worldName] + ("TRUE" configClasses (configFile >> "CfgWorlds" >> worldName >> "SecondaryAirports")));
};