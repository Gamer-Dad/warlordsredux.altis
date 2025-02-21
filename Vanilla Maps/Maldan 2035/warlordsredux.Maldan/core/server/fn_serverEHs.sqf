addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	private _ownedVehicles = format ["BIS_WL_ownedVehicles_%1", _uid];
	{
		if (unitIsUAV _x) then {
			private _grp = group effectiveCommander _x;
			{_x deleteVehicleCrew _x} forEach crew _x;
			deleteGroup _grp;
		};

		deleteVehicle _x;
	} forEach ((missionNamespace getVariable [_ownedVehicles, []]) select {!(isNull _x)});
	missionNamespace setVariable [_ownedVehicles, nil];

	private _minesDB = format ["BIS_WL2_minesDB_%1", _uid];
	{
		_mineData = (missionNamespace getVariable _minesDB) getOrDefault [_x, [0, []]];
		_mines = (_mineData select 1);
		{
			if (!(isNull _x)) then {deleteVehicle _x};
		} forEach _mines;
	} forEach (missionNamespace getVariable _minesDB);
	missionNamespace setVariable [_minesDB, nil];

	{
		if !(isPlayer _x) then {deleteVehicle _x;};
	} forEach ((allUnits) select {(_x getVariable ["BIS_WL_ownerAsset", "132"] == _uid)});

	private _tent = _unit getVariable ["WL2_respawnBag", objNull];
	if (!isNull _tent) then {
		deleteVehicle _tent;
	};

	call WL2_fnc_updateVehicleList;
	call WL2_fnc_calcImbalance;
}];

addMissionEventHandler ["EntityDeleted", {
	params ["_entity"];
	// do not ever make this a spawn, async calls will break type info
	[_entity, objNull, objNull] call WL2_fnc_handleEntityRemoval;
}];

addMissionEventHandler ["EntityKilled", {
	params ["_unit", "_killer", "_instigator"];
	[_unit, _killer, _instigator] call WL2_fnc_handleEntityRemoval;
}];

addMissionEventHandler ["MarkerCreated", {
	params ["_marker", "_channelNumber", "_owner", "_local"];

	_list = getArray (missionConfigFile >> "adminFilter");
	_return = ((_list findIf {[_x, (markerText _marker)] call BIS_fnc_inString}) != -1);
	if (((isPlayer _owner) && {(_channelNumber == 0)}) || {_return}) then {
		deleteMarker _marker;
	};
}];

addMissionEventHandler ["EntityCreated", {
    params ["_entity"];
    if !(_entity isKindOf "LaserTarget") exitWith {};
    scopeName "MainEntityCreated";
	{
		private _laserTarget = laserTarget _x;
		if (_laserTarget isEqualTo _entity) then {
			private _ownerPlayer = (_x getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID;
			_laserTarget setVariable ["WL_laserPlayer", _ownerPlayer, true];
			breakTo "MainEntityCreated";
		};
	} forEach (call BIS_fnc_listPlayers);
	{
		private _vehicle = _x;
		{
			private _laserTarget = _vehicle laserTarget _x;
			if (_laserTarget isEqualTo _entity) then {
				private _ownerPlayer = (_vehicle getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID;
				_laserTarget setVariable ["WL_laserPlayer", _ownerPlayer, true];
				breakTo "MainEntityCreated";
			};
		} forEach (allTurrets _vehicle);
	} forEach vehicles;
}];
