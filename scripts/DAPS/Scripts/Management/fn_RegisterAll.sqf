private["_pv"];
_pv = false;
{
	if (!(_x in dapsRegistered) && _x isKindOf "LandVehicle") then {
		dapsRegistered pushBack _x;
		_x remoteExec ["DAPS_fnc_RegisterVehicle"];
		_pv = true
	};
} forEach vehicles;

{
	if !(alive _x) then {
		dapsRegistered deleteAt _forEachIndex;
	};
} forEach dapsRegistered;

if (_pv) then {publicVariable "dapsRegistered"};