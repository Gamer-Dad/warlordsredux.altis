#include "..\warlords_constants.inc"

params ["_unit", "_killer", "_instigator"];

if (!isPlayer _unit || (group _unit) == (group _killer)) exitWith { false };

if (_unit isKindOf "Man") then {
	if (isNull _instigator) then {_instigator = (if !(isNull ((_killer getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID)) then [{((_killer getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID)}, {((UAVControl vehicle _killer) # 0)}])};
	if (isNull _instigator) then {_instigator = (vehicle _killer)};
	if (!isNull _instigator) then {
		_responsibleLeader = leader _instigator;
		if (isPlayer _responsibleLeader && {_responsibleLeader in BIS_WL_allWarlords}) then {
			if ((side (group _unit)) == (side (group _responsibleLeader))) then {
				_responsibleLeader setVariable ["BIS_WL_friendlyKillTimestamps", (_responsibleLeader getVariable "BIS_WL_friendlyKillTimestamps") + [[serverTime, owner _unit]], [2, (owner _responsibleLeader)]];
				[["Common", "friendlyFire"], 0, "", 20, "", false, true, false, true] remoteExec ["BIS_fnc_advHint", (owner _instigator)];

				[_responsibleLeader] remoteExec ["BIS_fnc_WL2_askForgiveness", owner _unit];

				// 3rd offense, instant kill
				if ((count (_responsibleLeader getVariable "BIS_WL_friendlyKillTimestamps")) >= WL_FRIENDLY_FIRE_THRESHOLD) then {
					forceRespawn _responsibleLeader;

					// wait for possible forgiveness
					_responsibleLeader spawn {
						sleep 30;

						if ((count (_this getVariable "BIS_WL_friendlyKillTimestamps")) >= WL_FRIENDLY_FIRE_THRESHOLD) then {
							_varName = format ["BIS_WL_%1_friendlyKillPenaltyEnd", getPlayerUID _this];
							missionNamespace setVariable [_varName, serverTime + 1800];
							[(missionNamespace getVariable _varName)] remoteExec ["BIS_fnc_WL2_friendlyFireHandleClient", (owner _this)];
						};
					};
				};
			};
		};
	};
};