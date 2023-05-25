/*
	Author: MrThomasM

	Description: Updates the view distance.
*/

_dist = 0;
switch (true) do {
	case (!((UAVControl getConnectedUAV player # 1) isEqualTo "")): {
		setViewDistance MRTM_drones;
		_dist = MRTM_drones;
	};

	case ((vehicle player) isKindOf "Man"): {
		setViewDistance MRTM_inf;
		_dist = MRTM_inf;
	};

	case (((vehicle player) isKindOf "LandVehicle") || ((vehicle player) isKindOf "Ship")): {
		setViewDistance MRTM_ground;
		_dist = MRTM_ground;
	};

	case ((vehicle player) isKindOf "Air"): {
		setViewDistance MRTM_air;
		_dist = MRTM_air;
	};
};

if(MRTM_syncObjects) then {
	setObjectViewDistance [_dist, 100];
	MRTM_objects = _dist;
};