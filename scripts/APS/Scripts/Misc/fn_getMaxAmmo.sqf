params ["_v"];

private _index = apsVehiclesMap getOrDefault [(typeOf _v), -1];
private _ammo = switch (_index) do {
	case 3: { 0 };
	case 2: { 6 };
	case 1: { 4 };	
	case 0: { 2 };
	default { -1 };
};

_ammo;