params ["_control", "_selectionPath"];

private _TREE = 5005;
private _PROMOTE_BUTTON = 5013;
private _KICK_BUTTON = 5015;

private _squadManager = missionNamespace getVariable ["SQUAD_MANAGER", []];
private _squadList = _squadManager select {count (_x select 2) > 0};
private _mySquad = _squadList select {(_x select 2) find (getPlayerID player) > -1} select 0;

if (isNil "_mySquad") exitWith {
    ctrlEnable [_PROMOTE_BUTTON, false];
    ctrlEnable [_KICK_BUTTON, false];
};

private _isSquadLeader = (getPlayerID player) == (_mySquad select 1);

private _selectedPlayer = _control tvData _selectionPath;
private _isSelectedPlayerInSquad = (_mySquad select 2) find _selectedPlayer > -1;

if (_isSquadLeader && _isSelectedPlayerInSquad && _selectedPlayer != (getPlayerID player)) then {
    ctrlShow [_PROMOTE_BUTTON, true];
    ctrlShow [_KICK_BUTTON, true];
} else {
    ctrlShow [_PROMOTE_BUTTON, false];
    ctrlShow [_KICK_BUTTON, false];
};