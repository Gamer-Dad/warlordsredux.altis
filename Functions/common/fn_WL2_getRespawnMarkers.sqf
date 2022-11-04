#include "..\warlords_constants.inc"

params ["_side"];

private _return = [];
private _sideID = ["west", "east", "guerrila"] select (BIS_WL_sidesArray find _side);

for [{_i = 1}, {_i <= WL_RESPAWN_MARKERS_CNT}, {_i = _i + 1}] do {
	_return pushBack format ["respawn_%1_%2", _sideID, _i];
};

_return