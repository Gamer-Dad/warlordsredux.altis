#include "..\warlords_constants.inc"

params ["_side", ["_fullRecalc", FALSE]];

private _base = objNull;
private _pool = BIS_WL_allSectors;
private _owned = _pool select {(_x getVariable ["BIS_WL_owner", sideUnknown]) == _side};
private _available = [];
private _income = 0;
private _services = [];
private _curTarget = missionNamespace getVariable [format ["BIS_WL_currentTarget_%1", _side], objNull];
private _unlocked = _pool select {_x == _curTarget || {_side in (_x getVariable ["BIS_WL_previousOwners", []])}};
private _baseArr = WL_BASES select {(_x getVariable ["BIS_WL_owner", sideUnknown]) == _side};

{
	private _sector = _x;
	_income = _income + (_sector getVariable ["BIS_WL_value", 0]);
	{_services pushBackUnique _x} forEach (_sector getVariable ["BIS_WL_services", []]);
} forEach _owned;

if (count _baseArr == 0) exitWith {[_owned, [], [], _unlocked, _income, _services, [], []]};

private _base = _baseArr # 0;
private _knots = [_base];
private _linked = _knots;

while {count _knots > 0} do {
	private _knotsCurrent = _knots;
	_knots = [];
	{
		{
			_link = _x;
			if (!(_link in _linked) && (_link in _owned)) then {_linked pushBack _link; _knots pushBack _link}
		} forEach (_x getVariable "BIS_WL_connectedSectors");
	} forEach _knotsCurrent;
};

{
	private _sector = _x;
	if ((_sector getVariable ["BIS_WL_owner", sideUnknown]) != _side && _linked findIf {_sector in (_x getVariable "BIS_WL_connectedSectors")} >= 0) then {
		_available pushBack _sector;
	};
} forEach (_pool - _owned);

if (_fullRecalc) then {
	_enemySectors = BIS_WL_allSectors - _unlocked;
	
	{
		private _sector = _x;
		private _zoneRestrictionAxis = ((_sector getVariable "BIS_WL_distanceToNearestSector") / 3) max (_sector getVariable "BIS_WL_maxAxis");
		if (isServer) then {
			_zoneRestrictionTrigger = ((_sector getVariable "BIS_WL_zoneRestrictionTrgs") select {(_x getVariable "BIS_WL_handledSide") == _side}) # 0;
			_zoneRestrictionTrigger setTriggerArea [_zoneRestrictionAxis, _zoneRestrictionAxis, 0, FALSE];
		};
		
		if !(isNil "BIS_WL_playerSide") then {
			if (_side == BIS_WL_playerSide) then {
				_sector setVariable ["BIS_WL_borderWidth", _zoneRestrictionAxis];
				((_sector getVariable "BIS_WL_markers") # 2) setMarkerSizeLocal [_zoneRestrictionAxis, _zoneRestrictionAxis];
				((_sector getVariable "BIS_WL_markers") # 1) setMarkerBrushLocal "Solid";
			};
		};
	} forEach _enemySectors;
};

[_owned, _available, _linked, _unlocked, _income, _services, _owned - _linked, (_unlocked - _owned) - _available]