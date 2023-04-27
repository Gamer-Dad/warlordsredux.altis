if!(isServer)exitWith{};
{
	if (_x isKindOf "landVehicle") then{
		if !(isNil {_x getVariable"dapsType"}) exitWith {};
		_x remoteExec["DAPS_fnc_RegisterVehicle"];
	};
} forEach vehicles;