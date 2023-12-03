params ["_unit", "_responsibleLeader"];

_inf = _unit isKindOf "Man";
if (_inf && {(group _unit) != (group _responsibleLeader)}) then {
	if (side (group _unit) == side (group _responsibleLeader)) then {
		_owner = owner _responsibleLeader;

		_responsibleLeader setVariable ["BIS_WL_friendlyKillTimestamps", (_responsibleLeader getVariable "BIS_WL_friendlyKillTimestamps") + [[serverTime, getPlayerUID _unit]], [2, _owner]];
		[_responsibleLeader, _unit] remoteExec ["BIS_fnc_WL2_askForgiveness", (owner _unit)];
	};
} else {
	[format ["L12 %1", _inf]] remoteExec ["systemChat", 0];
	if (_inf) exitwith {};
	_uid = _unit getVariable ["BIS_WL_ownerAsset", "123"];
	[format ["L15 %1", _uid]] remoteExec ["systemChat", 0];
	[format ["L16 %1", _uid == (getPlayerUID _responsibleLeader)]] remoteExec ["systemChat", 0];
	if (_uid == "123" || {_uid == (getPlayerUID _responsibleLeader)}) exitWith {};
	_sideOwner = side (group (_uid call BIS_fnc_getUnitByUID));
	_crew = ((crew _unit) select {alive _x});
	_sideCrew = (if ((count _crew) > 0) then {side (group (_crew # 0))} else {_sideOwner});
	[format ["L21 %1", _sideOwner]] remoteExec ["systemChat", 0];
	[format ["L22 %1", _crew]] remoteExec ["systemChat", 0];
	[format ["L23 %1", _sideCrew]] remoteExec ["systemChat", 0];
	[format ["L24 %1", ((count _crew) > 0)]] remoteExec ["systemChat", 0];
	
	[format ["L26 %1", (_sideOwner == side (group _responsibleLeader) && {_sideOwner == _sideCrew})]] remoteExec ["systemChat", 0];
	if (_sideOwner == side (group _responsibleLeader) && {_sideOwner == _sideCrew}) then {
		_owner = owner _responsibleLeader;
		_responsibleLeader setVariable ["BIS_WL_friendlyKillTimestamps", ((_responsibleLeader getVariable ["BIS_WL_friendlyKillTimestamps", []]) + [[serverTime, getPlayerUID _unit]]), [2, _owner]];
		[_responsibleLeader, _unit] remoteExec ["BIS_fnc_WL2_askForgiveness", (owner _unit)];
	};
};