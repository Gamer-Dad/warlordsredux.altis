params ["_asset", "_magTurretsToRemove", "_magTurretsToAdd", "_eligibleFreeRearm"];

{
    _asset removeMagazinesTurret _x;
} forEach _magTurretsToRemove;

{
    _asset addMagazineTurret _x;
} forEach _magTurretsToAdd;

_asset setVariable ["WLM_savedDefaultMags", _magTurretsToAdd, true];
_asset setVehicleAmmo 0;

if (_eligibleFreeRearm) then {
    _asset call WLM_fnc_rearmVehicle;
};