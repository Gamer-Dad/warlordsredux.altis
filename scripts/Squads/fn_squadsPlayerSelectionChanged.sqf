params ["_control", "_lbCurSel", "_lbSelection"];

private _INVITE_BUTTON = 5010;

private _playerId = _control lbData _lbCurSel;

private _squadManager = missionNamespace getVariable ["SQUAD_MANAGER", []];
private _squadList = _squadManager select {count (_x select 2) > 0};
private _mySquad = _squadList select {(_x select 2) find (getPlayerID player) > -1} select 0;

private _INVITE_BUTTON_CTRL = displayCtrl _INVITE_BUTTON;

if (isNil "_playerId" || _playerId == "") exitWith {
    ctrlEnable [_INVITE_BUTTON, false];
    _INVITE_BUTTON_CTRL ctrlSetTooltip (localize "STR_SQUADS_noPlayerSelection");
};
if (isNil "_mySquad") exitWith {
    ctrlEnable [_INVITE_BUTTON, false];
    _INVITE_BUTTON_CTRL ctrlSetTooltip (localize "STR_SQUADS_fastTravelSquadInvalidNoSquad");
};

ctrlEnable [_INVITE_BUTTON, true];
_INVITE_BUTTON_CTRL ctrlSetTooltip localize ("STR_SQUADS_inviteSelectedPlayer");