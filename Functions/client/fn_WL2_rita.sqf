waitUntil {sleep 0.1; typeOf objectParent player == "O_Plane_Fighter_02_F" || typeOf objectParent player == "O_Plane_CAS_02_dynamicLoadout_F"};

// Vars
(objectParent player) setVariable ["altCeiling", 2000];
(objectParent player) setVariable ["isBettyBitching", false];
(objectParent player) setVariable ["landingGear", true];
(objectParent player) setVariable ["Incomming", []];
(objectParent player) addEventHandler ["Gear", {
	params ["_vehicle", "_gearState"];
	if (_gearState == true) then {
		_vehicle setVariable ["landingGear", true];
	} else {
		_vehicle setVariable ["landingGear", false];
	};
}];
(objectParent player) addEventHandler ["IncomingMissile", {
	params ["_target", "_ammo", "_vehicle", "_instigator", "_missile"];
	_target setVariable ["Incomming", ((_target getVariable "Incomming") + [_missile])];
}];

(objectParent player) addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_unit removeAllEventHandlers "Gear";
	_unit removeAllEventHandlers "IncomingMissile";
	_unit removeAllEventHandlers "Killed";
}];

//Pull up warning
0 spawn {
	while {typeOf objectParent player == "O_Plane_Fighter_02_F" || typeOf objectParent player == "O_Plane_CAS_02_dynamicLoadout_F"} do {
		if (MRTM_EnableRWR && {(objectParent player) getVariable "isBettyBitching" == false}) then {
			if (getPosATL player select 2 <= (objectParent player) getVariable "altCeiling" && getPosATL player select 2 > 100 && (objectParent player) getVariable "landingGear" == false) then {
				if (asin (vectorDir (objectParent player) select 2) < - (((getPosATL player select 2) * 40) / speed (objectParent player))) then {
					playSoundUI ["pullUpRita", MRTM_rwr1, 1];
					(objectParent player) setVariable ["isBettyBitching", true];
					private _startTime = serverTime + 2;
					waitUntil {serverTime > _startTime};
					(objectParent player) setVariable ["isBettyBitching", false];
				};
			};
		};
		private _startTime1 = serverTime + 0.2;
		waitUntil {serverTime > _startTime1};
	};
};

//Altitude warning
0 spawn {
	while {typeOf objectParent player == "O_Plane_Fighter_02_F" || typeOf objectParent player == "O_Plane_CAS_02_dynamicLoadout_F"} do {
		if (MRTM_EnableRWR && {(objectParent player) getVariable "isBettyBitching" == false}) then {
			if ((getPosATL player select 2) < 100 && (objectParent player) getVariable "landingGear" == false) then {
				playSoundUI ["altRita", MRTM_rwr2, 1];
				(objectParent player) setVariable ["isBettyBitching", true];
				private _startTime = serverTime + 1.7;
				waitUntil {serverTime > _startTime};
				(objectParent player) setVariable ["isBettyBitching", false];
			};
		};
		private _startTime1 = serverTime + 1;  
		waitUntil {serverTime > _startTime1};
	};
};

//Bingo fuel
0 spawn {
	while {typeOf objectParent player == "O_Plane_Fighter_02_F" || typeOf objectParent player == "O_Plane_CAS_02_dynamicLoadout_F"} do {
		if (MRTM_EnableRWR) then {
			if (fuel (objectParent player) < 0.2) then {
				playSoundUI ["fuelRita", MRTM_rwr4, 1]; 
				(objectParent player) setVariable ["isBettyBitching", true];
				private _startTime = serverTime + 1.9;  
				waitUntil {serverTime > _startTime}; 
				(objectParent player) setVariable ["isBettyBitching", false];				
			};
		};
		private _startTime1 = serverTime + 2;  
		waitUntil {serverTime > _startTime1};
	};
};

//On enemy sensor
0 spawn {
	while {typeOf objectParent player == "O_Plane_Fighter_02_F" || typeOf objectParent player == "O_Plane_CAS_02_dynamicLoadout_F"} do {
		if (MRTM_EnableRWR) then {
			if ((west knowsAbout (objectParent player) >= 4) || (independent knowsAbout (objectParent player) >= 4)) then {
				playSoundUI ["sensorRita", MRTM_rwr3, 1];
			};
		};
		private _startTime1 = serverTime + 0.77;    
		waitUntil {serverTime > _startTime1};
	};
};

0 spawn {
	while {typeOf objectParent player == "B_Plane_Fighter_01_F" || typeOf objectParent player == "B_Plane_CAS_01_dynamicLoadout_F"} do {
		if (MRTM_EnableRWR && {((objectParent player) getVariable "isBettyBitching" == false)}) then {
			(objectParent player) setVariable ["isBettyBitching", true];
           	_incomming = (((objectParent player) getVariable "Incomming") # 0);
			_mDir = ((objectParent player) getRelDir _incomming);
			_3Dir = abs (90 - _mDir);
			_6Dir = abs (180 - _mDir);
			_9Dir = abs (270 - _mDir);
			_12Dir = abs (360 - _mDir);
			_0Dir = abs (0 - _mDir);

			_fDir = 0;
			switch (true) do {
				case ((_6Dir < _9Dir) && (_6Dir < _3Dir) && (_6Dir < _0Dir) && (_6Dir < _12Dir)): {
					_fDir = 180;
				};
				case (((_3Dir < _6Dir)) && (_3Dir < _0Dir) && (_3Dir < _12Dir) && (_3Dir < _9Dir)): {
					_fDir = 90;
				};
				case ((_9Dir < _6Dir) && (_9Dir < _0Dir) && (_9Dir < _12Dir) && (_9Dir < _3Dir)): {
					_fDir = 270;
				};
			};
			_sound = format ["incMissileRuss_%1", _fDir];
			playSoundUI [_sound, (MRTM_rwr4 + 0.5), 1];
			sleep 2.3;
			(objectParent player) setVariable ["isBettyBitching", false];
		};

		{
			(objectParent player) setVariable ["Incomming", (((objectParent player) getVariable "Incomming") - [_x])];
		} forEach (((objectParent player) getVariable "Incomming") select {!alive _x});
		sleep 1;
	};
};