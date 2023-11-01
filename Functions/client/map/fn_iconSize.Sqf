params ["_e"];

if (_e isKindOf 'Man') exitWith {19};
if (_e isKindOf 'StaticWeapon') exitWith {19};
if (_e isKindOf 'LandVehicle') exitWith {21};
if (_e isKindOf 'Ship') exitWith {19};
if (_e isKindOf 'Air') exitWith {23};
19;