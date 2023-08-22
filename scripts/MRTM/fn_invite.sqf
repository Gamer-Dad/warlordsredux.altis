/*
	Author: MrThomasM

	Description: Sets up an invite between 2 players.
*/
params ["_unit", "_by"];

_invites = missionNamespace getVariable [(format ["MRTM_invitesIn_%1", getPlayerUID _unit]), []];
_invites pushBackUnique (getPlayerUID _by);
missionNamespace setVariable [(format ["MRTM_invitesIn_%1", getPlayerUID _unit]), _invites, [owner _unit, 2]];

_invitesOut = missionNamespace getVariable [(format ["MRTM_invitesOut_%1", getPlayerUID _by]), []];
_invitesOut pushBackUnique (getPlayerUID _unit);
missionNamespace setVariable [(format ["MRTM_invitesOut_%1", getPlayerUID _by]), _invitesOut, [owner _by, 2]];