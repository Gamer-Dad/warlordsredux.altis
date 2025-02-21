#include "..\WLM_constants.inc"

params ["_asset"];

private _display = findDisplay WLM_DISPLAY;

if (isNull _display) then {
    _display = createDialog ["WLM_PylonUI", true];
    // _display = findDisplay 46 createDisplay "WLM_PylonUI";
    // cutRsc ["RscStatic", "PLAIN"];
};

private _assetConfig = configFile >> "CfgVehicles" >> typeOf _asset;
private _pylonConfig = _assetConfig >> "Components" >> "TransportPylonsComponent";

private _isAircraft = !(isNull _pylonConfig);

uiNamespace setVariable ["WLM_asset", _asset];
uiNamespace setVariable ["WLM_assetIsAircraft", _isAircraft];

disableSerialization;

private _assetTypeName = [_asset] call WL2_fnc_getAssetTypeName;

if (_isAircraft) then {
    private _aircraftNameControl = _display displayCtrl WLM_VEHICLE_NAME;
    _aircraftNameControl ctrlSetText _assetTypeName;
} else {
    private _vehicleNameControl = _display displayCtrl 5313;
    _vehicleNameControl ctrlSetText _assetTypeName;
};

private _backgroundPic = _display displayCtrl WLM_BACKGROUND_PIC;

private _assetUiPicture = getText (_pylonConfig >> "UIPicture");
if (_assetUiPicture != "" && fileExists _assetUiPicture) then {
    _backgroundPic ctrlSetText _assetUiPicture;
} else {
    private _assetRegularPicture = getText (_assetConfig >> "picture");
    if (_assetRegularPicture != "" && fileExists _assetRegularPicture) then {
        _backgroundPic ctrlSetText _assetRegularPicture;
    };
};

if (_isAircraft) then {
    _asset call WLM_fnc_constructAircraftPylons;
} else {
    0 spawn WLM_fnc_constructVehicleMagazine;
};

call WLM_fnc_constructPresetMenu;

private _saveButtonControl = _display displayCtrl WLM_SAVE_BUTTON;
_saveButtonControl ctrlAddEventHandler ["ButtonClick", {
    [""] call WLM_fnc_saveLoadout;
}];

private _wipeButtonControl = _display displayCtrl WLM_WIPE_BUTTON;
_wipeButtonControl ctrlAddEventHandler ["ButtonClick", {
    [true] call WLM_fnc_wipePylonSaves;
}];

private _applyButtonControl = _display displayCtrl WLM_APPLY_BUTTON;
_applyButtonControl ctrlAddEventHandler ["ButtonClick", {
    private _isAircraft = uiNamespace getVariable "WLM_assetIsAircraft";
    if (_isAircraft) then {
        [true] call WLM_fnc_applyLoadoutAircraft;
    } else {
        [true] call WLM_fnc_applyLoadoutVehicle;
    };
}];

private _rearmButtonControl = _display displayCtrl WLM_REARM_BUTTON;
_rearmButtonControl ctrlSetText "Rearm";
_rearmButtonControl ctrlAddEventHandler ["ButtonClick", {
    private _isAircraft = uiNamespace getVariable "WLM_assetIsAircraft";
    if (_isAircraft) then {
        [true] call WLM_fnc_rearmAircraft;
    } else {
        [true] call WLM_fnc_startRearmVehicle;
    };
}];

private _camoSelectControl = _display displayCtrl WLM_CAMO_SELECT;

private _textureSlots = getArray (_assetConfig >> "hiddenSelections");

private _customTexturesList = [];
private _defaultTextureList = getArray (_assetConfig >> "hiddenSelectionsTextures");

private _side = side player;
/*
_customTexturesList pushBack [localize "STR_WLM_DEFAULT", _defaultTextureList, localize "STR_WLM_OFFICIAL"];
_customTexturesList pushBack [format ["--- %1 ---", localize "STR_WLM_OFFICIAL"], "", ""];
*/

private _defaultIncluded = false;
private _defaultTextures = getObjectTextures _asset;

private _comparePaths = {
    params ["_input1", "_input2"];
    private _paths1 = (str _input1) regexReplace ["\\", ""];
    private _paths2 = (str _input2) regexReplace ["\\", ""];
    _paths1 == _paths2;
};

