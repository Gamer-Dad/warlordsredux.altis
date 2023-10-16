params ["_entity"];
if (count MRTM_spawnedSatchels >= 7) then {
  private _mines = MRTM_spawnedSatchels;
  if (count MRTM_spawnedSatchels >= 7) then {
    private _t = _mines find objNull;
    if (_t == -1) then {break};
    _mines deleteAt _t;
  };
  if (count MRTM_spawnedSatchels >= 7) then {
    deleteVehicle _entity;
  } else {
    MRTM_spawnedSatchels pushBack _entity;
  };
} else {
  MRTM_spawnedSatchels pushBack _entity;
};