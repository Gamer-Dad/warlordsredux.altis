//Small IED (Urban)
params ["_entity"];
if (count MRTM_spawnedSIEDU >= 5) then {
  private _mines = MRTM_spawnedSIEDU;
  // to get rid of destroyed mines without messing up the order
  if (count MRTM_spawnedSIEDU >= 5) then {
    private _t = _mines find objNull;
    if (_t == -1) then {break};
    _mines deleteAt _t;
  };
  if (count MRTM_spawnedSIEDU >= 5) then {
    deleteVehicle _entity;
  } else {
    MRTM_spawnedSIEDU pushBack _entity;
  };
} else {
  MRTM_spawnedSIEDU pushBack _entity;
};