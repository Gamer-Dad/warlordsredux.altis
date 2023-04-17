waitUntil {typeOf objectParent player == "B_Plane_Fighter_01_F" || typeOf objectParent player == "B_Plane_CAS_01_dynamicLoadout_F"};

// Vars
(objectParent player) setVariable ["currentTargets", [], true];
(objectParent player) setVariable ["newTargets", [], true];
(objectParent player) setVariable ["voiceAltVolume", 0.3, true];
(objectParent player) setVariable ["voiceVolume", 0.5, true];
(objectParent player) setVariable ["altCeiling", 2000, true];
(objectParent player) setVariable ["isBettyBitching", false, true];
(objectParent player) setVariable ["altEnabled", true, true];
(objectParent player) setVariable ["pullUpEnabled", true, true];
(objectParent player) setVariable ["fuelEnabled", true, true];
(objectParent player) setVariable ["radarTargetSystem", true, true];
(objectParent player) setVariable ["radarVisibleSystem", true, true];


//Pull up warning
0 spawn {
	while {typeOf objectParent player == "B_Plane_Fighter_01_F" || typeOf objectParent player == "B_Plane_CAS_01_dynamicLoadout_F"} do {
		if ((objectParent player) getVariable "bettyEnabled" && (objectParent player) getVariable "altEnabled") then {
			if (getPosATL player select 2 <= (objectParent player) getVariable "altCeiling" && getPosATL player select 2 > 100 && (objectParent player) getVariable "landingGear" == false && (objectParent player) getVariable "isBettyBitching" == false) then {
				if (asin (vectorDir (objectParent player) select 2) < - (((getPosATL player select 2) * 50) / speed (objectParent player))) then {
					playSoundUI ["pullUp", (objectParent player) getVariable "voiceVolume", 1];
					(objectParent player) setVariable ["isBettyBitching", true, true];
					private _startTime = serverTime + 1.33;
					waitUntil {serverTime > _startTime};
					(objectParent player) setVariable ["isBettyBitching", false, true];
				};
			};
		};
		private _startTime1 = serverTime + 1;  
		waitUntil {serverTime > _startTime1};
	};
};

//Altitude warning
0 spawn {
	while {typeOf objectParent player == "B_Plane_Fighter_01_F" || typeOf objectParent player == "B_Plane_CAS_01_dynamicLoadout_F"} do {
		if ((objectParent player) getVariable "bettyEnabled" && (objectParent player) getVariable "pullUpEnabled") then {
			if ((getPosATL player select 2) < 100 && (objectParent player) getVariable "landingGear" == false && (objectParent player) getVariable "isBettyBitching" == false) then {
				playSoundUI ["altWarning", (objectParent player) getVariable "voiceAltVolume", 1];
				(objectParent player) setVariable ["isBettyBitching", true, true];
				private _startTime = serverTime + 1.5; 
				waitUntil {serverTime > _startTime};
				(objectParent player) setVariable ["isBettyBitching", false, true];
				private _startTime2 = serverTime + 1.5; 
				waitUntil {serverTime > _startTime2}; 
			};
		};
		private _startTime1 = serverTime + 1;  
		waitUntil {serverTime > _startTime1};
	};
};

//Bingo fuel
0 spawn {
	while {typeOf objectParent player == "B_Plane_Fighter_01_F" || typeOf objectParent player == "B_Plane_CAS_01_dynamicLoadout_F"} do {
		if ((objectParent player) getVariable "bettyEnabled" && (objectParent player) getVariable "fuelEnabled") then {
			if (fuel (objectParent player) < 0.2) then {
				playSoundUI ["bingoFuel", (objectParent player) getVariable "voiceVolume", 1];
				(objectParent player) setVariable ["isBettyBitching", true, true];
				private _startTime1 = serverTime + 1.6;  
				waitUntil {serverTime > _startTime1};
				(objectParent player) setVariable ["isBettyBitching", false, true];				
			};
		};
		private _startTime1 = serverTime + 2;  
		waitUntil {serverTime > _startTime1};
	};
};

//On enemy sensor
0 spawn {
	while {typeOf objectParent player == "B_Plane_Fighter_01_F" || typeOf objectParent player == "B_Plane_CAS_01_dynamicLoadout_F"} do {
		if ((objectParent player) getVariable "bettyEnabled" && (objectParent player) getVariable "radarVisibleSystem") then {
			if (east knowsAbout (objectParent player) >= 4) then {
				playSoundUI ["radarLock", (objectParent player) getVariable "voiceVolume", 1];
			};
		};
		private _startTime1 = serverTime + 0.52;  
		waitUntil {serverTime > _startTime1};
	};
};

//Sensor targets
0 spawn {
	while {typeOf objectParent player == "B_Plane_Fighter_01_F" || typeOf objectParent player == "B_Plane_CAS_01_dynamicLoadout_F"} do {
		(objectParent player) setVariable ["newTargets", getSensorTargets objectParent player, true];
		if ((objectParent player) getVariable "bettyEnabled" && (objectParent player) getVariable "radarTargetSystem") then {
			if (count ((objectParent player) getVariable "newTargets") > count ((objectParent player) getVariable "currentTargets")) then {
				playSoundUI ["radarTargetNew", (objectParent player) getVariable "voiceVolume", 1];
				sleep 0.1;
			};

			if (count ((objectParent player) getVariable "newTargets") < count ((objectParent player) getVariable "currentTargets")) then {
				playSoundUI ["radarTargetLost", (objectParent player) getVariable "voiceVolume", 1];
				sleep 0.1;
			};
		};
		(objectParent player) setVariable ["currentTargets", (objectParent player) getVariable "newTargets", true];
		sleep 1;
	};
};