params ["_sender", "_pos", "_class", "_direction"];

if !(isServer) exitWith {};

private _isUav = getNumber (configFile >> "CfgVehicles" >> _class >> "isUav") == 1;
private _asset = if (_isUav) then {
	[_pos, _class, _direction, _sender] call BIS_fnc_WL2_createUAVCrew;
} else {
	[_class, _pos, _direction] call BIS_fnc_WL2_createVehicleCorrectly;
};

waitUntil {sleep 0.1; !(isNull _asset)};

private _turretOverrides = missionNamespace getVariable ["WL2_turretOverrides", createHashMap];
private _turretOverridesForVehicle = _turretOverrides getOrDefault [_class, []];

{
	private _turretOverride = _x;
	private _turret = getArray (_turretOverride >> "turret");
	private _removeMagazines = getArray (_turretOverride >> "removeMagazines");
	private _removeWeapons = getArray (_turretOverride >> "removeWeapons");
	private _addMagazines = getArray (_turretOverride >> "addMagazines");
	private _addWeapons = getArray (_turretOverride >> "addWeapons");

	{
		_asset removeMagazinesTurret [_x, _turret];
	} forEach _removeMagazines;

	{
		_asset removeWeaponTurret [_x, _turret];
	} forEach _removeWeapons;

	{
		_asset addMagazineTurret [_x, _turret];
	} forEach _addMagazines;

	{
		_asset addWeaponTurret [_x, _turret];
	} forEach _addWeapons;
} forEach _turretOverridesForVehicle;

_asset enableWeaponDisassembly false;

private _smallFlareMags = (_asset magazinesTurret [-1]) select {_x == "120Rnd_CMFlare_Chaff_Magazine"};
if (count _smallFlareMags == 1) then {
	_asset removeMagazineTurret ["120Rnd_CMFlare_Chaff_Magazine", [-1]];
	_asset addMagazineTurret ["240Rnd_CMFlare_Chaff_Magazine", [-1]]
};

_owner = owner _sender;
_asset setVariable ["BIS_WL_ownerAsset", (getPlayerUID _sender), [2, _owner]];
_asset setVariable ["BIS_WL_lastActive", 0, _owner];
[_asset] call BIS_fnc_WL2_lastHitHandler;
[_asset, _sender] remoteExec ["BIS_fnc_WL2_newAssetHandle", _owner];
_sender setVariable ["BIS_WL_isOrdering", false, [2, _owner]];