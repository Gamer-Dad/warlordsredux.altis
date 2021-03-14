#include "..\warlords_constants.inc"

params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

if (toLower _weapon == "put") then {
	if !(BIS_WL_playerBase in [BIS_WL_currentSector_WEST, BIS_WL_currentSector_EAST]) then {
		if (_projectile inArea (BIS_WL_playerBase getVariable "objectArea")) then {
			deleteVehicle _projectile;
			_unit addMagazine _magazine;
			playSound "AddItemFailed";
			[toUpper localize "STR_A3_WL_hint_no_mines"] spawn BIS_fnc_WL2_smoothText;
		};
	};
};