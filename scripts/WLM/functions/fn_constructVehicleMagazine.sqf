#include "..\WLM_constants.inc"

private _asset = uiNamespace getVariable "WLM_asset";

private _allTurrets = [[-1]] + allTurrets _asset;
private _display = findDisplay WLM_DISPLAY;
private _ctrlGroup = _display displayCtrl WLM_PYLON_CONTROL_GROUP;

private _xPos = 0.04;
private _yPos = 0.04 * safeZoneH + 0.12;
private _index = 0;

// Clear existing magazine select boxes
private _magazineSelectBoxes = uiNamespace getVariable ["WLM_magazineSelectBoxes", []];
{
    ctrlDelete (_x # 0);
} forEach _magazineSelectBoxes;
_magazineSelectBoxes = [];

{
    ctrlDelete _x;
} forEach (allControls _ctrlGroup);

// Save magazines
private _savedMagazines = _asset getVariable ["WLM_savedMagazines", []];
if (_savedMagazines isEqualTo []) then {
    {
        private _turretPath = _x;
        private _magazinesInTurret = _asset magazinesTurret [_turretPath, true];
        _savedMagazines pushBack _magazinesInTurret;
    } forEach _allTurrets;
};
_asset setVariable ["WLM_savedMagazines", _savedMagazines];

private _assetDefaultMagazines = _asset getVariable ["BIS_WL_defaultMagazines", []];

private _menuTextOverrides = call WLM_fnc_menuTextOverrides;
private _disallowListForVehicle = missionNamespace getVariable ["WL2_disallowMagazinesForVehicle", createHashMap];

private _getMagazineName = {
    params ["_magazine"];
    if (_magazine == "EMPTY") exitWith {
        "EMPTY";
    };

    private _magazineName = getText (configFile >> "CfgMagazines" >> _magazine >> "displayName");
    if (_magazineName == "") then {
        _magazineName = _magazine;
    };

    private _overrideMagazineName = (_menuTextOverrides # 0) getOrDefault [_magazine, "No Override"];
    if (_overrideMagazineName != "No Override") then {
        _magazineName = _overrideMagazineName;
    };

    private _magSize = getNumber (configFile >> "CfgMagazines" >> _magazine >> "count");
    _magazineName = format ["%1 (%2)", _magazineName, _magSize];

    _magazineName;
};

private _getMagazineTooltip = {
    params ["_magazine"];

    private _magazineTooltipCache = uiNamespace getVariable ["WLM_magazineTooltipCache", createHashMap];
    private _cacheResponse = _magazineTooltipCache getOrDefault [_magazine, ""];
    if (_cacheResponse != "") exitWith {
        _cacheResponse;
    };

    private _magazineName = [_magazine] call _getMagazineName;
    private _magazineConfig = configFile >> "CfgMagazines" >> _magazine;
    private _magazineDescription = "";

    private _magAmmoType = getText (_magazineConfig >> "ammo");
    private _ammoConfig = configFile >> "CfgAmmo" >> _magAmmoType;

    _magazineDescription = _magazineDescription + "\n---";

    private _magDesc = [];

    private _magDescCount = getNumber (_magazineConfig >> "count");
    _magDesc pushBack ["Magazine Size", format ["%1", _magDescCount]];

    _magDesc pushBack ["Ammo", _magAmmoType];

    private _magDescWarheadName = getText (_ammoConfig >> "warheadName");
    if (_magDescWarheadName != "") then {
        _magDesc pushBack ["Warhead Type", _magDescWarheadName];
    };

    private _magDescCartridge = getText (_ammoConfig >> "cartridge");
    if (_magDescCartridge != "") then {
        _magDesc pushBack ["Cartridge", _magDescCartridge];
    };

    _magDesc pushBack ["break"];

    private _magDescWeaponLockSystem = getNumber (_ammoConfig >> "weaponLockSystem");
    private _isMissile = [_magDescWeaponLockSystem, 16] call BIS_fnc_bitflagsCheck;
    private _isRadarGuided = [_magDescWeaponLockSystem, 8] call BIS_fnc_bitflagsCheck;
    private _isLaserGuided = [_magDescWeaponLockSystem, 4] call BIS_fnc_bitflagsCheck;
    private _isIRGuided = [_magDescWeaponLockSystem, 2] call BIS_fnc_bitflagsCheck;
    private _isVisualGuided = [_magDescWeaponLockSystem, 1] call BIS_fnc_bitflagsCheck;
    private _magDescManualControl = getNumber (_ammoConfig >> "manualControl");

    if (_isMissile) then {
        _magDesc pushBack ["Missile", "Yes"];
    };

    private _magDescGuidance = [];
    if (_isRadarGuided) then {
        _magDescGuidance pushBack "Radar";
    };
    if (_isLaserGuided) then {
        _magDescGuidance pushBack "Laser";
    };
    if (_isIRGuided) then {
        _magDescGuidance pushBack "IR";
    };
    if (_isVisualGuided) then {
        _magDescGuidance pushBack "Visual";
    };
    private _magDescMaxControlRange = 0;
    if (_magDescManualControl != 0) then {
        _magDescGuidance pushBack "Manual Guidance";
        _magDescMaxControlRange = getNumber (_ammoConfig >> "maxControlRange");
    };
    if (count _magDescGuidance > 0) then {
        _magDesc pushBack ["Spectrum", _magDescGuidance joinString ", "];
    };

    if (_magDescMaxControlRange != 0) then {
        _magDesc pushBack ["Max Control Range", format ["%1 m", _magDescMaxControlRange]];
    };

    private _magDescCmImmunity = getNumber (_ammoConfig >> "cmImmunity");
    if (_magDescCmImmunity != 0 && _magDescCmImmunity != 1) then {
        _magDesc pushBack ["Countermeasure Immunity", format ["%1%2", round (_magDescCmImmunity * 100), "%"]];
    };

    _magDesc pushBack ["break"];

    private _magDescInitSpeed = getNumber (_magazineConfig >> "initSpeed");
    if (_magDescInitSpeed != 0) then {
        _magDesc pushBack ["Muzzle Velocity", format ["%1 m/s", _magDescInitSpeed]];
    };

    private _magDescMaxSpeed = getNumber (_ammoConfig >> "maxSpeed");
    if (_magDescMaxSpeed != 0) then {
        _magDesc pushBack ["Max Speed", format ["%1 m/s", _magDescMaxSpeed]];
    };

    _magDesc pushBack ["break"];

    private _magDescHit = getNumber (_ammoConfig >> "hit");
    if (_magDescHit != 0) then {
        _magDesc pushBack ["Damage (Direct)", format ["%1", _magDescHit]];
    };

    private _magDescIndirectHit = getNumber (_ammoConfig >> "indirectHit");
    if (_magDescIndirectHit != 0) then {
        _magDesc pushBack ["Damage (Splash)", format ["%1", _magDescIndirectHit]];
    };

    private _magDescIndirectHitRange = getNumber (_ammoConfig >> "indirectHitRange");
    if (_magDescIndirectHitRange != 0) then {
        _magDesc pushBack ["Splash Radius", format ["%1-%2 m", _magDescIndirectHitRange, _magDescIndirectHitRange * 4]];
    };

    private _magDescCaliber = getNumber (_ammoConfig >> "caliber");
    private _penetrationRHA = _magDescInitSpeed * _magDescCaliber * 15 / 1000;
    if (_penetrationRHA != 0) then {
        _magDesc pushBack ["Penetration (RHA)", format ["%1 mm", _penetrationRHA]];
    };

    _magDesc pushBack ["break"];

    private _magSubmunitionAmmo = getText (_ammoConfig >> "submunitionAmmo");
    if (_magSubmunitionAmmo != "") then {
        private _submunitionConfig = configFile >> "CfgAmmo" >> _magSubmunitionAmmo;

        private _submunitionHit = getNumber (_submunitionConfig >> "hit");
        if (_submunitionHit != 0) then {
            _magDesc pushBack ["Submunition Damage (Direct)", format ["%1", _submunitionHit]];
        };

        private _submunitionIndirectHit = getNumber (_submunitionConfig >> "indirectHit");
        if (_submunitionIndirectHit != 0) then {
            _magDesc pushBack ["Submunition Damage (Splash)", format ["%1", _submunitionIndirectHit]];
        };

        private _submunitionIndirectHitRange = getNumber (_submunitionConfig >> "indirectHitRange");
        if (_submunitionIndirectHitRange != 0) then {
            _magDesc pushBack ["Submunition Splash Radius", format ["%1-%2 m", _submunitionIndirectHitRange, _submunitionIndirectHitRange * 4]];
        };

        private _submunitionCaliber = getNumber (_submunitionConfig >> "caliber");
        private _submunitionInitSpeed = getNumber (_ammoConfig >> "submunitionInitSpeed");
        private _submunitionPenetrationRHA = _submunitionInitSpeed * _submunitionCaliber * 15 / 1000;
        if (_submunitionPenetrationRHA != 0) then {
            _magDesc pushBack ["Submunition Penetration (RHA)", format ["%1 mm", _submunitionPenetrationRHA]];
        };

        _magDesc pushBack ["break"];
    };

    private _magDescTracersEvery = getNumber (_magazineConfig >> "tracersEvery");
    if (_magDescTracersEvery != 0) then {
        _magDesc pushBack ["Tracers Every", format ["%1", _magDescTracersEvery]];
    };

    private _magDescFuseDistance = getNumber (_ammoConfig >> "fuseDistance");
    if (_magDescFuseDistance != 0) then {
        _magDesc pushBack ["Fuse Distance", format ["%1 m", _magDescFuseDistance]];
    };

    private _magDescFinal = [];
    {
        if (_x # 0 == "break") then {
            if (count _magDesc != (_forEachIndex + 1)) then {
                private _nextItem = _magDesc # (_forEachIndex + 1);
                if (_nextItem # 0 != "break") then {
                    _magDescFinal pushBack _x;
                };
            };
        } else {
            _magDescFinal pushBack _x;
        }
    } forEach _magDesc;

    {
        if (_x # 0 == "break") then {
            _magazineDescription = _magazineDescription + "\n---";
        } else {
            _magazineDescription = _magazineDescription + format ["\n%1: %2", _x # 0, _x # 1];
        };
    } forEach _magDescFinal;

    private _return = format ["%1 | %2%3", _magazineName, _magazine, _magazineDescription];
    _magazineTooltipCache set [_magazine, _return];
    uiNamespace setVariable ["WLM_magazineTooltipCache", _magazineTooltipCache];
    _return;
};

{
    private _turretPath = _x;

    private _magazinesInTurret = _savedMagazines select _forEachIndex;
    private _weaponsInTurret = _asset weaponsTurret _turretPath;

    private _magazinesByWeapon = [];
    private _allowedMagazinesByWeapon = [];
    {
        private _magazinesForWeapon = [];
        private _incompatibleMagazines = _disallowListForVehicle getOrDefault [typeOf _asset, []];
        private _compatibleMagazines = compatibleMagazines _x - _incompatibleMagazines;

        {
            if (_compatibleMagazines find _x != -1) then {
                _magazinesForWeapon pushBack _x;
            };
        } forEach _magazinesInTurret;

        _allowedMagazinesByWeapon pushBack _compatibleMagazines;
        _magazinesByWeapon pushBack [_magazinesForWeapon, _x];
    } forEach _weaponsInTurret;

    // Calculate points per weapon in turret from default
    private _pointsInTurret = 0;
    private _defaultMagazinesByWeapon = [];
    private _defaultMagazinesInTurret = _assetDefaultMagazines select {_x # 1 isEqualTo _turretPath};
    {
        private _compatibleMagazines = compatibleMagazines _x;
        private _defaultMagazinesForWeapon = [];
        {
            if (_compatibleMagazines find (_x # 0) != -1) then {
                _pointsInTurret = _pointsInTurret + (_x # 2);
                _defaultMagazinesForWeapon pushBack _x;
            };
        } forEach _defaultMagazinesInTurret;

        _defaultMagazinesByWeapon pushBack [_defaultMagazinesForWeapon, _x];
    } forEach _weaponsInTurret;

    if (count _weaponsInTurret == 0 || _pointsInTurret == 0) then {
        continue;
    };

    // Label
    private _turretLabel = _display ctrlCreate ["RscText", -1, _ctrlGroup];
    private _turretConfig = [_asset, _turretPath] call BIS_fnc_turretConfig;
    private _turretName = getText (_turretConfig >> "gunnerName");

    if (_turretName == "") then {
        _turretName = "Driver";
    };

    _turretLabel ctrlSetText format ["%1", _turretName];
    _turretLabel ctrlSetFontHeight 0.06;
    _turretLabel ctrlSetFont "PuristaMedium";
    _turretLabel ctrlSetPosition [0.02, _yPos  - 0.1, 0.7, 0.035];
    _turretLabel ctrlCommit 0;

    {
        private _magazinesInWeapon = _x # 0;
        private _weaponClass = _x # 1;
        private _weaponNumber = _forEachIndex;

        // Label
        private _weaponLabel = _display ctrlCreate ["RscText", -1, _ctrlGroup];
        private _weaponName = getText (configFile >> "CfgWeapons" >> _weaponClass >> "displayName");
        _weaponLabel ctrlSetFont "PuristaMedium";
        _weaponLabel ctrlSetPosition [0.04, _yPos  - 0.04, 0.7, 0.035];
        _weaponLabel ctrlCommit 0;

        private _defaultAmmoCount = 0;
        {
            {
                _defaultAmmoCount = _defaultAmmoCount + _x # 2;
            } forEach _x # 0;
        } forEach (_defaultMagazinesByWeapon select {_x # 1 isEqualTo _weaponClass});

        if (_defaultAmmoCount == 0) then {
            continue;
        };

        if (_magazinesInWeapon find "EMPTY" == -1) then {
            _magazinesInWeapon pushBack "EMPTY";
        };

        _xPos = 0.05;

        private _stopGenerating = false;
        private _allowedMagazineForWeapon = _allowedMagazinesByWeapon select _forEachIndex;
        private _ammoRemaining = _defaultAmmoCount;
        {
            if (_ammoRemaining <= 0 || _stopGenerating) then {
                _stopGenerating = true;
                continue;
            };

            private _magazineClass = _x;
            private _magazineName = [_magazineClass] call _getMagazineName;
            private _selectBox = _display ctrlCreate ["WLM_PylonSelect", WLM_PYLON_START + _index, _ctrlGroup];

            private _firstSelectBoxItem = _selectBox lbAdd "EMPTY";
            _selectBox lbSetTooltip [_firstSelectBoxItem, "EMPTY"];
            _selectBox lbSetData [_firstSelectBoxItem, "EMPTY"];

            if (_magazineClass == "EMPTY") then {
                _selectBox lbSetCurSel _firstSelectBoxItem;
            };

            {
                private _magSize = getNumber (configFile >> "CfgMagazines" >> _x >> "count");
                if (_magSize <= _ammoRemaining) then {
                    private _allowedMagazine = [_x] call _getMagazineName;
                    private _selectBoxItem = _selectBox lbAdd _allowedMagazine;
                    _selectBox lbSetTooltip [_selectBoxItem, [_x] call _getMagazineTooltip];
                    _selectBox lbSetData [_selectBoxItem, _x];

                    if (_x == _magazineClass) then {
                        _selectBox lbSetCurSel _selectBoxItem;
                        _selectBox lbSetColor [_selectBoxItem, [0, 1, 1, 1]];
                    };
                };
            } forEach _allowedMagazineForWeapon;

            // Not enough ammo for selected magazine
            if (lbCurSel _selectBox == -1) then {
                _selectBox lbSetCurSel _firstSelectBoxItem;
                _stopGenerating = true;
            };

            private _actualSelection = lbCurSel _selectBox;

            private _actualSelectionData = _selectBox lbData _actualSelection;
            private _actualMagSize = getNumber (configFile >> "CfgMagazines" >> _actualSelectionData >> "count");
            if (_actualMagSize > _ammoRemaining) then {
                _selectBox lbSetCurSel 0;
                _actualSelection = 0;
                _actualMagSize = 0;
            };
            _ammoRemaining = _ammoRemaining - _actualMagSize;

            private _actualSelectedName = _selectBox lbText _actualSelection;
            private _textWidth = (_actualSelectedName getTextWidth ["PuristaMedium", 0.035]) + 0.045;
            _textWidth = _textWidth min 0.3;

            if (_xPos + _textWidth > 0.8) then {
                _xPos = 0.05;
                _yPos = _yPos + 0.05;
            };
            _selectBox ctrlSetPosition [_xPos, _yPos, _textWidth, 0.035];

            _xPos = _xPos + _textWidth + 0.02;

            _selectBox ctrlAddEventHandler ["LBSelChanged", {
                params ["_control", "_lbCurSel", "_lbSelection"];
                private _asset = uiNamespace getVariable "WLM_asset";
                private _savedMagazines = [];
                private _magazineSelectBoxes = uiNamespace getVariable "WLM_magazineSelectBoxes";

                private _allTurrets = [[-1]] + allTurrets _asset;
                {
                    private _referenceTurretPath = _x;
                    private _turretIndex = _forEachIndex;

                    {
                        private _selectBox = _x # 0;
                        private _turretPath = _x # 1;

                        if (_referenceTurretPath isEqualTo _turretPath) then {
                            private _dataInSave = if (_turretIndex < count _savedMagazines) then {
                                _savedMagazines select _turretIndex
                            } else {
                                []
                            };

                            private _selection = if (_selectBox == _control) then {
                                _control lbData _lbCurSel;
                            } else {
                                _selectBox lbData (lbCurSel _selectBox);
                            };

                            if (_selection != "EMPTY") then {
                                _dataInSave pushBack _selection;
                            };

                            _savedMagazines set [_turretIndex, _dataInSave];
                        };
                    } forEach _magazineSelectBoxes;
                } forEach _allTurrets;

                {
                    private _emptyChecker = _savedMagazines # _forEachIndex;
                    if (isNil "_emptyChecker") then {
                        _savedMagazines set [_forEachIndex, []];
                    };
                } forEach _allTurrets;

                _asset setVariable ["WLM_savedMagazines", _savedMagazines];

                0 spawn WLM_fnc_constructVehicleMagazine;
            }];

            _selectBox ctrlCommit 0;
            _magazineSelectBoxes pushBack [_selectBox, _turretPath];

            _index = _index + 1;
        } forEach _magazinesInWeapon;

        _weaponLabel ctrlSetText format ["%1 (%2/%3)", _weaponName, _defaultAmmoCount - _ammoRemaining, _defaultAmmoCount];
        if (_ammoRemaining > 0) then {
            _weaponLabel ctrlSetTextColor [0, 1, 0, 1];
        } else {
            _weaponLabel ctrlSetTextColor [1, 1, 1, 1];
        };

        _yPos = _yPos + 0.1;
    } forEach _magazinesByWeapon;

    _yPos = _yPos + 0.08;
} forEach _allTurrets;

private _emptyCtrl = _display ctrlCreate ["RscText", -1, _ctrlGroup];
_emptyCtrl ctrlSetText "";
_emptyCtrl ctrlSetPosition [0, _yPos, 0.01, 0.01];
_emptyCtrl ctrlCommit 0;

uiNamespace setVariable ["WLM_magazineSelectBoxes", _magazineSelectBoxes];