params ["_entity"];
if (count MRTM_spawnedSIEDDI >= 5) then {
  private _mines = MRTM_spawnedSIEDDI;
  if (count MRTM_spawnedSIEDDI >= 5) then {
    private _t = _mines find objNull;
    if (_t == -1) then {break};
    _mines deleteAt _t;
  };
  if (count MRTM_spawnedSIEDDI >= 5) then {
    deleteVehicle _entity;
  } else {
    MRTM_spawnedSIEDDI pushBack _entity;
  };
} else {
  MRTM_spawnedSIEDDI pushBack _entity;
};