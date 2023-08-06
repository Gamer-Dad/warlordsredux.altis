/*
	Author: MrThomasM

	Description: Sets up an invite between 2 players.
*/
params ["_unit", "_by"];

_unit setVariable [(format ["MRTM_InvitedBy_%1", (getPlayerUID _by)]), true, [(owner _unit), (owner _by)]];