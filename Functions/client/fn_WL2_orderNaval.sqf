#include "..\warlords_constants.inc"

params ["_class", "_cost"];

"Dropzone" call BIS_fnc_WL2_announcer;
[toUpper localize "STR_A3_WL_popup_airdrop_selection_water"] spawn BIS_fnc_WL2_smoothText;
if !(visibleMap) then {
	processDiaryLink createDiaryLink ["Map", player, ""];
	WL_CONTROL_MAP ctrlMapAnimAdd [0, 0.1, player];
	ctrlMapAnimCommit WL_CONTROL_MAP;
};
BIS_WL_waterDropPos = [];
BIS_WL_currentSelection = WL_ID_SELECTION_ORDERING_NAVAL;
sleep WL_TIMEOUT_SHORT;

_mapClickEH = addMissionEventHandler ["MapSingleClick", {
	params ["_units", "_pos", "_alt", "_shift"];
	if (surfaceIsWater _pos) then {
		BIS_WL_waterDropPos = _pos;
	} else {
		playSound "AddItemFailed";
	};
}];

waitUntil {sleep WL_TIMEOUT_MIN; count BIS_WL_waterDropPos > 0 || {!visibleMap || {BIS_WL_currentSelection == WL_ID_SELECTION_VOTING}}};

if (BIS_WL_currentSelection == WL_ID_SELECTION_ORDERING_NAVAL) then {
	BIS_WL_currentSelection = WL_ID_SELECTION_NONE;
};

removeMissionEventHandler ["MapSingleClick", _mapClickEH];

if (count BIS_WL_waterDropPos == 0) exitWith {
	"Canceled" call BIS_fnc_WL2_announcer;
	[toUpper localize "STR_A3_WL_airdrop_canceled"] spawn BIS_fnc_WL2_smoothText;
};

if (BIS_WL_waterDropPos distance2D player <= 300) then {
	playSound3D ["A3\Data_F_Warlords\sfx\flyby.wss", objNull, FALSE, [BIS_WL_waterDropPos # 0, BIS_WL_waterDropPos # 1, 100]];
};

BIS_WL_waterDropPos set [2, 0];
"Airdrop" call BIS_fnc_WL2_announcer;
[toUpper localize "STR_A3_WL_airdrop_underway"] spawn BIS_fnc_WL2_smoothText;
playSound "AddItemOK";

[player, "orderAsset", _cost, BIS_WL_waterDropPos, _class, false] remoteExec ["BIS_fnc_WL2_handleClientRequest", 2];