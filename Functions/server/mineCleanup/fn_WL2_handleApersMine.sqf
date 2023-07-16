//APERS Mine
params ["_entity"];
if (count MRTM_spawnedAPERS >= 20) then {
	private _mines = MRTM_spawnedAPERS;
    // to get rid of destroyed mines without messing up the order
    if (count MRTM_spawnedAPERS >= 20) then {
      private _t = _mines find objNull;
      if (_t == -1) then {break};
      _mines deleteAt _t;
    };

    if (count MRTM_spawnedAPERS >= 20) then {
      deleteVehicle _entity;
    } else {
      MRTM_spawnedAPERS pushBack _entity;
    };
} else {
	MRTM_spawnedAPERS pushBack _entity;
};