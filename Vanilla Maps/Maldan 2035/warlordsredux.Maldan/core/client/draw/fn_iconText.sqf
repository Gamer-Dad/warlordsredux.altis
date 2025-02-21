params ["_asset", ["_gps", false]];

private _text = "";
private _control = (findDisplay 12) displayCtrl 51;
private _continue = if (_gps) then {true} else {(ctrlMapScale _control) < 0.3};

if (_continue) then {
	private _vehicleDisplayName = [_asset] call WL2_fnc_getAssetTypeName;

	private _ammo = _asset getVariable ["WLM_ammoCargo", 0];
	if (_ammo > 0) then {
		private _ammoDisplay = (_ammo call BIS_fnc_numberText) regexReplace [" ", ","];
		_vehicleDisplayName = format ["%1 [%2 kg]", _vehicleDisplayName, _ammoDisplay];
	};

	if (unitIsUAV _asset) then {
		if (isUAVConnected _asset) then {
			private _op = (UAVControl _asset) select 0;
			_text = format ["%1: %2", _vehicleDisplayName, (name _op)];
		} else {
			_text = format ["[AUTO] %1", _vehicleDisplayName];
		};
	} else {
		private _crewVic = crew _asset;
		if (count _crewVic == 1) then {
			private _crew = (_crewVic select 0);
			if (alive _crew) then {
				if (isPlayer _crew) then {
					_text = (name _crew);
				} else {
					_text = format ["%1 [AI]", (name _crew)];
				};
			};
			_text = format ["%1: %2", _vehicleDisplayName, _text];
		} else {
			if (count _crewVic == 0) then {
				_text = _vehicleDisplayName;
			} else {
				private _playerCrew = _crewVic select {isPlayer _x && {alive _x}};
				{
					if ((_forEachindex + 1) == count _playerCrew) then {
						_text = _text + (name _x);
					} else {
						_text = _text + format ["%1, ", (name _x)];
					};
				} forEach _playerCrew;

				private _countCrewAi = count ((_crewVic - _playerCrew) select {alive _x});
				if (_countCrewAi > 0) then {
					_text = _text + format [" +%1", _countCrewAi];
				};
				_text = format ["%1: %2", _vehicleDisplayName, _text];
			};
		};
	};
};
_text;