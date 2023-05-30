#include "..\warlords_constants.inc"

params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit"];

if (unitIsUAV _source) then {_source = leader (_source getVariable "BIS_WL_ownerAsset")};
if !(isNull _source) then {
	_list = (_unit getVariable ["assistList", []]);
	_killerSide = side group _source;
	_unitSide = if (_unit isKindOf "Man") then {
		side group _unit;
	} else {
		switch (true) do {
			case ((side (_unit getVariable "BIS_WL_ownerAsset")) == east): {east};
			case ((side (_unit getVariable "BIS_WL_ownerAsset")) == west): {west};
			case ((getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "side")) == 0): {east};
			case ((getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "side")) == 1): {west};
			case ((getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "side")) == 2): {Independent};
			default {Civilian};
		};
	};
	if (_killerSide != _unitSide) then {
		if ((!(_source in _list)) && (isPlayer _source)) then {
			_list = ((_unit getVariable "assistList") pushBack _source);
		};
		_unit setVariable ["assistList", _list, true];
	};
};