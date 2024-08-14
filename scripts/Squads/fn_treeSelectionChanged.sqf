#include "squad_constants.inc"

params ["_control", "_selectionPath"];

private _squadManager = missionNamespace getVariable ["SQUAD_MANAGER", []];
private _squadList = _squadManager select {count (_x select 2) > 0};
private _mySquad = _squadList select {(_x select 2) find (getPlayerID player) > -1} select 0;

playSoundUI ["a3\ui_f\data\sound\rsclistbox\soundselect.wss", 0.5];

if (isNil "_mySquad") exitWith {
    ctrlEnable [PROMOTE_BUTTON, false];
    ctrlEnable [KICK_BUTTON, false];
};

private _isSquadLeader = (getPlayerID player) == (_mySquad select 1);

private _selectedPlayer = _control tvData _selectionPath;
private _isSelectedPlayerInSquad = (_mySquad select 2) find _selectedPlayer > -1;

if (_isSquadLeader && _isSelectedPlayerInSquad && _selectedPlayer != (getPlayerID player)) then {
    ctrlShow [PROMOTE_BUTTON, true];
    ctrlShow [KICK_BUTTON, true];
} else {
    ctrlShow [PROMOTE_BUTTON, false];
    ctrlShow [KICK_BUTTON, false];
};