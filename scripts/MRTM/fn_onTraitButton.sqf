if ((lbCurSel 4005) == -1 || (lbCurSel 4009) == -1) exitWith {};

_trait = lbData [4009, (lbCurSel 4009)];
_unit = (lbData [4009, (lbCurSel 4009)]) call BIS_fnc_getUnitByUID;

{
	if (_x == _trait) then {
		if (_trait == "Engineer") then {
			[_unit, [_x, true, false]]remoteExec ["setUnitTrait", _unit];
		} else {
			if (_trait == "TeamLeader") then {
				[(group _unit), _unit] remoteExec ["selectLeader", (group _unit)];
				player setUnitTrait [_x, false, true];
				[_unit, [_x, true, true]]remoteExec ["setUnitTrait", _unit];
			} else {
				[_unit, [_x, true, true]]remoteExec ["setUnitTrait", _unit];
			};
		};
	} else {
		if (_trait == "Engineer") then {
			[_unit, [_x, false, false]]remoteExec ["setUnitTrait", _unit];
		} else {
			[_unit, [_x, false, true]]remoteExec ["setUnitTrait", _unit];
		};
	};
} forEach ["Engineer", "Rifleman", "TeamLeader", "AT", "AA", "Pilot"];