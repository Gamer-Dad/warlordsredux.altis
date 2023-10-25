params ["_entity"];

_minesDB = serverNamespace getVariable "BIS_WL2_mineLimits";
_mines = (serverNamespace getVariable "BIS_WL2_mineLimits") get "spawnedSatchelsMag";

if (count _mines >= 7) then {
  private _t = _mines find objNull;
  if (_t != -1) then {_mines deleteAt _t;};
  if (count _mines >= 7) then {
    deleteVehicle _entity;
  } else {
    _mines pushBack _entity;
    _minesDB set ["spawnedSatchelsMag", _mines];
    createVehicle ["Land_Pumpkin_01_halloween_F", (getPosATL _entity), [], 0, "CAN_COLLIDE"];
  };
} else {
  _mines pushBack _entity;
  _minesDB set ["spawnedSatchelsMag", _mines];
  createVehicle ["Land_Pumpkin_01_halloween_F", (getPosATL _entity), [], 0, "CAN_COLLIDE"];
};