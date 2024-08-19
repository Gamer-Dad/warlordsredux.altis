params ["_asset"];

_asset addEventHandler ["Hit", {
	params ["_unit", "_source", "_damage", "_instigator"];

	private _responsiblePlayer = [_source, _instigator] call BIS_fnc_WL2_handleInstigator;
	if (!(isNull _responsiblePlayer) && alive _unit) then {
		_unit setVariable ["BIS_WL_lastHitter", _responsiblePlayer, 2];

		private _crew = crew _unit;
		if (count _crew == 0) exitWith {};
		if (count _crew == 1 && _crew # 0 == _unit) exitWith {};
		{
			_x setVariable ["BIS_WL_lastHitter", _responsiblePlayer, 2];
		} forEach _crew;
	};
}];