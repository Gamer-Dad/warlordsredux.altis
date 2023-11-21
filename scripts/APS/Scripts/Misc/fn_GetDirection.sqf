private _v = _this;
private _t = allTurrets [_v, false];
private _d = 0;
private _w = "";
private _wd = [];
if ((count _t) > 0) then {
	_w = (_v weaponsTurret (_t select 0)) select 0;
	_wd = _v weaponDirection _w;
	_d = (_wd select 0) atan2 (_wd select 1);
} else {
	_d = getDir _v;
};
if (_d < 0) then {
	_d = (360 + _d);
};
_d