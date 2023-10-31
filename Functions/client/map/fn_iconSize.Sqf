params ["_e"];

if (_e isKindOf 'Man') exitWith {20};
if (_e isKindOf 'StaticWeapon') exitWith {20};
if (_e isKindOf 'LandVehicle') exitWith {25};
if (_e isKindOf 'Ship') exitWith {23};
if (_e isKindOf 'Air') exitWith {25};
20;