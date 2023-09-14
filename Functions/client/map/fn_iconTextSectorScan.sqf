params ["_t"];

_vd = getText (configFile >> 'CfgVehicles' >> (typeOf _t) >> 'displayName');
_text = "";
if !(vehicle _t isKindOf "CAManBase") then {
	_text = _vd;
};
_text;