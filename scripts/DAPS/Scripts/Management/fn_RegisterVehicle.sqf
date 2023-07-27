params ["_vehicle"];

_type = typeOf _vehicle;
if(_type in dapsLight)exitWith{_vehicle spawn DAPS_fnc_APSlight};
if(_type in dapsMedium)exitWith{_vehicle spawn DAPS_fnc_APSmedium};
if(_type in dapsHeavy)exitWith{_vehicle spawn DAPS_fnc_APSheavy};
if (_type in dapsDazzler) exitWith {_vehicle spawn DAPS_fnc_APSDazzler};