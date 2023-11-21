_vd = getText (configFile >> 'CfgVehicles' >> (typeOf _x) >> 'displayName');
_text = "";
if !(vehicle _t isKindOf "CAManBase") then {
	_text = _vd;
};
_text;