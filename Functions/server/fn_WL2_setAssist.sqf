_list = serverNamespace getVariable [format ["assistList_%1", _unit], []];
{
	_list deleteAt (_list find _x);
} forEach (_list select {isNull _x});

[format ["L6: %1", _this]] remoteExec ["systemChat", 0];
[format ["L7: %1", _source]] remoteExec ["systemChat", 0];
[format ["L8: %1", ((_source getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID)]] remoteExec ["systemChat", 0];
if (unitIsUAV _source) then {_source = ((_source getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID)};
if !(isNull _source) then {
	_killerSide = side group _source;
	[format ["L12: %1", _killerSide]] remoteExec ["systemChat", 0];
	_unitSide = if (_unit isKindOf "Man") then {
		side group _unit;
	} else {
		if ((_unit getVariable ["BIS_WL_ownerAsset", "123"]) == "123") then {
			Independent;
		} else {
			(side group ((_unit getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID));
		};
	};
	[format ["L22: %1", _unitSide]] remoteExec ["systemChat", 0];

	if (_killerSide != _unitSide && {isPlayer _source}) then {
		if !(_source in _list) then {
			_list pushBack _source;
		};
	};
};
serverNamespace setVariable [format ["assistList_%1", _unit], _list];
[format ["L22: %1", (serverNamespace getVariable [format ["assistList_%1", _unit], "No assists"])]] remoteExec ["systemChat", 0];

_damage;