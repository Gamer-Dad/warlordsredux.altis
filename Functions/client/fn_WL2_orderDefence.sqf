#include "..\warlords_constants.inc"

params ["_class", "_cost", "_offset"];

//[player, -_cost] call BIS_fnc_WL2_fundsControl;

if (count _offset != 3) then {
	_offset = [0, 1.5, 0];
};

BIS_WL_currentSelection = WL_ID_SELECTION_DEPLOYING_DEFENCE;

if (visibleMap) then {
	openMap [FALSE, FALSE];
	titleCut ["", "BLACK IN", 0.5];
};

_asset = ["requestAsset", [_class, player modelToWorld _offset, TRUE, TRUE]] call BIS_fnc_WL2_sendClientRequest;

_ownedVehiclesVarID = format ["BIS_WL_%1_ownedVehicles", getPlayerUID player];
missionNamespace setVariable [_ownedVehiclesVarID, WL_PLAYER_VEHS + [_asset]];
publicVariableServer _ownedVehiclesVarID;

_asset lock TRUE;
_asset enableWeaponDisassembly FALSE;
_asset disableCollisionWith player;
_asset hideObject FALSE;

player reveal [_asset, 4];
_asset attachTo [player, _offset];
_h = (position _asset) # 2;
detach _asset;
_offset_tweaked = [_offset select 0, _offset select 1, (_offset select 2) - _h];
_asset attachTo [player, _offset_tweaked];

"assembly" call BIS_fnc_WL2_hintHandle;

BIS_WL_spacePressed = FALSE;
BIS_WL_backspacePressed = FALSE;

_deployKeyHandle = WL_DISPLAY_MAIN displayAddEventHandler ["KeyDown", {
	if (_this # 1 == 57) then {
		if !(BIS_WL_backspacePressed) then {
			BIS_WL_spacePressed = TRUE;
		};
	};
	if (_this # 1 == 14) then {
		if !(BIS_WL_spacePressed) then {
			BIS_WL_backspacePressed = TRUE;
		};
	};
}];

uiNamespace setVariable ["BIS_WL_deployKeyHandle", _deployKeyHandle];

0 spawn {
	waitUntil {
		sleep WL_TIMEOUT_STANDARD;
		BIS_WL_spacePressed ||
		BIS_WL_backspacePressed ||
		vehicle player != player ||
		!alive player ||
		lifeState player == "INCAPACITATED" ||
		triggerActivated BIS_WL_enemiesCheckTrigger ||
		(BIS_WL_sectorsArray # 0) findIf {player inArea (_x getVariable "objectAreaComplete")} == -1
	};
	if !(BIS_WL_spacePressed) then {
		BIS_WL_backspacePressed = TRUE;
	};
};

waitUntil {sleep WL_TIMEOUT_MIN; BIS_WL_spacePressed || BIS_WL_backspacePressed};

WL_DISPLAY_MAIN displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "BIS_WL_deployKeyHandle"];
uiNamespace setVariable ['BIS_WL_deployKeyHandle', nil];
_offset set [1, _asset distance player];
detach _asset;
missionNamespace setVariable [_ownedVehiclesVarID, WL_PLAYER_VEHS - [_asset]];
publicVariable _ownedVehiclesVarID;
_asset call BIS_fnc_WL2_sub_deleteAsset;

["assembly", FALSE] call BIS_fnc_WL2_hintHandle;

if (BIS_WL_spacePressed) then {
	playSound "assemble_target";
	waitUntil {isNull _asset};
	_asset = ["requestAsset", [_class, player modelToWorld _offset, TRUE]] call BIS_fnc_WL2_sendClientRequest;
	[player, _asset] call BIS_fnc_WL2_newAssetHandle;
	_asset enableWeaponDisassembly FALSE;
	_asset setDir direction player;
	player reveal [_asset, 4];
} else {
	[player, _cost] call BIS_fnc_WL2_fundsControl;
	"Canceled" call BIS_fnc_WL2_announcer;
	[toUpper localize "STR_A3_WL_deploy_canceled"] spawn BIS_fnc_WL2_smoothText;
};

if (BIS_WL_currentSelection == WL_ID_SELECTION_DEPLOYING_DEFENCE) then {
	BIS_WL_currentSelection = WL_ID_SELECTION_NONE;
};

sleep 0.1;

showCommandingMenu "";