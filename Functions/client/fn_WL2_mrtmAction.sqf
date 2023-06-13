Dev_MrThomasM addAction [
	"Talk with the wise villager.",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		Dev_MrThomasM removeAction _actionId;
		0 spawn {
			["Villager", (localize "STR_MRTM_easterEgg_interact_1")] spawn BIS_fnc_showSubtitle;
			sleep 11;
			["Villager", (localize "STR_MRTM_easterEgg_interact_2")] spawn BIS_fnc_showSubtitle;
			sleep 11;
			["Villager", (localize "STR_MRTM_easterEgg_interact_3")] spawn BIS_fnc_showSubtitle;
			sleep 11;
			["Villager", (localize "STR_MRTM_easterEgg_interact_4")] spawn BIS_fnc_showSubtitle;
			sleep 11;
			["Villager", (localize "STR_MRTM_easterEgg_interact_5")] spawn BIS_fnc_showSubtitle;
			sleep 11;
			["Villager", (localize "STR_MRTM_easterEgg_interact_6")] spawn BIS_fnc_showSubtitle;
			sleep 12;
			0 spawn BIS_fnc_WL2_mrtmAction;
		};
	},
	nil,
	150,
	true,
	true,
	"",
	"((cursorObject == Dev_MrThomasM) && {alive player})",
	5
];