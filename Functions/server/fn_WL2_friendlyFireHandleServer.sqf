#include "..\warlords_constants.inc"

params ["_unit", "_killer", "_instigator"];

if (_unit isKindOf "Man") then {
	if (isNull _instigator) then {_instigator = (UAVControl vehicle _killer) # 0};
	if (isNull _instigator) then {_instigator = _killer};
	if (!isNull _instigator) then {
		private _responsibleLeader = leader _instigator;
		if (isPlayer _responsibleLeader && _responsibleLeader in BIS_WL_allWarlords) then {
			if (side group _unit == side group _instigator && group _unit != group _instigator) then {
				_friendlyKillTimestamps = _instigator getVariable ["BIS_WL_friendlyKillTimestamps", []];
				_friendlyKillTimestamps pushBack serverTime;
				_friendlyKillTimestamps = _friendlyKillTimestamps select {_x >= serverTime - WL_FRIENDLY_FIRE_PENALTY_MAX};
				_instigator setVariable ["BIS_WL_friendlyKillTimestamps", _friendlyKillTimestamps];
				_friendlyKillTimestampsCnt = count _friendlyKillTimestamps;
				[["Common", "friendlyFire"], 0, "", 20, "", false, true, false, true] remoteExec ["BIS_fnc_advHint", (owner _instigator)];
				
				if (_friendlyKillTimestampsCnt >= WL_FRIENDLY_FIRE_THRESHOLD) then {
					_friendlyKillTimestampsCnt = _friendlyKillTimestampsCnt - WL_FRIENDLY_FIRE_THRESHOLD + 1;
					_varName = format ["BIS_WL_%1_friendlyKillPenaltyEnd", getPlayerUID _responsibleLeader];
					missionNamespace setVariable [_varName, serverTime + (WL_FRIENDLY_FIRE_PENALTY_MAX min (WL_FRIENDLY_FIRE_PENALTY * _friendlyKillTimestampsCnt))];
					(owner _responsibleLeader) publicVariableClient _varName;
				};
			};
		};
	};
};