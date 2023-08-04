private["_vehicleType","_APS","_units"];
_APS=_this select 0;
_units=_this select 1;
while{(isNil"dapsDefinitionsLoaded")}do{sleep .2};
waitUntil{dapsDefinitionsLoaded};
_vehicleType="";
sleep(random .3);
for "_i" from 0 to (count _units - 1) do {
	private _x = _units select _i;
	_vehicleType = typeOf _x;
	dapsLight = dapsLight - [_vehicleType];
	dapsMedium = dapsMedium - [_vehicleType];
	dapsHeavy = dapsHeavy - [_vehicleType];
	dapsDazzler = dapsDazzler - [_vehicleType];
	if(_APS == "Light") then {dapsLight pushBack _vehicleType};
	if(_APS == "Medium") then {dapsMedium pushBack _vehicleType};
	if(_APS == "Heavy") then {dapsHeavy pushBack _vehicleType};
	if (_APS == "Dazzler") then {dapsDazzler pushBack _vehicleType};
};
sleep 2;
dapsDefinitionsLoaded2=TRUE;
publicVariable"dapsDefinitionsLoaded2";
sleep .5;
for "_i" from 0 to (count _units - 1) do {
	private _x = _units select _i;
	if (_x isKindOf "Man") then {
		deleteVehicle _x
	} else {
		{
			deleteVehicle _x
		} forEach (crew _x);
		deleteVehicle _x;
	};
};