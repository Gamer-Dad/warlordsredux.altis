_type = apsVehiclesMap getOrDefault [(typeOf _asset), -1];
_ammo = switch (_type) do {
	case 3: { 0 };	// Dazzler
	case 2: { 6 };	// Heavy
	case 1: { 4 };	// Medium
	case 0: { 2 };	// Light
	default { -1 };	// None
};

_asset setVariable ["apsType", _type, true];
if (_ammo > 0) then {
	_asset setVariable ["apsAmmo", _ammo, true];
};