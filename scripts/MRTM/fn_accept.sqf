/*
	Author: MrThomasM

	Description: Resets an invite between 2 players.
*/
params ["_unit", "_by"];

_invites = missionNamespace getVariable [(format ["MRTM_invitesOut_%1", getPlayerUID _unit]), []];
_invites deleteAt (_invites find (getPlayerUID _by));
missionNamespace setVariable [(format ["MRTM_invitesOut_%1", getPlayerUID _unit]), _invites, [owner _unit, 2]];

_invites1 = missionNamespace getVariable [(format ["MRTM_invitesOut_%1", getPlayerUID _by]), []];
_invites1 deleteAt (_invites1 find (getPlayerUID _unit));
missionNamespace setVariable [(format ["MRTM_invitesOut_%1", getPlayerUID _by]), _invites1, [owner _by, 2]];

_invitesOut = missionNamespace getVariable [(format ["MRTM_invitesIn_%1", getPlayerUID _by]), []];
_invitesOut deleteAt (_invitesOut find (getPlayerUID _unit));
missionNamespace setVariable [(format ["MRTM_invitesIn_%1", getPlayerUID _by]), _invitesOut, [owner _by, 2]];

_invitesOut1 = missionNamespace getVariable [(format ["MRTM_invitesIn_%1", getPlayerUID _unit]), []];
_invitesOut1 deleteAt (_invitesOut1 find (getPlayerUID _by));
missionNamespace setVariable [(format ["MRTM_invitesIn_%1", getPlayerUID _unit]), _invitesOut1, [owner _unit, 2]];