private _additionalTextureSources = [_side] call WLM_fnc_textureLists;
{
    private _textureSource = _x;
    private _textureName = _textureSource # 0;
    private _textures = _textureSource # 1;
    if ([_defaultTextures, _textures] call _comparePaths) then {
        _defaultIncluded = true;
        _customTexturesList pushBack [_textureName, _textures, "Current"];
    } else {
        _customTexturesList pushBack [_textureName, _textures, localize "STR_WLM_OFFICIAL"];
    };
} forEach _additionalTextureSources;

if (!_defaultIncluded) then {
    _customTexturesList pushBack [localize "STR_WLM_DEFAULT", _defaultTextures, localize "STR_WLM_OFFICIAL"];
};

/* Disabled as it doesn't fit into Warlords
// Image textures
_customTexturesList pushBack [format ["--- %1 ---", localize "STR_WLM_CUSTOM"], "", ""];

private _pushCustomTexture = {
    params ["_textureName", "_customTexturesList"];
    private _texturePath = format ["Img\camo\%1\%2.paa", (toLower format ["%1", _side]), toLower _textureName];
    if !(fileExists _texturePath) exitWith {};
    _customTexturesList pushBack [_textureName, _texturePath, localize "STR_WLM_CUSTOM"];
};

private _dir = "Img\camo\" + (toLower format ["%1", _side]) + "\";
{
    private _textureName = _x;
    [_textureName, _customTexturesList] call _pushCustomTexture;
} forEach ["Arctic", "Desert", "Urban", "Woodland"];


// Color textures
_customTexturesList pushBack [localize "STR_WLM_SOLID_COLORS", "", ""];
if (_side == west) then {
    _customTexturesList pushBack ["Stealth Black", "#(rgb,8,8,3)color(0.23,0.23,0.24,0.05)", "Solid Color"];
    _customTexturesList pushBack ["NATO Blue", "#(rgb,8,8,3)color(0.01,0.24,0.76,0.05)", "Solid Color"];
    _customTexturesList pushBack ["Tactical Tan", "#(rgb,8,8,3)color(0.40,0.34,0.27,0.4)", "Solid Color"];
};
if (_side == east) then {
    _customTexturesList pushBack ["Cockpit Turquoise", "#(rgb,8,8,3)color(0,0.44,0.56,0.1)", "Solid Color"];
    _customTexturesList pushBack ["CSAT Red", "#(rgb,8,8,3)color(0.49,0.26,0.26,0.05)", "Solid Color"];
    _customTexturesList pushBack ["Tropical Green", "#(rgb,8,8,3)color(0,0.84,0.16,0.03)", "Solid Color"];
};
*/

private _ignoreTextureSlots = ["aiming_dot", "CamoNet", "CamoSlat", "insignia", "number_01", "number_02", "number_03"];

private _defaultTextureSelection = 0;
private _customTexturesMap = createHashMap;
{
    private _textureName = _x # 0;
    private _singleTexture = _x # 1;
    private _category = _x # 2;

    if (typeName _singleTexture == "ARRAY") then {
        _customTexturesMap set [_textureName, _singleTexture];

        private _camoItem = _camoSelectControl lbAdd _textureName;
        _camoSelectControl lbSetData [_camoItem, _textureName];
        _camoSelectControl lbSetTooltip [_camoItem, _category];

        if (_category == "Current") then {
            _defaultTextureSelection = _camoItem;
            _camoSelectControl lbSetColor [_camoItem, [0, 1, 0, 1]];
        };
        continue;
    };

    if (_singleTexture == "") then {
        private _camoItem = _camoSelectControl lbAdd _textureName;
        _camoSelectControl lbSetData [_camoItem, "-1"];
        _camoSelectControl lbSetTooltip [_camoItem, localize "STR_WLM_CATEGORY"];
        continue;
    };

    private _textureArray = [];
    for "_i" from 0 to (count _textureSlots - 1) do {
        private _slot = _textureSlots select _i;
        if (!isNil "_slot" && _slot in _ignoreTextureSlots) then {
            _textureArray pushBack (_defaultTextureList select _i);
        } else {
            _textureArray pushBack _singleTexture;
        };
    };
    _customTexturesMap set [_textureName, _textureArray];

    private _camoItem = _camoSelectControl lbAdd _textureName;
    _camoSelectControl lbSetData [_camoItem, _textureName];
    _camoSelectControl lbSetTooltip [_camoItem, _category];

    if (_category == "Current") then {
        _defaultTextureSelection = _camoItem;
        _camoSelectControl lbSetColor [_camoItem, [0, 1, 0, 1]];
    };
} forEach _customTexturesList;

