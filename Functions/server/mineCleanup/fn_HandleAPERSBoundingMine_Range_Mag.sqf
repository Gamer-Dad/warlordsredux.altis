params ["_entity"];
if (count MRTM_spawnedAPERSBounding >= 20) then {
  private _mines = MRTM_spawnedAPERSBounding;
  if (count MRTM_spawnedAPERSBounding >= 20) then {
    private _t = _mines find objNull;
    if (_t == -1) then {break};
    _mines deleteAt _t;
  };
  if (count MRTM_spawnedAPERSBounding >= 20) then {
    deleteVehicle _entity;
  } else {
    MRTM_spawnedAPERSBounding pushBack _entity;
  };
} else {
  MRTM_spawnedAPERSBounding pushBack _entity;
};