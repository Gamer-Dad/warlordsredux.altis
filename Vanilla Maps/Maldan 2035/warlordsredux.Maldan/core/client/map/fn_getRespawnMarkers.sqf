#include "..\..\warlords_constants.inc"

params ["_side"];

private _return = [];
private _sideID = ["west", "east", "guerrila"] select (BIS_WL_sidesArray find _side);

_i = 1;
for "_i" from 1 to WL_RESPAWN_MARKERS_CNT do {
	_return pushBack format ["respawn_%1_%2", _sideID, _i];
};

_return;