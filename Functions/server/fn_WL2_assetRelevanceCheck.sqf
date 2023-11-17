params ["_assets", "_parentSector"];
if ((count _assets) == 0) exitWith {};

private _list = [];
_list append _assets;
private _originalOwner = (_parentSector getVariable "BIS_WL_owner");

while {count _list > 0} do {
	{
		_list deleteAt (_list find _x);
	} forEach (_list select {!(alive _x)});
	_targets = [missionNamespace getVariable "BIS_WL_currentTarget_west", missionNamespace getVariable "BIS_WL_currentTarget_east"] select {!(isNull _x)};
	if (((_parentSector getVariable "BIS_WL_owner") != _originalOwner) || {!(_parentSector in _targets)}) then {
		{
			_list deleteAt (_list find _x);
		} forEach (_list select {_asset = _x; ((allPlayers findIf {_x distance2D _asset < 500}) == -1) && {(if (_x isKindOf 'Man') then {true} else {(count ((crew _x) select {alive _x})) == 0})}});
	};
	{
		deleteVehicle _x;
	} forEach (_assets select {!(_x in _list)});
	sleep 1;
};