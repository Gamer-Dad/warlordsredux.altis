/*
	Author: MrThomasM

	Description: Resets an invite between 2 players.
*/
params ["_unit", "_by"];

_unit setVariable [(format ["MRTM_InvitedBy_%1", (getPlayerUID _by)]), nil, [(owner _unit), (owner _by)]];