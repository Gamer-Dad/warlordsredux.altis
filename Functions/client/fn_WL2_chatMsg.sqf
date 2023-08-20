_h = serverTime + 600;

while {!BIS_WL_missionEnd} do {
	if (serverTime > _h && {!(profileNamespace getVariable ["MRTM_disableHint", true])}) then {
		hintSilent (localize (format ["STR_MRTM_easterEgg_hint_%1", (floor (random 9))]));
		_h = serverTime + 1800;
	};
	sleep 900;
};