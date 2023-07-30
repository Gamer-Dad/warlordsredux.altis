params ["_vehicle"];

_type = dapsVehiclesMap getOrDefault [(typeOf _vehicle), -1];
_ammo = switch (_type) do {
	case 3: { 0 };	// Dazzler
	case 2: { 6 };	// Heavy
	case 1: { 4 };	// Medium
	case 0: { 2 };	// Light
	default { -1 };	// None
};

if (_ammo > 0) then {
	_vehicle setVariable ["dapsType", _type, true];
	_vehicle setVariable ["dapsAmmo", _ammo, true];
	_vehicle setVariable ["dapsAmmoMax", _ammo, true];
};

if (_ammo == 0) then {
	_vehicle setVariable ["dapsType", _type, true];
};

_vehicle spawn DAPS_fnc_SetupProjectiles;