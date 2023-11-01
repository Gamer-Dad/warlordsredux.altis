params ["_unit", "_responsibleLeader"];

if ((group _unit) == (group _responsibleLeader)) exitWith {};

if (_unit isKindOf "Man") then {
	if (side (group _unit) == side (group _responsibleLeader)) then {
		_responsibleLeader setVariable ["BIS_WL_friendlyKillTimestamps", (_responsibleLeader getVariable "BIS_WL_friendlyKillTimestamps") + [[serverTime, owner _unit]], [2, (owner _responsibleLeader)]];
		[["Common", "friendlyFire"], 0, "", 20, "", false, true, false, true] remoteExec ["BIS_fnc_advHint", (owner _responsibleLeader)];
		[_responsibleLeader] remoteExec ["BIS_fnc_WL2_askForgiveness", owner _unit];

		_responsibleLeader spawn {
			params ["_responsibleLeader"];
			sleep 30;
			if ((count (_responsibleLeader getVariable "BIS_WL_friendlyKillTimestamps")) >= 2) then {
				_varName = format ["BIS_WL_%1_friendlyKillPenaltyEnd", getPlayerUID _responsibleLeader];
				missionNamespace setVariable [_varName, serverTime + 1800];
				[(missionNamespace getVariable _varName)] remoteExec ["BIS_fnc_WL2_friendlyFireHandleClient", (owner _responsibleLeader)];
			};
		};
	};
} else {
	if (_unit getVariable ["BIS_WL_ownerAsset", "123"] == "123") exitWith {};
	_sideOwner = side group ((_unit getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID);
	_sideCrew = if (count crew _unit > 0) then {side group (crew _unit # 0)} else {_sideOwner};
	if (_sideOwner != _sideCrew) exitWith {};
	if (_sideOwner == (side (group _responsibleLeader))) then {
		_responsibleLeader setVariable ["BIS_WL_friendlyKillTimestamps", (_responsibleLeader getVariable "BIS_WL_friendlyKillTimestamps") + [[serverTime, owner _unit]], [2, (owner _responsibleLeader)]];
		[["Common", "friendlyFire"], 0, "", 20, "", false, true, false, true] remoteExec ["BIS_fnc_advHint", (owner _responsibleLeader)];

		if ((count (_responsibleLeader getVariable "BIS_WL_friendlyKillTimestamps")) >= 2) then {
			_varName = format ["BIS_WL_%1_friendlyKillPenaltyEnd", getPlayerUID _responsibleLeader];
			missionNamespace setVariable [_varName, serverTime + 1800];
			[(missionNamespace getVariable _varName)] remoteExec ["BIS_fnc_WL2_friendlyFireHandleClient", (owner _responsibleLeader)];
		};
	};
};