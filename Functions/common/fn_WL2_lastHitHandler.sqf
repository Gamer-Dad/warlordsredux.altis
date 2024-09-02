params ["_asset"];

_asset addEventHandler ["Hit", {
	params ["_unit", "_source", "_damage", "_instigator"];

	private _responsiblePlayer = [_source, _instigator] call BIS_fnc_WL2_handleInstigator;
	private _ownerSide = _unit getVariable ["BIS_WL_ownerAssetSide", side group _unit];
	private _responsibleSide = side group _responsiblePlayer;

	if (_ownerSide == _responsibleSide) exitWith {};
	if (!alive _unit) exitWith {};

	private _writeLastHitter = {
		params ["_unit", "_hitter"];
		_unit setVariable ["BIS_WL_lastHitter", _hitter, 2];

		private _crew = crew _unit;
		if (count _crew == 0) exitWith {};
		if (count _crew == 1 && _crew # 0 == _unit) exitWith {};
		{
			_x setVariable ["BIS_WL_lastHitter", _hitter, 2];
		} forEach _crew;
	};
	if !(isNull _responsiblePlayer) then {
		[_unit, _responsiblePlayer] call _writeLastHitter;
	} else {
		private _lastHitter = _unit getVariable ["BIS_WL_lastHitter", objNull];
		if (isNull _lastHitter) then {	// allow write, but not overwrite
			[_unit, _instigator] call _writeLastHitter;
		};
	};
}];