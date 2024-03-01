params ["_asset", "_displayName", "_name", "_blackList", "_special", "_lb"];

_blackList = getArray (missionConfigFile >> "liveryBlacklist" >> str (side player));
_special = [missionConfigFile >> "liveryBlacklist", (typeOf _asset), objNull] call BIS_fnc_returnConfigEntry;

{
	_displayName = getText (_x >> "displayName");
	_name = configName _x;
	if (_displayName != "" && !(_name in _blackList)) then {
		_lb = lbAdd [1502, _name];
		lbSetData [1502, _lb, str ([_name])];
		lbSetCurSel [1502, _lb];
	};
} forEach (configProperties [(configfile >> "CfgVehicles" >> (typeOf _asset) >> "TextureSources"), "isClass _x", true]);

if (_special isEqualType []) then {
	{
	_lb = lbAdd [1502, _x];
	lbSetData [1502, _lb, str ([_x])];
	lbSetCurSel [1502, _lb];
	} forEach _special;
};