uiNamespace setVariable ["WLM_assetTexturesMap", _customTexturesMap];
uiNamespace setVariable ["WLM_assetTextureSlots", _textureSlots];

_camoSelectControl lbSetCurSel _defaultTextureSelection;
_camoSelectControl ctrlAddEventHandler ["LBSelChanged", {
    params ["_control", "_lbCurSel", "_lbSelection"];
    private _asset = uiNamespace getVariable "WLM_asset";
    private _texturesMap = uiNamespace getVariable "WLM_assetTexturesMap";
    private _textureSlots = uiNamespace getVariable "WLM_assetTextureSlots";

    private _textureId = _control lbData _lbCurSel;

    if (_textureId == "-1") exitWith {
        _control lbSetCurSel 0;
    };

    private _textureList = _texturesMap getOrDefault [_textureId, []];
    private _applyTextures = createHashmap;
    {
        if (count _textureList <= _forEachIndex) exitWith {};
        private _texture = _textureList select _forEachIndex;
        _applyTextures set [_forEachIndex, _texture];
    } forEach _textureSlots;

    [_asset, _applyTextures] call WLM_fnc_applyTexture;

    for "_i" from 0 to (lbSize _control - 1) do {
        if (_i == _lbCurSel) then {
            _control lbSetColor [_i, [0, 1, 0, 1]];
        } else {
            _control lbSetColor [_i, [1, 1, 1, 1]];
        };
    };

    // Colored turret texture
    // private _orderedClass = _asset getVariable ["WL2_orderedClass", typeOf _asset];
    // if (typeof _asset != _orderedClass) then {
    //     private _textures = getObjectTextures _asset;
    //     private _side = _asset getVariable ["BIS_WL_ownerAssetSide", sideUnknown];
    //     private _sideColor = if (_side == west) then {
    //         "#(argb,8,8,3)color(0,0.1,0.2,1)"
    //     } else {
    //         "#(argb,8,8,3)color(0.2,0.1,0,1)"
    //     };

    //     {
    //         // if the string includes texture
    //         private _isTurret = ["turret", _x] call BIS_fnc_inString || ["tow", _x] call BIS_fnc_inString;
    //         if (_isTurret) then {
    //             _asset setObjectTextureGlobal [_forEachIndex, _sideColor];
    //         };
    //     } forEach _textures;
    // };
}];

private _customizationSelectControl = _display displayCtrl WLM_CUSTOMIZATION_SELECT;

private _customizationAllowList = [
    "showbag",
    "showtools",
    "showlog",
    "showslat",
    "moveplow",
    "showcamo",
    "showammobox",
    "wing_fold_l",
    "hide_rail",
    "hide_shield"
];

private _availableCustomizations = [];
{
    private _currentAnimationName = _x;
    {
        private _nameMatch = [_x, _currentAnimationName, false] call BIS_fnc_inString;
        private _hasDisplayName = getText (_assetConfig >> "animationSources" >> _currentAnimationName >> "displayName") != "";
        if (_nameMatch && (_hasDisplayName || _currentAnimationName == "MovePlow")) then {
            _availableCustomizations pushBack _currentAnimationName;
        };
    } forEach _customizationAllowList;
} forEach (animationNames _asset);

uiNamespace setVariable ["WLM_assetAvailableAnimations", _availableCustomizations];

private _header = _customizationSelectControl lbAdd (localize "STR_WLM_CUSTOMIZATION");
_customizationSelectControl lbSetData [_header, "header"];

if (count _availableCustomizations > 0) then {
    private _everythingItem = _customizationSelectControl lbAdd (localize "STR_WLM_APPLY_ALL_EXTRAS");
    _customizationSelectControl lbSetData [_everythingItem, "everything"];
};

{
    private _customization = _x;
    private _customizationDisplayName = getText (_assetConfig >> "animationSources" >> _customization >> "displayName");
    if (_customizationDisplayName == "") then {
        _customizationDisplayName = _customization;
    };
    private _customizationItem = _customizationSelectControl lbAdd _customizationDisplayName;
    _customizationSelectControl lbSetData [_customizationItem, _customization];
    _customizationSelectControl lbSetTooltip [_customizationItem, _customization];
} forEach _availableCustomizations;


