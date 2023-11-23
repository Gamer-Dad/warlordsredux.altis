addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];

	{
		if (unitIsUAV _x) then {
			private _grp = group effectiveCommander _x;
			{_x deleteVehicleCrew _x} forEach crew _x;
			deleteGroup _grp;
		};

		deleteVehicle _x;
	} forEach (missionNamespace getVariable format ["BIS_WL_%1_ownedVehicles", _uid]);
	{
		if !(isPlayer _x) then {deleteVehicle _x;};
	} forEach ((allUnits) select {(_x getVariable ["BIS_WL_ownerAsset", "132"] == _uid)});
	missionNamespace setVariable [format ["BIS_WL_%1_ownedVehicles", _uid], []];

	{
		_player = _x call BIS_fnc_getUnitByUID;
		[_player, _unit] spawn MRTM_fnc_accept;
	} forEach (missionNamespace getVariable [(format ["MRTM_invitesOut_%1", _uid]), []]);
	
	call BIS_fnc_WL2_calcImbalance;
}];

addMissionEventHandler ["EntityKilled", {
	params ["_unit", "_killer", "_instigator"];
	if (isNull _instigator) then {_instigator = (if !(isNull ((_killer getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID)) then [{((_killer getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID)}, {((UAVControl vehicle _killer) # 0)}])};
	if (isNull _instigator) then {_instigator = (vehicle _killer)};
	if !(isNull _instigator) then {
		_responsibleLeader = if !(isPlayer _instigator) then {((_instigator getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID)} else {_instigator};
		if (isPlayer _responsibleLeader) then {
			[_unit, _responsibleLeader] spawn BIS_fnc_WL2_killRewardHandle;
			[_unit, _responsibleLeader] spawn BIS_fnc_WL2_friendlyFireHandleServer;
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

addMissionEventHandler ["EntityCreated", {
  params ["_entity"];
  if (isClass (configFile >> "CfgAmmo" >> (typeOf _entity))) then {
    if !((typeOf _entity) in ["APERSTripMine_Wire_Mag", "APERSTripMine_Wire_Ammo", "IEDLandSmall_Remote_Mag", "IEDUrbanSmall_Remote_Mag", "IEDLandBig_Remote_Mag", "IEDUrbanBig_Remote_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag", "ClaymoreDirectionalMine_Remote_Ammo", "SLAMDirectionalMine_Wire_Ammo", "SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Ammo", "APERSBoundingMine_Range_Mag", "APERSMineDispenser_Mine_Ammo", "APERSMine_Range_Ammo", "SatchelCharge_Remote_Ammo", "DemoCharge_Remote_Ammo"]) exitWith {};

    _code = compile (format ["_entity spawn BIS_fnc_Handle%1", (typeOf _entity)]);
    call _code;
  };
}];