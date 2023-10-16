params ["_entity"];
if (count MRTM_spawnedSLAMs_Ammo >= 10) then {
  private _mines = MRTM_spawnedSLAMs_Ammo;
  if (count MRTM_spawnedSLAMs_Ammo >= 10) then {
    private _t = _mines find objNull;
    if (_t == -1) then {break};
    _mines deleteAt _t;
  };
  if (count MRTM_spawnedSLAMs_Ammo >= 10) then {
    deleteVehicle _entity;
  } else {
    MRTM_spawnedSLAMs_Ammo pushBack _entity;
  };
} else {
  MRTM_spawnedSLAMs_Ammo pushBack _entity;
};