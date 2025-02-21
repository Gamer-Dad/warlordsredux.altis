params ["_vehicle", "_baseVehicle"];

private _allTurretWeapons = [];

private _overrideMap = createHashMap;
private _turretOverrides = missionNamespace getVariable ["WL2_turretOverrides", createHashMap];
private _turretOverridesForVehicle = _turretOverrides getOrDefault [_vehicle, []];
{
	private _turretOverride = _x;
	private _turret = getArray (_turretOverride >> "turret");
	private _removeMagazines = getArray (_turretOverride >> "removeMagazines");
	private _removeWeapons = getArray (_turretOverride >> "removeWeapons");
	private _addMagazines = getArray (_turretOverride >> "addMagazines");
	private _addWeapons = getArray (_turretOverride >> "addWeapons");

    _overrideMap set [_turret, [_removeMagazines, _removeWeapons, _addMagazines, _addWeapons]];
} forEach _turretOverridesForVehicle;

private _turretPaths = _baseVehicle call BIS_fnc_vehicleCrewTurrets;
{
    private _turretConfig = [_baseVehicle, _x] call BIS_fnc_turretConfig;
    private _turretName = getText (_turretConfig >> "gunnerName");
    if (_turretName == "") then {
        _turretName = "Driver";
    };

    private _turretOverride = _overrideMap getOrDefault [_x, [[], [], [], []]];

    private _turretWeapons = getArray (_turretConfig >> "weapons");
    private _removeWeapons = _turretOverride # 1;
    private _addWeapons = _turretOverride # 3;
    _turretWeapons = _turretWeapons - _removeWeapons + _addWeapons;

    private _turretWeaponsDisplay = (_turretWeapons apply {
        format ["%1", getText (configFile >> "CfgWeapons" >> _x >> "displayName")];
    }) joinString ", ";

    private _turretMagazines = getArray (_turretConfig >> "magazines");
    private _removeMagazines = _turretOverride # 0;
    private _addMagazines = _turretOverride # 2;
    _turretMagazines = _turretMagazines - _removeMagazines + _addMagazines;

    private _turretMagazineMap = createHashMap;
    {
        private _magazine = _x;
        private _magazineName = [_magazine] call WL2_fnc_getMagazineName;
        private _magazineCount = _turretMagazineMap getOrDefault [_magazineName, 0];
        _turretMagazineMap set [_magazineName, _magazineCount + 1];
    } forEach _turretMagazines;

    private _turretMagazineDisplay = ((keys _turretMagazineMap) apply {
        private _magazineName = _x;
        private _magazineCount = _turretMagazineMap getOrDefault [_x, 1];
        if (_magazineCount > 1) then {
            format ["%1 x%2", _magazineName, _magazineCount];
        } else {
            _magazineName;
        };
    }) joinString ", ";


    if (_turretMagazineDisplay != "") then {
        _turretMagazineDisplay = format ["<br/><t color='#dd5522' shadow='0'>%1</t>", _turretMagazineDisplay];
    };

    if (_turretWeaponsDisplay == "" && _turretMagazineDisplay == "") then {
        continue;
    };

    private _scale = 1.05 call WL2_fnc_purchaseMenuGetUIScale;
    private _turretDisplay = format ["<t color='#efbf04' shadow='0' size='%1'>%2</t> <t color='#2255dd' shadow='0' size='%1'>(%3)</t>%4", _scale, _turretName, _turretWeaponsDisplay, _turretMagazineDisplay];

    _allTurretWeapons pushBack _turretDisplay;
} forEach _turretPaths;

private _assetConfig = configFile >> "CfgVehicles" >> _baseVehicle;
private _pylonConfig = _assetConfig >> "Components" >> "TransportPylonsComponent";
private _pylonsInfo = configProperties [_pylonConfig >> "pylons"];

if (count _pylonsInfo != 0) then {
    private _pylonNames = _pylonsInfo apply {
        private _pylonAttachment = getText (_x >> "attachment");
        if (_pylonAttachment == "") then {
            "";
        } else {
            [_pylonAttachment] call WL2_fnc_getMagazineName;
        };
    };
    private _pylonNamesFiltered = _pylonNames select {
        _x != "";
    };
    private _pylonNameDisplay = _pylonNamesFiltered joinString ", ";
    private _scale = 1.05 call WL2_fnc_purchaseMenuGetUIScale;
    private _pylonDisplay = format ["<t color='#efbf04' shadow='0' size='%1'>Pylon</t><br/><t color='#2255dd' shadow='0'>%2</t>", _scale, _pylonNameDisplay];
    _allTurretWeapons pushBack _pylonDisplay;
};

if (count _allTurretWeapons == 0) then {
    "<t color='#dd5522' shadow='0' size='1.05'>None</t>";
} else {
    _allTurretWeapons joinString "<br/>";
};
