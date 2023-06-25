#include "..\warlords_constants.inc"

params ["_class", "_cost"];

["RequestMenu_close"] spawn BIS_fnc_WL2_setupUI;
sleep 0.1;

player setVariable ["BIS_WL_isOrdering", true, [2, clientOwner]];
_displayName = getText (configFile >> "CfgVehicles" >> (_class) >> "displayName");
_result = [format ["Are you sure you would like to order: %1", _displayName], "Order asset", true, true] call BIS_fnc_guiMessage;

if (_result) then {
	if (_class isKindOf "Man") then {
		_asset = (group player) createUnit [_class, (getPosATL player), [], 2, "NONE"];
		_assetVariable = call BIS_fnc_WL2_generateVariableName;
		_asset setVehicleVarName _assetVariable;
		[_asset, _assetVariable] remoteExec ["setVehicleVarName", 2];
		[player, _asset] spawn BIS_fnc_WL2_newAssetHandle;
	} else {
		playSound "assemble_target";
		[player, "orderAsset", _cost, (getPosATL player), _class, false] remoteExec ["BIS_fnc_WL2_handleClientRequest", 2];
	};
} else {
	"Canceled" call BIS_fnc_WL2_announcer;
	[toUpper localize "STR_A3_WL_deploy_canceled"] spawn BIS_fnc_WL2_smoothText;
};

player setVariable ["BIS_WL_isOrdering", false, [2, clientOwner]];

sleep 0.1;
showCommandingMenu "";