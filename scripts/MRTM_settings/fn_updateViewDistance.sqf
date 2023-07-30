/*
	Author: MrThomasM

	Description: Updates the view distance.
*/

_dist = 0;
switch (true) do {
	case (!((UAVControl getConnectedUAV player # 1) isEqualTo "")): {
		setViewDistance (profileNamespace getVariable "MRTM_drones");
		_dist = (profileNamespace getVariable "MRTM_drones");
	};

	case ((vehicle player) isKindOf "Man"): {
		setViewDistance (profileNamespace getVariable "MRTM_inf");
		_dist = (profileNamespace getVariable "MRTM_inf");
	};

	case (((vehicle player) isKindOf "LandVehicle") || ((vehicle player) isKindOf "Ship")): {
		setViewDistance (profileNamespace getVariable "MRTM_ground");
		_dist = (profileNamespace getVariable "MRTM_ground");
	};

	case ((vehicle player) isKindOf "Air"): {
		setViewDistance (profileNamespace getVariable "MRTM_air");
		_dist = (profileNamespace getVariable "MRTM_air");
	};
};

if (profileNamespace getVariable "MRTM_syncObjects") then {
	setObjectViewDistance [_dist, 100];
	profileNamespace setVariable ["MRTM_objects", _dist];
};