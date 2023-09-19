waitUntil {sleep 0.1; ((typeOf objectParent player) ==  "O_Plane_Fighter_02_F" || {(typeOf objectParent player) ==  "O_Plane_CAS_02_dynamicLoadout_F" || {(typeOf objectParent player) ==  "O_Heli_Attack_02_dynamicLoadout_F" || {(typeOf objectParent player) ==  "O_T_VTOL_02_vehicle_dynamicLoadout_F" || {!(alive player)}}}})};

if !(alive player) exitWith {};
_v = (objectParent player);

// Vars
_v setVariable ["altCeiling", 2000];
_v setVariable ["isBettyBitching", false];
_v setVariable ["landingGear", true];
_v setVariable ["Incomming", []];
_v addEventHandler ["Gear", {
	params ["_vehicle", "_gearState"];
	_vehicle setVariable ["landingGear", _gearState];
}];
_v addEventHandler ["IncomingMissile", {
	params ["_target", "_ammo", "_vehicle", "_instigator", "_missile"];
	_target setVariable ["Incomming", ((_target getVariable "Incomming") + [_missile])];
}];

_v addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_unit removeAllEventHandlers "Gear";
	_unit removeAllEventHandlers "IncomingMissile";
	_unit removeAllEventHandlers "Killed";
}];

if (typeOf (vehicle player) == "O_Heli_Attack_02_dynamicLoadout_F") then {
	(vehicle player) setVariable ["landingGear", false];
};

//Pull up warning
0 spawn {
	while {((typeOf (objectParent player) ==  "O_Plane_Fighter_02_F" || {typeOf (objectParent player) ==  "O_Plane_CAS_02_dynamicLoadout_F" || {typeOf (objectParent player) ==  "O_T_VTOL_02_vehicle_dynamicLoadout_F"}}) && {alive player})} do {
		_v = objectParent player;
		if ((profileNamespace getVariable ["MRTM_EnableRWR", true]) && {!(_v getVariable "isBettyBitching")}) then {
			if (getPosATL player select 2 <= _v getVariable "altCeiling" && {getPosATL player select 2 > 100 && {_v getVariable "landingGear" == false}}) then {
				if (asin (vectorDir _v select 2) < - (((getPosATL player select 2) * 40) / speed _v)) then {
					playSoundUI ["pullUpRita", (profileNamespace getVariable ["MRTM_rwr1", 0.3]), 1];
					_v setVariable ["isBettyBitching", true];
					private _startTime = serverTime + 2;
					waitUntil {serverTime > _startTime};
					_v setVariable ["isBettyBitching", false];
				};
			};
		};
		private _startTime1 = serverTime + 0.2;
		waitUntil {serverTime > _startTime1};
	};
};

//Altitude warning
0 spawn {
	while {((typeOf (objectParent player) ==  "O_Plane_Fighter_02_F" || {typeOf (objectParent player) ==  "O_Plane_CAS_02_dynamicLoadout_F" || {typeOf (objectParent player) ==  "O_T_VTOL_02_vehicle_dynamicLoadout_F"}}) && {alive player})} do {
		_v = objectParent player;
		if ((profileNamespace getVariable ["MRTM_EnableRWR", true]) && {!(_v getVariable "isBettyBitching")}) then {
			if ((getPosATL player select 2) < 100 && {_v getVariable "landingGear" == false}) then {
				playSoundUI ["altRita", (profileNamespace getVariable ["MRTM_rwr2", 0.3]), 1];
				_v setVariable ["isBettyBitching", true];
				private _startTime = serverTime + 1.7;
				waitUntil {serverTime > _startTime};
				_v setVariable ["isBettyBitching", false];
			};
		};
		private _startTime1 = serverTime + 1;  
		waitUntil {serverTime > _startTime1};
	};
};

//Bingo fuel
0 spawn {
	while {((typeOf (objectParent player) ==  "O_Plane_Fighter_02_F" || {typeOf (objectParent player) ==  "O_Plane_CAS_02_dynamicLoadout_F" || {typeOf (objectParent player) ==  "O_Heli_Attack_02_dynamicLoadout_F" || {typeOf (objectParent player) ==  "O_T_VTOL_02_vehicle_dynamicLoadout_F"}}}) && {alive player})} do {
		_v = objectParent player;
		if (profileNamespace getVariable ["MRTM_EnableRWR", true]) then {
			if (fuel _v < 0.2) then {
				playSoundUI ["fuelRita", (profileNamespace getVariable ["MRTM_rwr4", 0.3]), 1]; 
				_v setVariable ["isBettyBitching", true];
				private _startTime = serverTime + 1.9;  
				waitUntil {serverTime > _startTime}; 
				_v setVariable ["isBettyBitching", false];				
			};
		};
		private _startTime1 = serverTime + 2;  
		waitUntil {serverTime > _startTime1};
	};
};

0 spawn {
	while {((typeOf (objectParent player) ==  "O_Plane_Fighter_02_F" || {typeOf (objectParent player) ==  "O_Plane_CAS_02_dynamicLoadout_F" || {typeOf (objectParent player) ==  "O_Heli_Attack_02_dynamicLoadout_F" || {typeOf (objectParent player) ==  "O_T_VTOL_02_vehicle_dynamicLoadout_F"}}}) && {alive player})} do {
		_v = objectParent player;
		if ((profileNamespace getVariable ["MRTM_EnableRWR", true]) && {!(_v getVariable "isBettyBitching")}) then {
			if (count (_v getVariable ["Incomming", []]) > 0) then {
				_v setVariable ["isBettyBitching", true];
				_incomming = ((_v getVariable "Incomming") # 0);
				_mDir = (_v getRelDir _incomming);
				_3Dir = abs (90 - _mDir);
				_6Dir = abs (180 - _mDir);
				_9Dir = abs (270 - _mDir);
				_12Dir = abs (360 - _mDir);
				_0Dir = abs (0 - _mDir);

				_fDir = 0;
				switch (true) do {
					case ((_6Dir < _9Dir) && {(_6Dir < _3Dir) && {(_6Dir < _0Dir) && {(_6Dir < _12Dir)}}}): {
						_fDir = 180;
					};
					case (((_3Dir < _6Dir)) && {(_3Dir < _0Dir) && {(_3Dir < _12Dir) && {(_3Dir < _9Dir)}}}): {
						_fDir = 90;
					};
					case ((_9Dir < _6Dir) && {(_9Dir < _0Dir) && {(_9Dir < _12Dir) && {(_9Dir < _3Dir)}}}): {
						_fDir = 270;
					};
				};
				_sound = format ["incMissileRuss_%1", _fDir];
				playSoundUI [_sound, ((profileNamespace getVariable ["MRTM_rwr4", 0.3]) + 0.2), 1];
				sleep 2.3;
				_v setVariable ["isBettyBitching", false];
			};
		};

		{
			_v setVariable ["Incomming", ((_v getVariable "Incomming") - [_x])];
		} forEach ((_v getVariable "Incomming") select {!alive _x});
		sleep 1;
	};
};