private _assetTurrets = [[-1]] + allTurrets _asset;
private _hasSmoke = [];
{
    private _turretWeapons = _asset weaponsTurret _x;
    if ("SmokeLauncher" in _turretWeapons) exitWith {
        _hasSmoke = _x;
    };
} forEach _assetTurrets;
if (count _hasSmoke > 0) then {
    if ([0] in _assetTurrets) then {
        private _smokeGunnerItem = _customizationSelectControl lbAdd "Give Smoke to Gunner";
        _customizationSelectControl lbSetData [_smokeGunnerItem, "setSmokeToGunner"];
    };
    if ([0, 0] in _assetTurrets) then {
        private _smokeCommanderItem = _customizationSelectControl lbAdd "Give Smoke to Commander";
        _customizationSelectControl lbSetData [_smokeCommanderItem, "setSmokeToCommander"];
    };
    if ([-1] in _assetTurrets) then {
        private _smokeDriverItem = _customizationSelectControl lbAdd "Give Smoke to Driver";
        _customizationSelectControl lbSetData [_smokeDriverItem, "setSmokeToDriver"];
    };
};

private _hornWeapons = ["AmbulanceHorn", "CarHorn", "TruckHorn", "TruckHorn2", "TruckHorn3", "SportCarHorn", "MiniCarHorn"];
private _turretWeapons = _asset weaponsTurret [-1];
if (count (_hornWeapons arrayIntersect _turretWeapons) > 0) then {
    {
        private _hornItem = _customizationSelectControl lbAdd (format ["Set Horn to %1", _x]);
        _customizationSelectControl lbSetData [_hornItem, format ["setHornTo%1", _x]];
    } forEach _hornWeapons;
};

_customizationSelectControl lbSetCurSel 0;

_customizationSelectControl ctrlAddEventHandler ["LBSelChanged", {
    params ["_control", "_lbCurSel", "_lbSelection"];
    if (_lbCurSel == 0) exitWith {}; // careful

    private _customization = _control lbData _lbCurSel;
    if (_customization == "everything") then {
        private _availableCustomizations = uiNamespace getVariable "WLM_assetAvailableAnimations";
        {
            private _customization = _x;
            private _overrideState = if (["hide", _customization, false] call BIS_fnc_inString) then {
                0
            } else {
                1
            };
            [_customization, _overrideState] call WLM_fnc_applyCustomization;
        } forEach (_availableCustomizations);
    } else {
        [_customization] call WLM_fnc_applyCustomization;
    };

    _control lbSetCurSel 0;
}];

[_asset, _customizationSelectControl] spawn {
    params ["_asset", "_control"];
    while { !isNull _control } do {
        private _assetTurrets = [[-1]] + allTurrets _asset;
        private _hasSmoke = [];
        {
            private _turretWeapons = _asset weaponsTurret _x;
            if ("SmokeLauncher" in _turretWeapons) exitWith {
                _hasSmoke = _x;
            };
        } forEach _assetTurrets;

        for "_i" from 0 to (lbSize _control - 1) do {
            private _type = _control lbData _i;
            switch (_type) do {
                case "setSmokeToGunner": {
                    if (_hasSmoke isEqualTo [0]) then {
                        _control lbSetColor [_i, [0, 1, 0, 1]];
                    } else {
                        _control lbSetColor [_i, [1, 1, 1, 1]];
                    };
                };
                case "setSmokeToCommander": {
                    if (_hasSmoke isEqualTo [0, 0]) then {
                        _control lbSetColor [_i, [0, 1, 0, 1]];
                    } else {
                        _control lbSetColor [_i, [1, 1, 1, 1]];
                    };
                };
                case "setSmokeToDriver": {
                    if (_hasSmoke isEqualTo [-1]) then {
                        _control lbSetColor [_i, [0, 1, 0, 1]];
                    } else {
                        _control lbSetColor [_i, [1, 1, 1, 1]];
                    };
                };
                case "header";
                case "everything": {
                    _control lbSetColor [_i, [1, 1, 1, 1]];
                };
                default {
                    if (["setHornTo", _type] call BIS_fnc_inString) then {
                        private _hornName = _type regexReplace ["setHornTo", ""];
                        private _turretWeapons = _asset weaponsTurret [-1];
                        if (_hornName in _turretWeapons) then {
                            _control lbSetColor [_i, [0, 1, 0, 1]];
                        } else {
                            _control lbSetColor [_i, [1, 1, 1, 1]];
                        };
                    } else {
                        private _customizationPhase = (_asset animationPhase _type) == 0;
                        if (["hide", _type, false] call BIS_fnc_inString) then {
                            _customizationPhase = !_customizationPhase;
                        };

                        if (_customizationPhase) then {
                            _control lbSetColor [_i, [1, 0, 0, 1]];
                        } else {
                            _control lbSetColor [_i, [0, 1, 0, 1]];
                        };
                    };
                };
            };
        };

        sleep 1;
    };
};

