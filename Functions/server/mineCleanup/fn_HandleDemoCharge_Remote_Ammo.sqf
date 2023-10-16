params ["_entity"];
if (count MRTM_spawnedDemoCharge >= 5) then {
  private _mines = MRTM_spawnedDemoCharge;
  if (count MRTM_spawnedDemoCharge >= 5) then {
    private _t = _mines find objNull;
    if (_t == -1) then {break};
    _mines deleteAt _t;
  };
  if (count MRTM_spawnedDemoCharge >= 5) then {
    deleteVehicle _entity;
  } else {
    MRTM_spawnedDemoCharge pushBack _entity;
  };
} else {
  MRTM_spawnedDemoCharge pushBack _entity;
};