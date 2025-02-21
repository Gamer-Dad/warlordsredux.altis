/*
	Author: MrThomasM

	Description: Updates the view distance.
*/

_dist = 0;
_exit = false;

if (!_exit && {!((UAVControl getConnectedUAV player # 1) isEqualTo "")}) then {
	setViewDistance (profileNamespace getVariable ["MRTM_drones", 4000]);
	_dist = (profileNamespace getVariable ["MRTM_drones", 4000]);
	_exit = true;
};

if (!_exit && {(vehicle player) isKindOf "Man"}) then {
	setViewDistance (profileNamespace getVariable ["MRTM_inf", 2000]);
	_dist = (profileNamespace getVariable ["MRTM_inf", 2000]);
	_exit = true;
};

if (!_exit && {((vehicle player) isKindOf "LandVehicle") || {((vehicle player) isKindOf "Ship")}}) then {
	setViewDistance (profileNamespace getVariable ["MRTM_ground", 3000]);
	_dist = (profileNamespace getVariable ["MRTM_ground", 3000]);
	_exit = true;
};

if (!_exit && {(vehicle player) isKindOf "Air"}) then {
	setViewDistance (profileNamespace getVariable ["MRTM_air", 4000]);
	_dist = (profileNamespace getVariable ["MRTM_air", 4000]);
	_exit = true;
};

if (profileNamespace getVariable ["MRTM_syncObjects", true]) then {
	setObjectViewDistance [_dist, 100];
	profileNamespace setVariable ["MRTM_objects", _dist];
};