DEV_MrThomasM addAction [
	"Talk with the wise villager",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		DEV_MrThomasM removeAction _actionId;
		0 spawn BIS_fnc_WL2_mrtmConvo;
	},
	nil,
	150,
	true,
	true,
	"",
	"((alive player) && {cursorObject == Dev_MrThomasM})",
	5
];