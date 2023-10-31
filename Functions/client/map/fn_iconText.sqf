params ["_t"];

_vd = getText (configFile >> 'CfgVehicles' >> (typeOf _t) >> 'displayName');
_text = "";
_control = (findDisplay 12) displayCtrl 51;
_name = (name _t);
if ((ctrlMapScale _control) < 0.4) then {
	if ((!(alive _t)) && {_t isKindOf 'CAManBase'}) then {
		_text = format ["%1 [K.I.A.]", _name];
	} else {
		if (vehicle _t isKindOf 'CAManBase') then {
			if (isPlayer _t) then {
				_text = _name;
			} else {
				_text = format ["%1 [AI]", _name];
			};
		} else {
			if (unitIsUAV _t) then {
				if (isUAVConnected _t) then {
					_op = (UAVControl _t) select 0;
					_text = format ["%1: %2", _vd, (name _op)];
				} else {
					_text = format ["[AUTO] %1", _vd];
				};
			} else {
				if (count (crew _t) == 1) then {
					_crew = ((crew _t) select 0);
					if (isPlayer _crew) then {
						if (alive _crew) then {
							_text = (name _crew);
						};
					} else {
						if (alive _crew) then {
							_text = format ["%1 [AI]", name ((crew _t) select 0)];
						};
					};
					_text = format ["%1: %2", _vd, _text];
				} else {
					if (count (crew _t) == 0) then {
						_text = _vd;
					} else {
						_playerCrew = (crew _t) select {isPlayer _x && {alive _x}};
						{
							if ((_forEachindex + 1) == count _playerCrew) then {
								_text = _text + (name _x);
							} else {
								_text = _text + format ["%1, ", (name _x)];
							};
						} forEach _playerCrew;

						countCrewAi = count (((crew _t) - _playerCrew) select {alive _x});
						if (countCrewAi > 0) then {
							_text = _text + format [" +%1", countCrewAi];
						};
						_text = format ["%1: %2", _vd, _text];
					};
				};
			};
		};
	};
};
_text;