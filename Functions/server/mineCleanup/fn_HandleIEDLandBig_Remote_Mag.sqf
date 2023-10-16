params ["_entity"];
if (count MRTM_spawnedLIEDDI >= 5) then {
  private _mines = MRTM_spawnedLIEDDI;
  if (count MRTM_spawnedLIEDDI >= 5) then {
    private _t = _mines find objNull;
    if (_t == -1) then {break};
    _mines deleteAt _t;
  };
  if (count MRTM_spawnedLIEDDI >= 5) then {
    deleteVehicle _entity;
  } else {
    MRTM_spawnedLIEDDI pushBack _entity;
  };
} else {
  MRTM_spawnedLIEDDI pushBack _entity;
};