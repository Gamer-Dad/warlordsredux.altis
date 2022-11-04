#include "..\warlords_constants.inc"
// Mine array
MRTM_spawnedAPERSMine_Range_Ammo = [];
MRTM_spawnedATMine_Range_Ammo = [];

// use other event handlers for other mines
// give them their own array aswell

addMissionEventhandler ["EntityCreated", {
  params ["_entity"];
  if (typeOf _entity != "APERSMine_Range_Ammo") exitwith {};
  if (count MRTM_spawnedAPERSMine_Range_Ammo >= 50) then {
    private _mines = MRTM_spawnedAPERSMine_Range_Ammo;
    // to get rid of destroyed mines without messing up the order
    if (count MRTM_spawnedAPERSMine_Range_Ammo >= 50) then {
      private _t = _mines find objNull;
      if (_t == -1) then {break};
      _mines deleteAt _t;
    };
    if (count MRTM_spawnedAPERSMine_Range_Ammo >= 50) then {
      deleteVehicle _entity;
    } else {
      MRTM_spawnedAPERSMine_Range_Ammo pushBack _entity;
    };
  } else {
    MRTM_spawnedAPERSMine_Range_Ammo pushBack _entity;
  };
}];

addMissionEventhandler ["EntityCreated", {
  params ["_entity"];
  if (typeOf _entity != "ATMine_Range_Ammo") exitwith {};
  if (count MRTM_spawnedATMine_Range_Ammo >= 50) then {
    private _atmines = MRTM_spawnedATMine_Range_Ammo;
    // to get rid of destroyed mines without messing up the order
    if (count MRTM_spawnedATMine_Range_Ammo >= 50) then {
      private _t = _atmines find objNull;
      if (_t == -1) then {break};
      _atmines deleteAt _t;
    };
    if (count MRTM_spawnedATMine_Range_Ammo >= 50) then {
      deleteVehicle _entity;
    } else {
      MRTM_spawnedATMine_Range_Ammo pushBack _entity;
    };
  } else {
    MRTM_spawnedATMine_Range_Ammo pushBack _entity;
  };
}];