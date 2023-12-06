params ["_unit", "_responsibleLeader"];

_uid = _unit getVariable ["BIS_WL_ownerAsset", "123"];
if (_uid == "123" || {_uid == (getPlayerUID _responsibleLeader)}) exitWith {};

if (_unit isKindOf "Man") then {
	if ((group _unit) != (group _responsibleLeader)) then {
		if (side (group _unit) == side (group _responsibleLeader)) then {
			[_responsibleLeader, _unit] remoteExec ["BIS_fnc_WL2_askForgiveness", (owner _unit)];
		};
	};
} else {
	_unitOwner = _uid call BIS_fnc_getUnitByUID;
	_sideOwner = side (group _unitOwner);
	_crew = ((crew _unit) select {alive _x});
	_sideCrew = (if ((count _crew) > 0) then {side (group (_crew # 0))} else {_sideOwner});
	
	if (_sideOwner == side (group _responsibleLeader) && {_sideOwner == _sideCrew}) then {
		_owner = owner _responsibleLeader;
		_responsibleLeader setVariable ["BIS_WL_friendlyKillTimestamps", ((_responsibleLeader getVariable ["BIS_WL_friendlyKillTimestamps", []]) + [[serverTime, getPlayerUID _unit]]), [2, _owner]];
		[_responsibleLeader, _unit] remoteExec ["BIS_fnc_WL2_askForgiveness", (owner _unitOwner)];
	};
};