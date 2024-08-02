#include "..\WLM_constants.inc"

private _asset = uiNamespace getVariable "WLM_asset";

private _allTurrets = allTurrets _asset;
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
        private _magazinesInTurret = _asset magazinesTurret _turretPath;
        _savedMagazines pushBack _magazinesInTurret;
    } forEach _allTurrets;
};
_asset setVariable ["WLM_savedMagazines", _savedMagazines];

private _assetDefaultMagazines = _asset getVariable ["BIS_WL_defaultMagazines", []];

private _getMagazineName = {
    params ["_magazine"];
    if (_magazine == "EMPTY") exitWith {
        "EMPTY";
    };

    private _magazineName = getText (configFile >> "CfgMagazines" >> _magazine >> "displayName");
    if (_magazineName == "") then {
        _magazineName = _magazine;
    };

    private _magSize = getNumber (configFile >> "CfgMagazines" >> _magazine >> "count");
    _magazineName = format ["%1 (%2)", _magazineName, _magSize];
    
    _magazineName;
};

private _getMagazineTooltip = {
    params ["_magazine"];

    private _magazineName = [_magazine] call _getMagazineName;
    private _magazineDescription = getText (configFile >> "CfgMagazines" >> _magazine >> "descriptionShort");

    if (_magazineDescription == "") then {
        _magazineDescription = "";
    } else {
        _magazineDescription = _magazineDescription regexReplace ["<br */?>", "\n"];
        _magazineDescription = format ["\n---\n%1", _magazineDescription];
    };

    format ["%1 | %2%3", _magazineName, _magazine, _magazineDescription];
};

private _loadoutList = call WLM_fnc_loadoutList;
{
    private _turretPath = _x;

    private _magazinesInTurret = _savedMagazines select _forEachIndex;
    private _weaponsInTurret = _asset weaponsTurret _turretPath;

    private _magazinesByWeapon = [];
    private _allowedMagazinesByWeapon = [];
    {
        private _magazinesForWeapon = [];
        private _incompatibleMagazines = ((_loadoutList # 1) select { _asset isKindOf (_x # 0) }) apply { _x # 1 };
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
    private _defaultMagazinesByWeapon = [];
    private _defaultMagazinesInTurret = _assetDefaultMagazines select {_x # 1 isEqualTo _turretPath};
    {
        private _compatibleMagazines = compatibleMagazines _x;
        private _defaultMagazinesForWeapon = [];
        {
            if (_compatibleMagazines find (_x # 0) != -1) then {
                _defaultMagazinesForWeapon pushBack _x;
            };
        } forEach _defaultMagazinesInTurret;

        _defaultMagazinesByWeapon pushBack [_defaultMagazinesForWeapon, _x];
    } forEach _weaponsInTurret;

    // Label
    private _turretLabel = _display ctrlCreate ["RscText", -1, _ctrlGroup];
    private _turretConfig = [_asset, _turretPath] call BIS_fnc_turretConfig;
    private _turretName = getText (_turretConfig >> "gunnerName");
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

        private _loadoutListAmmo = _loadoutList # 0;
        {
            if (_asset isKindOf (_x # 0) && _turretPath isEqualTo (_x # 1) && _weaponNumber == (_x # 2)) then {
                _defaultAmmoCount = _x # 3;
            };
        } forEach _loadoutListAmmo;
        
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
                } forEach (allTurrets _asset);

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