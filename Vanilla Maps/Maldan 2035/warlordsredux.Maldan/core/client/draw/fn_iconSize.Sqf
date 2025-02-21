if (lifeState _x == "INCAPACITATED") exitWith {35};
if (_x isKindOf 'Man') exitWith {19};
if (_x isKindOf 'StaticWeapon') exitWith {19};
if (_x isKindOf 'LandVehicle') exitWith {21};
if (_x isKindOf 'Ship') exitWith {19};
if (_x isKindOf 'Air') exitWith {23};
19;