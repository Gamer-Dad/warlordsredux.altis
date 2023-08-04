params ["_asset"];

private _parentSector = _asset getVariable ["BIS_WL_parentSector", objNull];
private _originalOwner = (_parentSector getVariable "BIS_WL_owner");

if (isNull _parentSector) exitWith {};


_targets = [missionNamespace getVariable "BIS_WL_currentTarget_west", missionNamespace getVariable "BIS_WL_currentTarget_east"];
waitUntil {sleep 1; ((((_parentSector getVariable "BIS_WL_owner") != _originalOwner) || {!(_parentSector in _targets)}) && {((BIS_WL_allWarlords findIf {_x distance2D _asset < 500}) == -1) && {(if (_asset isKindOf 'Man') then {true} else {((count ((crew _asset) select {alive _x})) == 0)})}})};

deleteVehicle _asset;