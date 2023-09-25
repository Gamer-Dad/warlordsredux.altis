params ["_unit", "_responsibleLeader"];

if (!isPlayer _unit || {(group _unit) == (group _responsibleLeader)}) exitWith {};

if ((side (group _unit)) == (side (group _responsibleLeader)) && {group _unit != group _responsibleLeader}) then {
	_responsibleLeader setVariable ["BIS_WL_friendlyKillTimestamps", (_responsibleLeader getVariable "BIS_WL_friendlyKillTimestamps") + [[serverTime, owner _unit]], [2, (owner _responsibleLeader)]];
	[["Common", "friendlyFire"], 0, "", 20, "", false, true, false, true] remoteExec ["BIS_fnc_advHint", (owner _responsibleLeader)];
	[_responsibleLeader] remoteExec ["BIS_fnc_WL2_askForgiveness", owner _unit];

	_responsibleLeader spawn {
		params ["_responsibleLeader"];
		sleep 30;

		if ((count (_responsibleLeader getVariable "BIS_WL_friendlyKillTimestamps")) >= 3) then {
			_varName = format ["BIS_WL_%1_friendlyKillPenaltyEnd", getPlayerUID _responsibleLeader];
			missionNamespace setVariable [_varName, serverTime + 1800];
			[(missionNamespace getVariable _varName)] remoteExec ["BIS_fnc_WL2_friendlyFireHandleClient", (owner _responsibleLeader)];
		};
	};
};