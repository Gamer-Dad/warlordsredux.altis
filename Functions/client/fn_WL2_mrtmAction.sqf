((missionNamespace getVariable "devMRTM") # 0) addAction [
	"Talk with the wise villager",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		((missionNamespace getVariable "devMRTM") # 0) removeAction _actionId;
		0 spawn BIS_fnc_WL2_mrtmConvo;
	},
	nil,
	150,
	true,
	true,
	"",
	"((alive player) && {cursorObject == ((missionNamespace getVariable 'devMRTM') # 0)})",
	5
];