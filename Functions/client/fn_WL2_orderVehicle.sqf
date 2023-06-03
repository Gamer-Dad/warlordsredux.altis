#include "..\warlords_constants.inc"

params ["_class", "_cost"];

["RequestMenu_close"] spawn BIS_fnc_WL2_setupUI;
sleep 0.1;

_displayName = getText (configFile >> "CfgVehicles" >> (_class) >> "displayName");
_result = [format ["Are you sure you would like to order: %1", _displayName], "Order asset", true, true] call BIS_fnc_guiMessage;

if (_result) then {
	playSound "assemble_target";
	[player, "orderAsset", _cost, (getPosATL player), _class, false] remoteExecCall ["BIS_fnc_WL2_handleClientRequest", 2];
} else {
	"Canceled" call BIS_fnc_WL2_announcer;
	[toUpper localize "STR_A3_WL_deploy_canceled"] spawn BIS_fnc_WL2_smoothText;
};

sleep 0.1;
showCommandingMenu "";