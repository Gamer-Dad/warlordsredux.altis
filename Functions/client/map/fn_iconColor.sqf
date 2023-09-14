params ["_t"];

private _westColor = [0,0.3,0.6,1];
private _eastColor = [0.5,0,0,1];
if ((getPlayerChannel _t) in [1,2]) exitWith {[0,0.8,0,1]};
if (_t in (units player) && {_t != player}) exitWith {[0,0.4,0,1]};
if (side group player == west) exitWith {_westColor};
if (side group player == east) exitWith {_eastColor};
if (side group player == resistance) exitWith {[0,0.6,0,1]};
if (side group player == civilian) exitWith {[0.4,0,0.5,1]};
[0.4,0,0.5,1];