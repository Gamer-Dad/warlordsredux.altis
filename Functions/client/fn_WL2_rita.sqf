#include "..\warlords_constants.inc"

waitUntil {typeOf objectParent player == "O_Plane_Fighter_02_F" || typeOf objectParent player == "O_Plane_CAS_02_dynamicLoadout_F"};

// Vars
(objectParent player) setVariable ["altCeiling", 2000, true];
(objectParent player) setVariable ["isBettyBitching", false, true];

//Pull up warning
0 spawn {
	while {typeOf objectParent player == "O_Plane_Fighter_02_F" || typeOf objectParent player == "O_Plane_CAS_02_dynamicLoadout_F"} do {
		if (MRTM_EnableRWR) then {
			if (getPosATL player select 2 <= (objectParent player) getVariable "altCeiling" && getPosATL player select 2 > 100 && (objectParent player) getVariable "landingGear" == false && (objectParent player) getVariable "isBettyBitching" == false) then {
				if (asin (vectorDir (objectParent player) select 2) < - (((getPosATL player select 2) * 40) / speed (objectParent player))) then {
					playSoundUI ["pullUpRita", MRTM_rwr1, 1];
					(objectParent player) setVariable ["isBettyBitching", true, true];
					private _startTime = serverTime + 2;
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
	while {typeOf objectParent player == "O_Plane_Fighter_02_F" || typeOf objectParent player == "O_Plane_CAS_02_dynamicLoadout_F"} do {
		if (MRTM_EnableRWR) then {
			if ((getPosATL player select 2) < 100 && (objectParent player) getVariable "landingGear" == false && (objectParent player) getVariable "isBettyBitching" == false) then {
				playSoundUI ["altRita", MRTM_rwr2, 1];
				(objectParent player) setVariable ["isBettyBitching", true, true];
				private _startTime = serverTime + 1.7;
				waitUntil {serverTime > _startTime};
				(objectParent player) setVariable ["isBettyBitching", false, true];
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
				(objectParent player) setVariable ["isBettyBitching", true, true];
				private _startTime = serverTime + 1.9;  
				waitUntil {serverTime > _startTime}; 
				(objectParent player) setVariable ["isBettyBitching", false, true];				
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