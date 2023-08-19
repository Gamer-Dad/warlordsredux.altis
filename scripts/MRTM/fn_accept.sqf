/*
	Author: MrThomasM

	Description: Resets an invite between 2 players.
*/
params ["_unit", "_by"];

//AMD, Thomas

_invites = _unit getVariable ["MRTM_invitesOut", []];
_invites deleteAt (_invites find (getPlayerUID _by));
_unit setVariable ["MRTM_invitesOut", _invites, [owner _unit, 2]];

_invites1 = _by getVariable ["MRTM_invitesOut", []];
_invites1 deleteAt (_invites1 find (getPlayerUID _unit));
_by setVariable ["MRTM_invitesOut", _invites1, [owner _by, 2]];

_invitesOut = _by getVariable ["MRTM_invitesIn", []];
_invitesOut deleteAt (_invitesOut find (getPlayerUID _unit));
_by setVariable ["MRTM_invitesIn", _invitesOut, [owner _by, 2]];

_invitesOut1 = _unit getVariable ["MRTM_invitesIn", []];
_invitesOut1 deleteAt (_invitesOut1 find (getPlayerUID _by));
_unit setVariable ["MRTM_invitesIn", _invitesOut1, [owner _unit, 2]];