params ["_entity"];

_minesDB = serverNamespace getVariable "WL2_mineLimits";
_mines = (_minesDB get (typeOf _entity)) # 1;
_limit = (_minesDB get (typeOf _entity)) # 0;

if (count _mines >= _limit) then {
  private _t = _mines find objNull;
  if (_t != -1) then {_mines deleteAt _t;};
  if (count _mines >= _limit) then {
    deleteVehicle _entity;
  } else {
    _mines pushBack _entity;
    _minesDB set [(typeOf _entity), [_limit, _mines]];
  };
} else {
  _mines pushBack _entity;
  _minesDB set [(typeOf _entity), [_limit, _mines]];
};