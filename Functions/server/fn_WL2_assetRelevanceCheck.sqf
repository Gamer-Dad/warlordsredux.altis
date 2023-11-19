params ["_assets", "_parentSector"];
if ((count _assets) == 0) exitWith {};

private _list = [];
_list append _assets;
private _originalOwner = (_parentSector getVariable "BIS_WL_owner");

while {count (_list select {alive _x}) > 0} do {
	_targets = [missionNamespace getVariable "BIS_WL_currentTarget_west", missionNamespace getVariable "BIS_WL_currentTarget_east"] select {!(isNull _x)};
	if (((_parentSector getVariable "BIS_WL_owner") != _originalOwner) || {!(_parentSector in _targets)}) then {
		{
			if !(isNull _x) then {
				deleteVehicle _x;
			};
		} forEach (_list select {_asset = _x; (alive _x) && {((allPlayers findIf {_x distance2D _asset < 500}) == -1) && {(if (_x isKindOf 'Man') then {true} else {(count ((crew _x) select {alive _x})) == 0})}}});
	};

	{
		_list deleteAt (_list find _x);
	} forEach (_list select {isNull _x || {!(alive _x)}});
	sleep 1;
};