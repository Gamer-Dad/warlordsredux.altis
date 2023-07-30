/*
	Author: MrThomasM

	Description: Updates the view distance.
*/

_dist = 0;
switch (true) do {
	case (!((UAVControl getConnectedUAV player # 1) isEqualTo "")): {
		setViewDistance (profileNamespace getVariable ["MRTM_drones", 4000]);
		_dist = (profileNamespace getVariable ["MRTM_drones", 4000]);
	};

	case ((vehicle player) isKindOf "Man"): {
		setViewDistance (profileNamespace getVariable ["MRTM_inf", 2000]);
		_dist = (profileNamespace getVariable ["MRTM_inf", 2000]);
	};

	case (((vehicle player) isKindOf "LandVehicle") || ((vehicle player) isKindOf "Ship")): {
		setViewDistance (profileNamespace getVariable ["MRTM_ground", 3000]);
		_dist = (profileNamespace getVariable ["MRTM_ground", 3000]);
	};

	case ((vehicle player) isKindOf "Air"): {
		setViewDistance (profileNamespace getVariable ["MRTM_air", 4000]);
		_dist = (profileNamespace getVariable ["MRTM_air", 4000]);
	};
};

if (profileNamespace getVariable ["MRTM_syncObjects", true]) then {
	setObjectViewDistance [_dist, 100];
	profileNamespace setVariable ["MRTM_objects", _dist];
};