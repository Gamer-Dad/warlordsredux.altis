#include "..\warlords_constants.inc"

waitUntil {typeOf objectParent player == "B_Plane_Fighter_01_F" || typeOf objectParent player == "B_Plane_CAS_01_dynamicLoadout_F"};

// Vars
(objectParent player) setVariable ["currentTargets", [], true];
(objectParent player) setVariable ["newTargets", [], true];
(objectParent player) setVariable ["altCeiling", 2000, true];
(objectParent player) setVariable ["isBettyBitching", false, true];

//Pull up warning
0 spawn {
	while {typeOf objectParent player == "B_Plane_Fighter_01_F" || typeOf objectParent player == "B_Plane_CAS_01_dynamicLoadout_F"} do {
		if ((objectParent player) getVariable "bettyEnabled") then {
			if (getPosATL player select 2 <= (objectParent player) getVariable "altCeiling" && getPosATL player select 2 > 100 && (objectParent player) getVariable "landingGear" == false && (objectParent player) getVariable "isBettyBitching" == false) then {
				if (asin (vectorDir (objectParent player) select 2) < - (((getPosATL player select 2) * 40) / speed (objectParent player))) then {
					playSoundUI ["pullUp", 0.3, 1];
					(objectParent player) setVariable ["isBettyBitching", true, true];
					private _startTime = serverTime + 1.33;
					waitUntil {serverTime > _startTime};
					(objectParent player) setVariable ["isBettyBitching", false, true];
				};
			};
		};
		private _startTime1 = serverTime + 0.2;  
		waitUntil {serverTime > _startTime1};
	};
};

//Altitude warning
0 spawn {
	while {typeOf objectParent player == "B_Plane_Fighter_01_F" || typeOf objectParent player == "B_Plane_CAS_01_dynamicLoadout_F"} do {
		if ((objectParent player) getVariable "bettyEnabled") then {
			if ((getPosATL player select 2) < 100 && (objectParent player) getVariable "landingGear" == false && (objectParent player) getVariable "isBettyBitching" == false) then {
				playSoundUI ["altWarning", 0.3, 1];
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
		if ((objectParent player) getVariable "bettyEnabled") then {
			if (fuel (objectParent player) < 0.2) then {
				playSoundUI ["bingoFuel", 0.3, 1];
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
		if ((objectParent player) getVariable "bettyEnabled") then {
			if (east knowsAbout (objectParent player) >= 4) then {
				playSoundUI ["radarLock", 0.2, 1];
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
		if ((objectParent player) getVariable "bettyEnabled") then {
			if (count ((objectParent player) getVariable "newTargets") > count ((objectParent player) getVariable "currentTargets")) then {
				playSoundUI ["radarTargetNew", 0.4, 1];
				sleep 0.1;
			};

			if (count ((objectParent player) getVariable "newTargets") < count ((objectParent player) getVariable "currentTargets")) then {
				playSoundUI ["radarTargetLost", 0.4, 1];
				sleep 0.1;
			};
		};
		(objectParent player) setVariable ["currentTargets", (objectParent player) getVariable "newTargets", true];
		sleep WL_TIMEOUT_STANDARD;
	};
};