params ["_assets", "_parentSector"];

if (count _assets == 0) exitWith {};

private _soldierList = _assets select {
	_x isKindOf "Man"
};
private _vehicleList = _assets select {
	!(_x isKindOf "Man")
};

private _assetsRemain = true;

while {_assetsRemain} do {
	private _targetedSectors = [
		missionNamespace getVariable "BIS_WL_currentTarget_west", 
		missionNamespace getVariable "BIS_WL_currentTarget_east"
	] select {!isNull _x};
	private _sectorIsTargeted = _parentSector in _targetedSectors;

	private _currentOwner = _parentSector getVariable ["BIS_WL_owner", sideUnknown];
	if (_currentOwner != independent || !_sectorIsTargeted) then {
		{
			private _soldier = _x;
			if (!isNull _soldier) then {
				deleteVehicle _soldier;
			};
		} forEach _soldierList;

		{
			private _vehicle = _x;
			private _isVehicleAlone = allPlayers findIf {_x distanceSqr _vehicle < 250000} == -1;
			if (!isNull _vehicle && _isVehicleAlone) then {
				deleteVehicle _vehicle;
			};
		} forEach _vehicleList;
	};

	sleep 30;
	
	_soldierList = _soldierList select {alive _x};
	_vehicleList = _vehicleList select {alive _x};
	_assetsRemain = count _soldierList > 0 || count _vehicleList > 0;
};