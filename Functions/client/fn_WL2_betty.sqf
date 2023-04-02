waitUntil {typeOf objectParent player == "B_Plane_Fighter_01_F" || typeOf objectParent player == "B_Plane_CAS_01_dynamicLoadout_F"};

// Vars
(objectParent player) setVariable ["currentTargets", [], true];
(objectParent player) setVariable ["newTargets", [], true];
(objectParent player) setVariable ["voiceVolume", 0.5, true];
(objectParent player) setVariable ["altCeiling", 2000, true];
(objectParent player) setVariable ["isBettyBitching", false, true];
(objectParent player) setVariable ["altEnabled", true, true];
(objectParent player) setVariable ["pullUpEnabled", true, true];
(objectParent player) setVariable ["fuelEnabled", true, true];
(objectParent player) setVariable ["radarTargetSystem", true, true];
(objectParent player) setVariable ["radarVisibleSystem", true, true];


//Pull up warning
[] spawn {
	while {typeOf objectParent player == "B_Plane_Fighter_01_F" || typeOf objectParent player == "B_Plane_CAS_01_dynamicLoadout_F"} do {
		if ((objectParent player) getVariable "bettyEnabled" && (objectParent player) getVariable "altEnabled") then {
			if (getPosATL player select 2 <= (objectParent player) getVariable "altCeiling" && getPosATL player select 2 > 200 && (objectParent player) getVariable "landingGear" == false && (objectParent player) getVariable "isBettyBitching" == false) then {
				if (asin (vectorDir (objectParent player) select 2) < - (((getPosATL player select 2) * 50) / speed (objectParent player))) then {
					playSoundUI ["pullUp", (objectParent player) getVariable "voiceVolume", 1];
					(objectParent player) setVariable ["isBettyBitching", true, true];
					sleep 1.33;
					(objectParent player) setVariable ["isBettyBitching", false, true];
				};
			};
		};
		sleep 1;
	};
};

//Altitude warning
[] spawn {
	while {typeOf objectParent player == "B_Plane_Fighter_01_F" || typeOf objectParent player == "B_Plane_CAS_01_dynamicLoadout_F"} do {
		if ((objectParent player) getVariable "bettyEnabled" && (objectParent player) getVariable "pullUpEnabled") then {
			if ((getPosATL player select 2) < 200 && (objectParent player) getVariable "landingGear" == false && (objectParent player) getVariable "isBettyBitching" == false) then {
				playSoundUI ["altWarning", ((objectParent player) getVariable "voiceVolume" - 0.2), 1];
				(objectParent player) setVariable ["isBettyBitching", true, true];
				hint "altitude";
				sleep 1.5;
				(objectParent player) setVariable ["isBettyBitching", false, true];
				hint "altitude";
			};
		};
		sleep 1;
	};
};

//Bingo fuel
[] spawn {
	while {typeOf objectParent player == "B_Plane_Fighter_01_F" || typeOf objectParent player == "B_Plane_CAS_01_dynamicLoadout_F"} do {
		if ((objectParent player) getVariable "bettyEnabled" && (objectParent player) getVariable "fuelEnabled") then {
			if (fuel (objectParent player) < 0.2) then {
				playSoundUI ["bingoFuel", (objectParent player) getVariable "voiceVolume", 1];
				(objectParent player) setVariable ["isBettyBitching", true, true];
				sleep 1.6;
				(objectParent player) setVariable ["isBettyBitching", false, true];				
			};
		};
		sleep 2;
	};
};

//On enemy sensor
[] spawn {
	while {typeOf objectParent player == "B_Plane_Fighter_01_F" || typeOf objectParent player == "B_Plane_CAS_01_dynamicLoadout_F"} do {
		if ((objectParent player) getVariable "bettyEnabled" && (objectParent player) getVariable "radarVisibleSystem") then {
			if (east knowsAbout (objectParent player) >= 4) then {
				playSoundUI ["radarLock", (objectParent player) getVariable "voiceVolume", 1];
			};
		};
		sleep 0.53;
	};
};

//Sensor targets
[] spawn {
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