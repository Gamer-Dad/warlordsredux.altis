params ["_fastTravelMode", "_marker"];

titleCut ["", "BLACK OUT", 1];
openMap [false, false];

"Fast_travel" call WL2_fnc_announcer;

sleep 1;

private _destination = [];
private _sectorPos = if (isNil "BIS_WL_targetSector") then {
	[0, 0, 0];
} else {
	[toUpper format [localize "STR_A3_WL_popup_travelling", BIS_WL_targetSector getVariable "BIS_WL_name"], nil, 3] spawn WL2_fnc_smoothText;
	(BIS_WL_targetSector getVariable "objectAreaComplete") # 0;
};

switch (_fastTravelMode) do {
	case 0: {
		_destination = selectRandom ([BIS_WL_targetSector, 0, true] call WL2_fnc_findSpawnPositions);
	};
	case 1: {
		_destination = ([_marker, 0, true] call WL2_fnc_findSpawnPositions) select {
			private _pos = _x;
			BIS_WL_allSectors findIf {
				_pos inArea ((_x getVariable "BIS_WL_markers") # 2)
			} == -1
		};
		_destination = if (count _destination > 0) then {
			selectRandom _destination;
		} else {
			markerPos _marker;
		};

		[player, "fastTravelContested", getMissionConfigValue ["BIS_WL_fastTravelCostContested", 200]] remoteExec ["WL2_fnc_handleClientRequest", 2];
	};
	case 2: {
		private _randomPos = _marker call BIS_fnc_randomPosTrigger;
		private _distance = _randomPos distance2D BIS_WL_targetSector;
		private _height = _sectorPos # 2;
		_height = _height max 250;
		_destination = [_randomPos # 0, _randomPos # 1, _height + _distance * 0.5];

		[player, "fastTravelContested", getMissionConfigValue ["WL_airAssaultCost", 100]] remoteExec ["WL2_fnc_handleClientRequest", 2];
	};
	case 3: {
		private _safeSpot = selectRandom ([BIS_WL_targetSector, 0, true] call WL2_fnc_findSpawnPositions);
		_destination = [_safeSpot # 0, _safeSpot # 1, 50];

        private _paradropNextUseVar = format ["WL_paradropNextUse_%1", getPlayerUID player];
        missionNamespace setVariable [_paradropNextUseVar, serverTime + 600];

		[player, "fastTravelContested", getMissionConfigValue ["WL_vehicleParadropCost", 1000]] remoteExec ["WL2_fnc_handleClientRequest", 2];
	};
	case 4: {
		private _respawnBag = player getVariable ["WL2_respawnBag", objNull];
        if (!isNull _respawnBag) then {
            _destination = getPosATL _respawnBag;
        };
	};
	case 5: {
		private _sectorHQ = BIS_WL_targetSector getVariable ["WL_sectorHQ", objNull];
		private _posArr = _sectorHQ buildingPos -1;
		_destination = if (count _posArr > 0) then {
			selectRandom _posArr;
		} else {
			getPosATL _sectorHQ;
		};
	};
};

private _tagAlong = (units player) select {
	(_x distance2D player <= 100) &&
	(isNull objectParent _x) &&
	(alive _x) &&
	(_x != player) &&
	_x getVariable ["BIS_WL_ownerAsset", "123"] == getPlayerUID player
};

private _directionToSector = _destination getDir _sectorPos;

switch (_fastTravelMode) do {
	case 0;
	case 1: {
		{
			_x setVehiclePosition [_destination, [], 3, "NONE"];
		} forEach _tagAlong;
		player setVehiclePosition [_destination, [], 0, "NONE"];

		player setDir _directionToSector;
	};
	case 2: {
		{
			_x setPosASL _destination;
			_x setDir _directionToSector;
			[_x] spawn WL2_fnc_parachuteSetup;
		} forEach _tagAlong;

		player setPosASL _destination;
		player setDir _directionToSector;
		[player] spawn WL2_fnc_parachuteSetup;
	};
	case 3: {
		private _vehicle = vehicle player;

		private _parachuteClass = switch (BIS_WL_playerSide) do {
			case west: {
				"B_Parachute_02_F";
			};
			case east: {
				"O_Parachute_02_F";
			};
			case independent: {
				"I_Parachute_02_F";
			};
		};

		private _parachute = createVehicle [_parachuteClass, _destination, [], 0, "NONE"];
		_parachute setDir _directionToSector;
		_vehicle attachTo [_parachute, [0, 0, 0]];
		[_vehicle, _parachute] spawn {
			params ["_vehicle", "_parachute"];
			waitUntil {
				sleep 0.2;
				_parachute setVelocity [0, 0, (velocity _parachute) # 2];
				_parachute setVectorUp [0, 0, 1];
				(getPosATL _vehicle # 2) < 5
			};
			detach _vehicle;
			deleteVehicle _parachute;
		};
	};
	case 4: {
        if (count _destination > 0) then {
            private _oldPlayerPos = getPosASL player;
            player setVehiclePosition [_destination, [], 0, "NONE"];
            private _newPos = getPosATL player;

            if (abs ((_destination # 2) - (_newPos # 2)) > 5) then {
                systemChat "Your tent was left in an invalid spot. Make sure to place it in an open spot outside next time.";
                player setPosASL _oldPlayerPos;
            } else {
				{
					_x setVehiclePosition [_destination, [], 3, "NONE"];
				} forEach _tagAlong;
			};

			private _respawnBag = player getVariable ["WL2_respawnBag", objNull];
			if (!isNull _respawnBag) then {
				deleteVehicle _respawnBag;
			};
            player setVariable ["WL2_respawnBag", objNull, [2, clientOwner]];
        };
	};
	case 5: {
		{
			_x setVehiclePosition [_destination, [], 3, "NONE"];
		} forEach _tagAlong;

		player setVehiclePosition [_destination, [], 0, "NONE"];
	};
};

sleep 1;

titleCut ["", "BLACK IN", 1];

switch (_fastTravelMode) do {
	case 0: {
		["TaskFastTravelSeized"] call WLT_fnc_taskComplete;
	};
	case 1: {
		["TaskFastTravelConflict"] call WLT_fnc_taskComplete;
	};
	case 2: {
		["TaskAirAssault"] call WLT_fnc_taskComplete;
	};
	case 3: {
		["TaskVehicleParadrop"] call WLT_fnc_taskComplete;
	};
	case 4: {
		["TaskFastTravelTent"] call WLT_fnc_taskComplete;
	};
};