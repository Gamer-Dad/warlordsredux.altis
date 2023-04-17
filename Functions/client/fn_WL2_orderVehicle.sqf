#include "..\warlords_constants.inc"

params ["_class", "_cost", "_requirements"];

"Sector" call BIS_fnc_WL2_announcer;
[toUpper localize "STR_A3_WL_popup_appropriate_sector_selection"] spawn BIS_fnc_WL2_smoothText;
if !(visibleMap) then {
	processDiaryLink createDiaryLink ["Map", player, ""];
	WL_CONTROL_MAP ctrlMapAnimAdd [0, 0.1, player];
	ctrlMapAnimCommit WL_CONTROL_MAP;
};
BIS_WL_targetSector = objNull;
BIS_WL_currentSelection = WL_ID_SELECTION_ORDERING_AIRDROP;
BIS_WL_orderedAssetRequirements = _requirements;
sleep 0.25;

"dropping" spawn BIS_fnc_WL2_sectorSelectionHandle;

waitUntil {sleep WL_TIMEOUT_MIN; !isNull BIS_WL_targetSector || !visibleMap || BIS_WL_currentSelection == WL_ID_SELECTION_VOTING};

["dropping", "end"] call BIS_fnc_WL2_sectorSelectionHandle;

if (BIS_WL_currentSelection == WL_ID_SELECTION_ORDERING_AIRDROP) then {
	BIS_WL_currentSelection = WL_ID_SELECTION_NONE;
};

if (isNull BIS_WL_targetSector) exitWith {
	"Canceled" call BIS_fnc_WL2_announcer;
	[toUpper localize "STR_A3_WL_deploy_canceled"] spawn BIS_fnc_WL2_smoothText;
	[player, _cost] call BIS_fnc_WL2_fundsControl;
};

if (BIS_WL_targetSector distance2D player <= 300) then {
	playSound3D ["A3\Data_F_Warlords\sfx\flyby.wss", objNull, FALSE, [(position BIS_WL_targetSector) # 0, (position BIS_WL_targetSector) # 1, 100]];
};

"Airdrop" call BIS_fnc_WL2_announcer;
[toUpper localize "STR_A3_WL_airdrop_underway"] spawn BIS_fnc_WL2_smoothText;

_asset = ["requestAsset", [_class, BIS_WL_targetSector]] call BIS_fnc_WL2_sendClientRequest;

[player, _asset] call BIS_fnc_WL2_newAssetHandle;

//[player, "orderAsset", _class, _cost, BIS_WL_targetSector] remoteExec ["BIS_fnc_WL2_handleClientRequest", 2];