params ["_asset"];

_asset addEventHandler ["Hit", {
	params ["_unit", "_source", "_damage", "_instigator"];

	private _responsiblePlayer = [_source, _instigator] call WL2_fnc_handleInstigator;
	private _ownerSide = [_unit] call WL2_fnc_getAssetSide;
	private _responsibleSide = side group _responsiblePlayer;

	if (_ownerSide == _responsibleSide) exitWith {};
	if (!alive _unit || !isDamageAllowed _unit) exitWith {};
	if (isNull _responsiblePlayer) exitWith {};

	_unit setVariable ["WL_lastHitter", _responsiblePlayer, 2];

	private _children = _unit getVariable ["WL2_children", []];
	{
		_x setVariable ["WL_lastHitter", _responsiblePlayer, 2];
	} forEach _children;

	private _crew = crew _unit;
	if (count _crew == 0) exitWith {};
	if (count _crew == 1 && _crew # 0 == _unit) exitWith {};
	{
		_x setVariable ["WL_lastHitter", _responsiblePlayer, 2];
	} forEach _crew;
}];

_asset addEventHandler ["HandleDamage", {
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit", "_context"];
	if (_projectile == "FuelExplosion") then {
		private _apsType = missionNamespace getVariable ["WL2_aps", createHashMap];
		private _unitActualType = _unit getVariable ["WL2_orderedClass", typeOf _unit];
		private _unitApsType = _apsType getOrDefault [_unitActualType, -1];
		private _sourceActualType = _source getVariable ["WL2_orderedClass", typeOf _source];
		private _sourceApsType = _apsType getOrDefault [_sourceActualType, -1];
		if (_unitApsType > _sourceApsType) then {
			0;
		} else {
			_damage;
		};
	} else {
		_damage;
	};
}];