params ["_entity"];

_minesDB = serverNamespace getVariable "BIS_WL2_mineLimits";
_mines = (serverNamespace getVariable "BIS_WL2_mineLimits") get "spawnedTripwiresMag";

if (count _mines >= 10) then {
  private _t = _mines find objNull;
  if (_t != -1) then {_mines deleteAt _t;};
  if (count _mines >= 10) then {
    deleteVehicle _entity;
  } else {
    _mines pushBack _entity;
    _minesDB set ["spawnedTripwiresMag", _mines];
  };
} else {
  _mines pushBack _entity;
  _minesDB set ["spawnedTripwiresMag", _mines];
};