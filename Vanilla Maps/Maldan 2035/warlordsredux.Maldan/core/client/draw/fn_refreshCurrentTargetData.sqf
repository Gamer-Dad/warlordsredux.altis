#include "..\..\warlords_constants.inc"

if !(isNull WL_TARGET_FRIENDLY) then {
	_color = if (BIS_WL_playerSide in (WL_TARGET_FRIENDLY getVariable ["BIS_WL_revealedBy", []])) then {
		BIS_WL_colorsArray # (BIS_WL_sidesArray find (WL_TARGET_FRIENDLY getVariable "BIS_WL_owner"))
	} else {
		BIS_WL_colorsArray # 3
	};
	_color set [3, 0.5];
	BIS_WL_currentTargetData = [
		format ["\A3\ui_f\data\map\markers\nato\%1.paa", markerType ((WL_TARGET_FRIENDLY getVariable "BIS_WL_markers") # 0)],
		_color,
		[(position WL_TARGET_FRIENDLY) # 0, (position WL_TARGET_FRIENDLY) # 1, 3]
	];
};