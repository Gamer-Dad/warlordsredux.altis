addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	_ownedVehicles = format ["BIS_WL_ownedVehicles_%1", _uid];
	_minesDB = format ["BIS_WL2_minesDB_%1", _uid];
	{
		if (unitIsUAV _x) then {
			private _grp = group effectiveCommander _x;
			{_x deleteVehicleCrew _x} forEach crew _x;
			deleteGroup _grp;
		};

		deleteVehicle _x;
	} forEach ((missionNamespace getVariable [_ownedVehicles, []]) select {!(isNull _x)});
	missionNamespace setVariable [_ownedVehicles, nil];

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

	{
		_player = _x call BIS_fnc_getUnitByUID;
		[_player, _unit] spawn MRTM_fnc_accept;
	} forEach (missionNamespace getVariable [(format ["MRTM_invitesOut_%1", _uid]), []]);
	
	
	call BIS_fnc_WL2_updateVehicleList;
	call BIS_fnc_WL2_calcImbalance;
}];

addMissionEventHandler ["EntityKilled", {
	params ["_unit", "_killer", "_instigator"];

	private _responsiblePlayer = [_killer, _instigator] call BIS_fnc_WL2_handleInstigator;
	if (isNull _responsiblePlayer) then {
		// only use last hit if no direct killer is found
		_responsiblePlayer = _unit getVariable ["BIS_WL_lastHitter", objNull];
	};
	diag_log format["_responsiblePlayer: %1", _responsiblePlayer];

	if !(isNull _responsiblePlayer) then {
		[_unit, _responsiblePlayer] spawn BIS_fnc_WL2_killRewardHandle;
		[_unit, _responsiblePlayer] spawn BIS_fnc_WL2_friendlyFireHandleServer;
		if (isPlayer _unit) then {
			diag_log format["PvP kill: %1_%2 was killed by %3_%4 from %5m", name _unit, getPlayerUID _unit, name _responsiblePlayer, getPlayerUID _responsiblePlayer, _unit distance _responsiblePlayer];
		};
	};

	_unit spawn {
		params ["_unit"];
		if ((typeOf _unit) == "Land_IRMaskingCover_01_F") then {
			{
				_asset = _x;
				if !(alive _x) then {
					deleteVehicle _asset;
				};
			} forEach ((allMissionObjects "") select {(["BIS_WL_", str _x, false] call BIS_fnc_inString) && {!(["BIS_WL_init", str _x, false] call BIS_fnc_inString)}});
		};
		if ((typeOf _unit) == "Land_Pod_Heli_Transport_04_medevac_F" || {(typeOf _unit) == "B_Slingload_01_Medevac_F"}) then {
			deleteVehicle _unit;
		};
	};
}];

addMissionEventHandler ["MarkerCreated", {
	params ["_marker", "_channelNumber", "_owner", "_local"];
	
	_list = getArray (missionConfigFile >> "adminFilter");
	_return = ((_list findIf {[_x, (markerText _marker)] call BIS_fnc_inString}) != -1);
	if (((isPlayer _owner) && {(_channelNumber == 0)}) || {_return}) then {
		deleteMarker _marker;
	};
}];