if (lbSize _customizationSelectControl == 1) then {
    _customizationSelectControl ctrlShow false;
    _customizationSelectControl ctrlCommit 0;
};

private _nonHornWeapons = [];
{
    private _currentTurretWeapons = _asset weaponsTurret _x;
    _nonHornWeapons append (_currentTurretWeapons select { !(_x in _hornWeapons) });
} forEach _assetTurrets;
if (count _nonHornWeapons == 0) exitWith {
    private _rearmButtonControl = _display displayCtrl WLM_REARM_BUTTON;
    _rearmButtonControl ctrlSetText "No weapons";
    _rearmButtonControl ctrlEnable false;
};

_asset spawn {
    params ["_asset"];

    private _display = findDisplay WLM_DISPLAY;

    private _applyButtonControl = _display displayCtrl WLM_APPLY_BUTTON;
    private _applyOriginalTooltip = ctrlTooltip _applyButtonControl;
	private _rearmButtonControl = _display displayCtrl WLM_REARM_BUTTON;
    private _rearmOriginalTooltip = ctrlTooltip _rearmButtonControl;

    while {!isNull _display} do {
        private _nonLocalCrew = (crew _asset) select {
            !(local _x) && !(typeof _x in ["B_UAV_AI", "O_UAV_AI", "I_UAV_AI"])
        };

        if (count _nonLocalCrew > 0) then {
            _applyButtonControl ctrlSetTooltip "Remove player gunners before rearming.";
            _rearmButtonControl ctrlSetTooltip "Remove player gunners before rearming.";
            _applyButtonControl ctrlEnable false;
            _rearmButtonControl ctrlEnable false;
        } else {
            _applyButtonControl ctrlSetTooltip _applyOriginalTooltip;
            _rearmButtonControl ctrlSetTooltip _rearmOriginalTooltip;
            _applyButtonControl ctrlEnable true;
            _rearmButtonControl ctrlEnable true;
        };

        sleep 1;
    };
};

_asset spawn {
	params ["_asset"];
    private _display = findDisplay WLM_DISPLAY;
    private _rearmButtonControl = _display displayCtrl WLM_REARM_BUTTON;
	while {!isNull _display} do {
		private _cooldown = (((_asset getVariable "BIS_WL_nextRearm") - serverTime) max 0);
		private _nearbyVehicles = (_asset nearObjects ["All", WL_MAINTENANCE_RADIUS]) select { alive _x };
		private _rearmVehicleIndex = _nearbyVehicles findIf { getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "transportAmmo") > 0 };
		private _amount = (_nearbyVehicles # _rearmVehicleIndex) getVariable ["WLM_ammoCargo", 0];

        private _rearmText = if (_cooldown == 0) then {
            format ["%1 (%2 kg)", localize "STR_WLM_REARM", round _amount];
        } else {
            private _cooldownTimer = [_cooldown, "MM:SS"] call BIS_fnc_secondsToString;
            format ["%1 (%2)", localize "STR_WLM_REARM", _cooldownTimer];
        };

		_rearmButtonControl ctrlSetText _rearmText;

        private _applyButtonControl = _display displayCtrl WLM_APPLY_BUTTON;
        private _isAircraft = uiNamespace getVariable ["WLM_assetIsAircraft", false];
        private _eligibleFreeRearm = [_asset, _isAircraft] call WLM_fnc_calculateFreeRearmEligibility;
        if (_eligibleFreeRearm) then {
            _applyButtonControl ctrlSetText (localize "STR_WLM_APPLY_FREE");
        } else {
            _applyButtonControl ctrlSetText (localize "STR_WLM_APPLY");
        };

		sleep 1;
	};
};