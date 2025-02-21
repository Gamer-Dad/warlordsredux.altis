#include "..\..\warlords_constants.inc"

params ["_pod", "_maxSeats"];

private _respawnVehicleType = if (_pod) then {
    switch (BIS_WL_playerSide) do {
        case west: {
            "B_Slingload_01_Medevac_F"
        };
        case east: {
            "Land_Pod_Heli_Transport_04_medevac_F"
        };
        case independent: {
            "I_Slingload_01_Medevac_F" // non-functional
        };
    };
} else {
    switch (BIS_WL_playerSide) do {
        case west: {
            "B_Truck_01_medical_F"
        };
        case east: {
            "O_Truck_03_medical_F"
        };
        case independent: {
            "I_Truck_03_medical_F"  // non-functional
        };
    };
};

private _respawnVehicles = (entities _respawnVehicleType) select { alive _x };
private _hasRespawnVehicle = count _respawnVehicles > 0;
if (!_hasRespawnVehicle) exitWith {
    [false, localize "STR_A3_WL_ftVehicle_ft_restr"];
};

private _respawnVehicle = _respawnVehicles # 0;
if ((getPosATL _respawnVehicle # 2) > 5) exitWith {
    [false, localize "STR_A3_WL_ftVehicle_ft_restr"];
};

private _noOpenSeats = count fullCrew [_respawnVehicle, "cargo", false] >= _maxSeats;
if (_noOpenSeats) exitWith {
    [false, localize "STR_A3_WL_ftVehicle_ft_restr"];
};

if ((speed _respawnVehicle) > 1) exitWith {
    [false, localize "STR_A3_WL_ftVehicle_ft_restr"];
};

[true, ""]