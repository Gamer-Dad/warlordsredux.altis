/*
	Author: MrThomasM

	Description: Sets up an invite between 2 players.
*/
params ["_unit", "_by"];

_invites = _unit getVariable ["MRTM_invitesIn", []];
_invites pushBackUnique (getPlayerUID _by);
_unit setVariable ["MRTM_invitesIn", _invites, [owner _unit, 2]];

_invitesOut = _by getVariable ["MRTM_invitesOut", []];
_invitesOut pushBackUnique (getPlayerUID _unit);
_by setVariable ["MRTM_invitesOut", _invitesOut, [owner _by, 2]];