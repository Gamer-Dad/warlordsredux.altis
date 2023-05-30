private["_vehicleType","_APS","_units"];
_APS=_this select 0;
_units=_this select 1;
while{(isNil"dapsDefinitionsLoaded")}do{sleep .2};
waitUntil{dapsDefinitionsLoaded};
_vehicleType="";
sleep(random .3);
{
	_vehicleType = typeOf _x;
	dapsLight = (dapsLight deleteAt (dapsLight find _vehicleType));
	dapsMedium = (dapsMedium deleteAt (dapsMedium find _vehicleType));
	dapsHeavy = (dapsHeavy deleteAt (dapsHeavy find _vehicleType));
	dapsDazzler = (dapsDazzler deleteAt (dapsDazzler find _vehicleType));
	if(_APS == "Light") then {dapsLight pushBack _vehicleType};
	if(_APS == "Medium") then {dapsMedium pushBack _vehicleType};
	if(_APS == "Heavy") then {dapsHeavy pushBack _vehicleType};
	if (_APS == "Dazzler") then {dapsDazzler pushBack _vehicleType};
} forEach _units;
sleep 2;
dapsDefinitionsLoaded2=TRUE;
publicVariable"dapsDefinitionsLoaded2";
sleep .5;
{
	if (_x isKindOf"MAN") then {
		deleteVehicle _x
	} else {
		{
			deleteVehicle _x
		} forEach (crew _x);
		deleteVehicle _x;
	};
	sleep .1;
}forEach _units;