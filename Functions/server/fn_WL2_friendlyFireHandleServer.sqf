#include "..\warlords_constants.inc"

params ["_unit", "_killer", "_instigator"];

if (_unit isKindOf "Man") then {
	if (isNull _instigator) then {_instigator = (if (!isNil {(leader (_killer getVariable ["BIS_WL_ownerAsset", grpNull]))}) then [{(leader (_killer getVariable ["BIS_WL_ownerAsset", grpNull]))}, {((UAVControl vehicle _killer) # 0)}])};
	if (isNull _instigator) then {_instigator = (vehicle _killer)};
	if (!isNull _instigator) then {
		_responsibleLeader = leader _instigator;
		if (isPlayer _responsibleLeader && {_responsibleLeader in BIS_WL_allWarlords}) then {
			if ((side (group _unit)) == (side (group _responsibleLeader)) && {_unit != _responsibleLeader && {(group _unit) != (group _responsibleLeader)}}) then {
				_responsibleLeader setVariable ["BIS_WL_friendlyKillTimestamps", (_responsibleLeader getVariable "BIS_WL_friendlyKillTimestamps") + [serverTime], [2, (owner _responsibleLeader)]];
				[["Common", "friendlyFire"], 0, "", 20, "", false, true, false, true] remoteExec ["BIS_fnc_advHint", (owner _instigator)];
				
				if ((count (_responsibleLeader getVariable "BIS_WL_friendlyKillTimestamps")) >= WL_FRIENDLY_FIRE_THRESHOLD) then {
					_varName = format ["BIS_WL_%1_friendlyKillPenaltyEnd", getPlayerUID _responsibleLeader];
					missionNamespace setVariable [_varName, serverTime + 1800];
					[(missionNamespace getVariable _varName)] remoteExec ["BIS_fnc_WL2_friendlyFireHandleClient", (owner _responsibleLeader)];
				};
			};
		};
	};
};