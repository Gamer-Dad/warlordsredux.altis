params ["_chance"];
if (isNil "MRTM_soundMsgHalloween") then {
	MRTM_soundMsgHalloween = [];
	0 spawn {
		while {!BIS_WL_missionEnd} do {
			waitUntil {sleep 1; count MRTM_soundMsgHalloween > 0};
			playSoundUI [format ["knock_%1", MRTM_soundMsgHalloween select 0], 2.1, 1];
			sleep 3;
			MRTM_soundMsgHalloween deleteAt 0;
		};
	};
};

if ((floor random 10) > _chance) then {
	_side = (selectRandom ["left", "right"]);
	if !(_side in MRTM_soundMsgHalloween) then {
		MRTM_soundMsgHalloween pushBack _side;
	};
};