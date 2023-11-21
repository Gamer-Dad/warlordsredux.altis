params ["_unit", "_responsibleLeader"];

if ((group _unit) == (group _responsibleLeader)) exitWith {};

if (_unit isKindOf "Man") then {
	if (side (group _unit) == side (group _responsibleLeader)) then {
		_owner = owner _responsibleLeader;

		_responsibleLeader setVariable ["BIS_WL_friendlyKillTimestamps", (_responsibleLeader getVariable "BIS_WL_friendlyKillTimestamps") + [[serverTime, getPlayerUID _unit]], [2, _owner]];
		[["Common", "friendlyFire"], 0, "", 20, "", false, true, false, true] remoteExec ["BIS_fnc_advHint", _owner];
		[_responsibleLeader, _unit] remoteExec ["BIS_fnc_WL2_askForgiveness", owner _unit];

		_responsibleLeader spawn {
			params ["_responsibleLeader"];
			sleep 30;
			_owner = owner _responsibleLeader;
			if ((count (_responsibleLeader getVariable "BIS_WL_friendlyKillTimestamps")) >= 3) then {
				_varName = format ["BIS_WL_%1_friendlyKillPenaltyEnd", getPlayerUID _responsibleLeader];
				serverNamespace setVariable [_varName, serverTime + 1800];
				[(serverNamespace getVariable _varName)] remoteExec ["BIS_fnc_WL2_friendlyFireHandleClient", _owner];
			};
		};
	};
} else {
	_uid = _unit getVariable ["BIS_WL_ownerAsset", "123"];
	if (_uid == "123" || {_uid == (getPlayerUID _responsibleLeader)}) exitWith {};
	_sideOwner = side (group (_uid call BIS_fnc_getUnitByUID));
	_crew = ((crew _unit) select {alive _x});
	_sideCrew = (if ((count _crew) > 0) then {side (group (_crew # 0))} else {_sideOwner});
	[_sideOwner, _sideCrew, _uid, _crew, ((count _crew) > 0), (if ((count _crew) > 0) then {(side (group (_crew # 0)))} else {"empty"}), (_sideOwner == side (group _responsibleLeader))] remoteExec ["BIS_fnc_WL2_logFF", (owner _responsibleLeader)];
	
	if (_sideOwner == side (group _responsibleLeader) && {_sideOwner == _sideCrew}) then {
		_owner = owner _responsibleLeader;
		_responsibleLeader setVariable ["BIS_WL_friendlyKillTimestamps", ((_responsibleLeader getVariable ["BIS_WL_friendlyKillTimestamps", []]) + [[serverTime, getPlayerUID _unit]]), [2, _owner]];
		[["Common", "friendlyFire"], 0, "", 20, "", false, true, false, true] remoteExec ["BIS_fnc_advHint", _owner];
		[_responsibleLeader, _unit] remoteExec ["BIS_fnc_WL2_askForgiveness", owner _unit];

		_responsibleLeader spawn {
			params ["_responsibleLeader"];
			sleep 30;
			_owner = owner _responsibleLeader;
			if ((count (_responsibleLeader getVariable "BIS_WL_friendlyKillTimestamps")) >= 3) then {
				_varName = format ["BIS_WL_%1_friendlyKillPenaltyEnd", getPlayerUID _responsibleLeader];
				serverNamespace setVariable [_varName, serverTime + 1800];
				[(serverNamespace getVariable _varName)] remoteExec ["BIS_fnc_WL2_friendlyFireHandleClient", _owner];
			};
		};
	};
};