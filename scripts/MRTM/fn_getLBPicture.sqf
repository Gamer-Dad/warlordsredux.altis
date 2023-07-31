params ["_unit"];

_pic = "a3\ui_f\data\gui\rsc\rscdisplayarcademap\icon_toolbox_units_ca.paa";
if (_unit in (units player)) then {
	if (leader group _unit == _unit) then {
		_pic = "a3\ui_f\data\igui\cfg\cursors\leader_ca.paa";
	} else {
		_pic = "a3\ui_f\data\gui\cfg\ranks\private_gs.paa";
	};
} else {
	if (_unit getVariable [(format ["MRTM_InvitedBy_%1", (getPlayerUID player)]), false]) then {
		_pic = "Img\green_arrow_ca.paa";
	} else {
		if (player getVariable [(format ["MRTM_InvitedBy_%1", (getPlayerUID _unit)]), false]) then {
			_pic = "Img\red_arrow_ca.paa";
		} else {
			if (!(_unit in (units player)) && {count ((units _unit) select {isPlayer _x}) > 1}) then {
				_pic = "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_cancel_ca.paa";	
			};
		};
	};
};

_pic;