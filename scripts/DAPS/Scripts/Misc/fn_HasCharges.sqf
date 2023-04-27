private _v = _this;
if !(isNil {_v getVariable "dapsAmmo"}) exitWith {
	if ((_v getVariable "dapsAmmo") > 0) exitWith {TRUE};
	FALSE
};
if!(isNil{_v getVariable "dapsAmmoR"}) exitWith {
	if ((_v getVariable "dapsAmmoR") > 0) exitWith {TRUE};
	if ((_v getVariable "dapsAmmoL") > 0) exitWith {TRUE};
	FALSE
};
FALSE