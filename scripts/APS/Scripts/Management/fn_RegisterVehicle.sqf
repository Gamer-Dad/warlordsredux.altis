_type = apsVehiclesMap getOrDefault [(typeOf _asset), -1];
_ammo = switch (_type) do {
	case 3: { 0 };
	case 2: { 6 };
	case 1: { 4 };
	case 0: { 2 };
	default { -1 };
};

_asset setVariable ["apsType", _type, true];
if (_ammo > 0) then {
	_asset setVariable ["apsAmmo", _ammo, true];
};