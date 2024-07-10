#include "squad_constants.inc"

params ["_control", "_lbCurSel", "_lbSelection"];

private _playerId = _control lbData _lbCurSel;

private _squadManager = missionNamespace getVariable ["SQUAD_MANAGER", []];
private _squadList = _squadManager select {count (_x select 2) > 0};
private _mySquad = _squadList select {(_x select 2) find (getPlayerID player) > -1} select 0;

private _inviteButtonControl = displayCtrl INVITE_BUTTON;

if (isNil "_playerId" || _playerId == "") exitWith {
    ctrlEnable [INVITE_BUTTON, false];
    _inviteButtonControl ctrlSetTooltip (localize "STR_SQUADS_noPlayerSelection");
};
if (isNil "_mySquad") exitWith {
    ctrlEnable [INVITE_BUTTON, false];
    _inviteButtonControl ctrlSetTooltip (localize "STR_SQUADS_fastTravelSquadInvalidNoSquad");
};

ctrlEnable [INVITE_BUTTON, true];
_inviteButtonControl ctrlSetTooltip localize ("STR_SQUADS_inviteSelectedPlayer");