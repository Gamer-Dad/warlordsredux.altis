waitUntil {sleep 0.1; ((typeOf objectParent player) ==  "B_Plane_Fighter_01_F" || {(typeOf objectParent player) ==  "B_Plane_CAS_01_dynamicLoadout_F" || {(typeOf objectParent player) ==  "B_Heli_Attack_01_dynamicLoadout_F" || {(typeOf objectParent player) ==  "B_T_VTOL_01_armed_F" || {(typeOf objectParent player) ==  "B_T_VTOL_01_vehicle_F" || {(typeOf objectParent player) ==  "B_T_VTOL_01_infantry_F" || {!(alive player)}}}}}})};

if !(alive player) exitWith {};
_v = (objectParent player);
// Vars
_v setVariable ["currentTargets", []];
_v setVariable ["newTargets", []];
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
	_inc = _target getVariable "Incomming";
	_inc deleteAt (_inc find _missile);
	_target setVariable ["Incomming", _inc];
}];

_v addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_unit removeAllEventHandlers "Gear";
	_unit removeAllEventHandlers "IncomingMissile";
	_unit removeAllEventHandlers "Killed";
}];

//Pull up warning
0 spawn {
	while {((typeOf (objectParent player) == "B_Plane_Fighter_01_F" || {typeOf (objectParent player) == "B_Plane_CAS_01_dynamicLoadout_F" || {typeOf (objectParent player) == "B_T_VTOL_01_armed_F" || {typeOf (objectParent player) == "B_T_VTOL_01_vehicle_F" || {typeOf (objectParent player) == "B_T_VTOL_01_infantry_F"}}}}) && {alive player})} do {
		_v = (objectParent player);
		if ((profileNamespace getVariable ["MRTM_EnableRWR", true]) && {!(_v getVariable "isBettyBitching")}) then {
			if (getPosATL player select 2 <= _v getVariable "altCeiling" && {getPosATL player select 2 > 100 && {!(_v getVariable "landingGear")}}) then {
				if (asin (vectorDir _v select 2) < - (((getPosATL player select 2) * 40) / speed _v)) then {
					playSoundUI ["pullUp", (profileNamespace getVariable ["MRTM_rwr1", 0.3]), 1];
					_v setVariable ["isBettyBitching", true];
					private _startTime = serverTime + 1.33;
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
	while {((typeOf (objectParent player) == "B_Plane_Fighter_01_F" || {typeOf (objectParent player) == "B_Plane_CAS_01_dynamicLoadout_F" || {typeOf (objectParent player) == "B_T_VTOL_01_armed_F" || {typeOf (objectParent player) == "B_T_VTOL_01_vehicle_F" || {typeOf (objectParent player) == "B_T_VTOL_01_infantry_F"}}}}) && {alive player})} do {
		_v = (objectParent player);
		if ((profileNamespace getVariable ["MRTM_EnableRWR", true]) && {!(_v getVariable "isBettyBitching")}) then {
			if ((getPosATL player select 2) < 100 && {!(_v getVariable "landingGear")}) then {
				playSoundUI ["altWarning", (profileNamespace getVariable ["MRTM_rwr2", 0.3]), 1];
				_v setVariable ["isBettyBitching", true];
				private _startTime = serverTime + 3; 
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
	while {((typeOf (objectParent player) == "B_Plane_Fighter_01_F" || {typeOf (objectParent player) == "B_Plane_CAS_01_dynamicLoadout_F" || {typeOf (objectParent player) == "B_Heli_Attack_01_dynamicLoadout_F" || {typeOf (objectParent player) == "B_T_VTOL_01_armed_F" || {typeOf (objectParent player) == "B_T_VTOL_01_vehicle_F" || {typeOf (objectParent player) == "B_T_VTOL_01_infantry_F"}}}}}) && {alive player})} do {
		_v = (objectParent player);
		if ((profileNamespace getVariable ["MRTM_EnableRWR", true])) then {
			if (fuel _v < 0.2) then {
				playSoundUI ["bingoFuel", (profileNamespace getVariable ["MRTM_rwr4", 0.3]), 1];
				_v setVariable ["isBettyBitching", true];
				private _startTime1 = serverTime + 1.6;  
				waitUntil {serverTime > _startTime1};
				_v setVariable ["isBettyBitching", false];				
			};
		};
		private _startTime1 = serverTime + 2;  
		waitUntil {serverTime > _startTime1};
	};
};

//Sensor targets
0 spawn {
	while {((typeOf (objectParent player) == "B_Plane_Fighter_01_F" || {typeOf (objectParent player) == "B_Plane_CAS_01_dynamicLoadout_F" || {typeOf (objectParent player) == "B_Heli_Attack_01_dynamicLoadout_F" || {typeOf (objectParent player) == "B_T_VTOL_01_armed_F" || {typeOf (objectParent player) == "B_T_VTOL_01_vehicle_F" || {typeOf (objectParent player) == "B_T_VTOL_01_infantry_F"}}}}}) && {alive player})} do {
		_v = (objectParent player);
		_v setVariable ["newTargets", getSensorTargets _v];
		if (profileNamespace getVariable ["MRTM_EnableRWR", true]) then {
			if (count (_v getVariable "newTargets") > count (_v getVariable "currentTargets")) then {
				playSoundUI ["radarTargetNew", (profileNamespace getVariable ["MRTM_rwr4", 0.3]), 1];
				sleep 0.1;
			};

			if (count (_v getVariable "newTargets") < count (_v getVariable "currentTargets")) then {
				playSoundUI ["radarTargetLost", (profileNamespace getVariable ["MRTM_rwr4", 0.3]), 1];
				sleep 0.1;
			};
		};
		_v setVariable ["currentTargets", _v getVariable "newTargets"];
		sleep 1;
	};
};

0 spawn {
	while {((typeOf (objectParent player) == "B_Plane_Fighter_01_F" || {typeOf (objectParent player) == "B_Plane_CAS_01_dynamicLoadout_F" || {typeOf (objectParent player) == "B_Heli_Attack_01_dynamicLoadout_F" || {typeOf (objectParent player) == "B_T_VTOL_01_armed_F" || {typeOf (objectParent player) == "B_T_VTOL_01_vehicle_F" || {typeOf (objectParent player) == "B_T_VTOL_01_infantry_F"}}}}}) && {alive player})} do {
		_v = (objectParent player);
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
				_sound = format ["incMissile_%1", _fDir];
				playSoundUI [_sound, ((profileNamespace getVariable ["MRTM_rwr4", 0.3]) + 0.3), 1];
				sleep 2.3;
				_v setVariable ["isBettyBitching", false];
			};
		};

		{
			_inc = _v getVariable "Incomming";
			_inc deleteAt (_inc find _x);
			_v setVariable ["Incomming", _inc];
		} forEach ((_v getVariable "Incomming") select {!alive _x});
		sleep 1;
	};
};