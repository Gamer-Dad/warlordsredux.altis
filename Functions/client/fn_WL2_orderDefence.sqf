#include "..\warlords_constants.inc"

params ["_class", "_cost", "_offset"];

if (count _offset != 3) then {
	_offset = [0, 1.5, 0];
};

BIS_WL_currentSelection = WL_ID_SELECTION_DEPLOYING_DEFENCE;

if (visibleMap) then {
	openMap [false, false];
	titleCut ["", "BLACK IN", 0.5];
};

_asset = createVehicle [_class, player modelToWorld _offset, [], 0, "CAN_COLLIDE"];
_asset setDir direction player;
_asset enableSimulationGlobal false;
_asset hideObjectGlobal true;
_asset lock true;
_asset enableWeaponDisassembly false;
_asset allowDamage false;
clearItemCargoGlobal _asset;
clearWeaponCargoGlobal _asset;
clearMagazineCargoGlobal _asset;

{
	[_asset, _x] remoteExecCall ["disableCollisionWith", 0, _asset];
} forEach entities "";
{
	[_asset, _x] remoteExecCall ["disableCollisionWith", 0, _asset];
} forEach allUnits;
_asset hideObject false;

player reveal [_asset, 4];
_asset attachTo [player, _offset];
_h = (position _asset) # 2;
detach _asset;
_offset_tweaked = [_offset select 0, _offset select 1, (_offset select 2) - _h];
_asset attachTo [player, _offset_tweaked];

[player, "assembly"] call BIS_fnc_WL2_hintHandle;

BIS_WL_spacePressed = false;
BIS_WL_backspacePressed = false;

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
		(getPosATL player) select 2 > 1 ||
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
deleteVehicle _asset;

[player, "assembly", false] call BIS_fnc_WL2_hintHandle;

if (BIS_WL_spacePressed) then {
	playSound "assemble_target";
	[player, "orderAsset", _cost, (player modelToWorld _offset), _class, true] remoteExec ["BIS_fnc_WL2_handleClientRequest", 2];
} else {
	"Canceled" call BIS_fnc_WL2_announcer;
	[toUpper localize "STR_A3_WL_deploy_canceled"] spawn BIS_fnc_WL2_smoothText;
};

if (BIS_WL_currentSelection == WL_ID_SELECTION_DEPLOYING_DEFENCE) then {
	BIS_WL_currentSelection = WL_ID_SELECTION_NONE;
};

sleep 0.1;

showCommandingMenu "";