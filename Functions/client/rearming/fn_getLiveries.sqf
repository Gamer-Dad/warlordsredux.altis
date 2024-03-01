params ["_asset", "_displayName", "_name", "_blackList"];

_blackList = getArray (missionConfigFile >> "liveryBlacklist" >> str (side player));
{
	_displayName = getText (_x >> "displayName");
	_name = configName _x;
	if (_displayName != "" && !(_name in _blackList)) then {
		_lb = lbAdd [1502, _name];
		lbSetData [1502, _lb, str ([_name])];
		lbSetCurSel [1502, _lb];
	};
} forEach (configProperties [(configfile >> "CfgVehicles" >> (typeOf _asset) >> "TextureSources"), "isClass _x", true]);