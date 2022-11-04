#include "..\warlords_constants.inc"

params ["_sector", "_owner", ["_specialStateArray", []]];

private _ownerIndex = BIS_WL_sidesArray find _owner;
private _area = _sector getVariable "objectArea";
private _previousOwners = _sector getVariable "BIS_WL_previousOwners";
private _mrkrMain = (_sector getVariable "BIS_WL_markers") # 0;
private _mrkrArea = (_sector getVariable "BIS_WL_markers") # 1;
private _mrkrAreaBig = (_sector getVariable "BIS_WL_markers") # 2;

if (_owner == BIS_WL_playerSide || (BIS_WL_playerSide) in _previousOwners) then {
	_mrkrAreaBig setMarkerSizeLocal [0, 0];
	_mrkrArea setMarkerBrushLocal "Border";
};

if (BIS_WL_playerSide in (_sector getVariable "BIS_WL_revealedBy")) then {
	if (_sector in WL_BASES) then {
		_mrkrMain setMarkerSizeLocal [WL_BASE_ICON_SIZE, WL_BASE_ICON_SIZE];
	};
	if (_sector in _specialStateArray) then {
		_mrkrMain setMarkerColorLocal "ColorGrey";
	} else {
		_mrkrMain setMarkerColorLocal (["colorBLUFOR", "colorOPFOR", "colorIndependent"] select _ownerIndex);
	};
	_mrkrArea setMarkerColorLocal (["colorBLUFOR", "colorOPFOR", "colorIndependent"] select _ownerIndex);
	if (_sector in WL_BASES) then {
		_mrkrMain setMarkerTypeLocal (["b_hq", "o_hq", "n_hq"] select _ownerIndex);
	} else {
		_mrkrMain setMarkerTypeLocal (["b_installation", "o_installation", "n_installation"] select _ownerIndex);
	};
};

if (_sector == WL_TARGET_FRIENDLY) then {
	call BIS_fnc_WL2_refreshCurrentTargetData;
};