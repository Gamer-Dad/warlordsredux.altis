params ["_asset", "_sender", "_orderedClass"];

private _side = side group _sender;
private _isAircraft = _asset isKindOf "Air";
private _variant = missionNamespace getVariable ["WL2_variant", createHashMap] getOrDefault [_orderedClass, 0];
if (!_isAircraft && _variant != 0) then {
	private _sideFlag = switch (_side) do {
		case west: {
			"\A3\Ui_f\data\Map\Markers\Flags\nato_ca.paa"
		};
		case east: {
			"\A3\Ui_f\data\Map\Markers\Flags\CSAT_ca.paa"
		};
		case independent: {
			"\A3\Ui_f\data\Map\Markers\Flags\AAF_ca.paa"
		};
	};

	private _flagMap = missionNamespace getVariable ["WL2_flagOffsets", createHashMap];
	private _flagOffset = _flagMap getOrDefault [_orderedClass, []];
	if (count _flagOffset > 0) then {
		private _flag = createVehicle ["FlagChecked_F", _asset, [], 0, "CAN_COLLIDE"];
		_flag setFlagTexture _sideFlag;
		_flag attachTo [_asset, _flagOffset, "otocvez", true];

		private _assetChildren = _asset getVariable ["WL2_children", []];
		_assetChildren pushBack _flag;
		_asset setVariable ["WL2_children", _assetChildren, [2, _sender]];
	} else {
		_asset forceFlagTexture _sideFlag;
	};
};

private _turretOverrides = missionNamespace getVariable ["WL2_turretOverrides", createHashMap];
private _turretOverridesForVehicle = _turretOverrides getOrDefault [_orderedClass, []];

{
	private _turretOverride = _x;
	private _turret = getArray (_turretOverride >> "turret");
	private _removeMagazines = getArray (_turretOverride >> "removeMagazines");
	private _removeWeapons = getArray (_turretOverride >> "removeWeapons");
	private _addMagazines = getArray (_turretOverride >> "addMagazines");
	private _addWeapons = getArray (_turretOverride >> "addWeapons");
	private _reloadOverride = getNumber (_turretOverride >> "reloadOverride");
	private _hideTurret = getNumber (_turretOverride >> "hideTurret");

	{
		_asset removeMagazinesTurret [_x, _turret];
	} forEach _removeMagazines;

	{
		_asset removeWeaponTurret [_x, _turret];
	} forEach _removeWeapons;

	private _existingMagazines = _asset magazinesTurret _turret;
	private _existingWeapons = _asset weaponsTurret _turret;

	// exclude pylons
	private _pylonInfo = getAllPylonsInfo _asset;
	_existingMagazines = _existingMagazines - (_pylonInfo apply {_x # 3});
	_existingWeapons = _existingWeapons select {
		private _intersection = (compatibleMagazines _x) arrayIntersect _existingMagazines;
		count _intersection != 0;
	};

	{
		_asset removeMagazineTurret [_x, _turret];
	} forEach _existingMagazines;

	{
		_asset removeWeaponTurret [_x, _turret];
	} forEach _existingWeapons;

	{
		_asset addMagazineTurret [_x, _turret];
	} forEach _addMagazines;

	{
		_asset addWeaponTurret [_x, _turret];
	} forEach _addWeapons;

	{
		_asset addMagazineTurret [_x, _turret];
	} forEach _existingMagazines;

	{
		_asset addWeaponTurret [_x, _turret];
	} forEach _existingWeapons;

	if (_reloadOverride != 0) then {
		_asset setVariable ["WL2_reloadOverride", [_reloadOverride, _turret]];
		_asset addEventHandler ["Fired", {
			params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
			private _reloadOverride = _unit getVariable ["WL2_reloadOverride", []];
			private _reloadTime = _reloadOverride # 0;
			private _turret = _reloadOverride # 1;

			private _weaponState = weaponState [_unit, _turret];
			if (_weaponState # 6 > 0) then {
				[_unit, _weapon, _turret, _reloadTime] remoteExec ["WL2_fnc_reloadOverride", _gunner];
			};
		}];
	};

	if (_hideTurret != 0) then {
		_asset animateSource ["HideTurret", 1, true];
	};
} forEach _turretOverridesForVehicle;

private _disallowListForPylon = missionNamespace getVariable ["WL2_disallowMagazinesForVehicle", createHashMap];
private _disallowListForAsset = _disallowListForPylon getOrDefault [_orderedClass, []];
{
	private _disallowedMagazine = _x;
	{
		private _pylonIndex = _x # 0;
		private _pylonMagazine = _x # 3;
		if (_pylonMagazine == _disallowedMagazine) then {
			_asset setPylonLoadout [_pylonIndex, ""];
			private _assetWeapons = weapons _asset;
			_assetWeapons = _assetWeapons select {
				_disallowedMagazine in (compatibleMagazines _x);
			};
			{
				_asset removeWeaponGlobal _x;
			} forEach _assetWeapons;
		};
	} forEach (getAllPylonsInfo _asset);
} forEach _disallowListForAsset;

private _defaultMags = magazinesAllTurrets _asset;
_asset setVariable ["BIS_WL_defaultMagazines", _defaultMags, true];
_asset setVariable ["WLM_savedDefaultMags", _defaultMags, true];

_asset lock false;

private _owner = owner _sender;
_asset setVariable ["BIS_WL_ownerAsset", getPlayerUID _sender, true];
_asset setVariable ["BIS_WL_lastActive", 0, _owner];
[_asset] call WL2_fnc_lastHitHandler;
_asset setVariable ["WL2_orderedClass", _orderedClass, true];
[_asset, _sender] remoteExec ["WL2_fnc_newAssetHandle", _owner];
_sender setVariable ["BIS_WL_isOrdering", false, [2, _owner]];