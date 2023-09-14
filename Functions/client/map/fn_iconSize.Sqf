params ["_e"];

if (_e isKindOf 'Man') exitWith {23};
if (_e isKindOf 'StaticWeapon') exitWith {23};
if (_e isKindOf 'LandVehicle') exitWith {27};
if (_e isKindOf 'Ship') exitWith {25};
if (_e isKindOf 'Air') exitWith {25};
23;