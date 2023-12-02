_list = serverNamespace getVariable [format ["assistList_%1", _unit], []];
{
	_list deleteAt (_list find _x);
} forEach (_list select {isNull _x});

if (unitIsUAV _source) then {_source = ((_source getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID)};
if !(isNull _source) then {
	_killerSide = side group _source;
	_unitSide = if (_unit isKindOf "Man") then {
		side group _unit;
	} else {
		if ((_unit getVariable ["BIS_WL_ownerAsset", "123"]) == "123") then {
			Independent;
		} else {
			(side group ((_unit getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID));
		};
	};

	if (_killerSide != _unitSide && {isPlayer _source}) then {
		if !(_source in _list) then {
			_list pushBack _source;
		};
	};
};
serverNamespace setVariable [format ["assistList_%1", _unit], _list];

_damage;