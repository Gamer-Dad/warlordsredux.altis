_t = serverTime + 15;
waitUntil { sleep 0.1; ((serverTime > _t) || !(isNil {DEV_MrThomasM}))};

Dev_MrThomasM addAction [
	"Talk with the wise villager",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		Dev_MrThomasM removeAction _actionId;
		0 spawn BIS_fnc_WL2_mrtmConvo;
	},
	nil,
	150,
	true,
	true,
	"",
	"(alive player)",
	5
];