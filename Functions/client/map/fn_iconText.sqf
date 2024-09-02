params ["_t", ["_gps", false]];

_text = "";
_control = (findDisplay 12) displayCtrl 51;
_continue = if (_gps) then {true} else {(ctrlMapScale _control) < 0.3};

private _nameOverrides = createHashMapFromArray [
	["B_Truck_01_medical_F", "Spawn Truck"],
	["B_Slingload_01_Medevac_F", "Medical Container"],
	["O_Truck_03_medical_F", "Spawn Truck"],
	["Land_Pod_Heli_Transport_04_medevac_F", "Medical Pod"],
	["Land_Communication_F", "Jammer Tower"]
];

if (_continue) then {
	private _vd = _nameOverrides getOrDefault [typeOf _t, getText (configFile >> 'CfgVehicles' >> (typeOf _t) >> 'displayName')];
	if (unitIsUAV _t) then {
		if (isUAVConnected _t) then {
			_op = (UAVControl _t) select 0;
			_text = format ["%1: %2", _vd, (name _op)];
		} else {
			_text = format ["[AUTO] %1", _vd];
		};
	} else {
		_crewVic = crew _t;
		if (count _crewVic == 1) then {
			_crew = (_crewVic select 0);
			if (alive _crew) then {
				if (isPlayer _crew) then {
					_text = (name _crew);
				} else {
					_text = format ["%1 [AI]", (name _crew)];
				};
			};
			_text = format ["%1: %2", _vd, _text];
		} else {
			if (count _crewVic == 0) then {
				_text = _vd;
			} else {
				_playerCrew = _crewVic select {isPlayer _x && {alive _x}};
				{
					if ((_forEachindex + 1) == count _playerCrew) then {
						_text = _text + (name _x);
					} else {
						_text = _text + format ["%1, ", (name _x)];
					};
				} forEach _playerCrew;

				_countCrewAi = count ((_crewVic - _playerCrew) select {alive _x});
				if (_countCrewAi > 0) then {
					_text = _text + format [" +%1", _countCrewAi];
				};
				_text = format ["%1: %2", _vd, _text];
			};
		};
	};
};
_text;