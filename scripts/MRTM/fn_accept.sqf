/*
	Author: MrThomasM

	Description: Resets an invite between 2 players.
*/
params ["_unit", "_by"];

_invites = _unit getVariable ["MRTM_invitesOut", []];
_invites deleteAt (_invitesOut find (getPlayerUID _by));
_unit setVariable ["MRTM_invitesOut", _invites, [owner _unit, 2]];

_invitesOut = _by getVariable ["MRTM_invitesIn", []];
_invitesOut deleteAt (_invitesOut find (getPlayerUID _unit));
_by setVariable ["MRTM_invitesIn", _invitesOut, [owner _by, 2]];