//APERS Tripwire Mine (Mag)
params ["_entity"];
if (count MRTM_spawnedTripwires >= 10) then {
  private _mines = MRTM_spawnedTripwires;
  // to get rid of destroyed mines without messing up the order
  if (count MRTM_spawnedTripwires >= 10) then {
    private _t = _mines find objNull;
    if (_t == -1) then {break};
    _mines deleteAt _t;
  };
  if (count MRTM_spawnedTripwires >= 10) then {
    deleteVehicle _entity;
  } else {
    MRTM_spawnedTripwires pushBack _entity;
  };
} else {
  MRTM_spawnedTripwires pushBack _entity;
};