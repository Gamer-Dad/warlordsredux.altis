#include "..\WLM_constants.inc"

params ["_asset"];

private _display = findDisplay WLM_DISPLAY;

if (isNull _display) then {
    _display = createDialog ["WLM_PylonUI", true];
    // _display = findDisplay 46 createDisplay "WLM_PylonUI";
    cutRsc ["RscStatic", "PLAIN"];
};

private _assetConfig = configFile >> "CfgVehicles" >> typeOf _asset;
private _pylonConfig = _assetConfig >> "Components" >> "TransportPylonsComponent";

private _isAircraft = !(isNull _pylonConfig);

uiNamespace setVariable ["WLM_asset", _asset];
uiNamespace setVariable ["WLM_assetIsAircraft", _isAircraft];

disableSerialization;

private _assetTypeName = getText (_assetConfig >> "displayName");

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
        [true] call WLM_fnc_rearmVehicle;
    };
}];

private _camoSelectControl = _display displayCtrl WLM_CAMO_SELECT;

private _textureSlots = getArray (_assetConfig >> "hiddenSelections");

private _customTexturesList = [];
private _defaultTextureList = getArray (_assetConfig >> "hiddenSelectionsTextures");

private _side = side player;
switch (typeOf _asset) do {
    case "O_T_Truck_03_device_ghex_F";
    case "O_Truck_03_device_F": {
        if (_side == west) then {
            _defaultTextureList = [
                "#(argb,8,8,3)color(0.80,0.76,0.66,0.15)",
                "#(argb,8,8,3)color(0.2,0.25,0.25,0.15)",
                "#(argb,8,8,3)color(0.2,0.25,0.3,0.15)",
                "#(argb,8,8,3)color(0.6,0.6,0.4,0.15)",
                "\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_02_CO.paa",
                "\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_03_CO.paa"
            ];
        };
    };
    case "B_Truck_01_flatbed_F": {
        if (_side == east) then {
            _defaultTextureList = getArray (_assetConfig >> "textureSources" >> "Olive" >> "textures");
        };
    };
    case "I_Plane_Fighter_03_dynamicLoadout_F": {
        _defaultTextureList = getArray (_assetConfig >> "textureSources" >> "Hex" >> "textures");
    };
    case "I_Plane_Fighter_04_F": {
        _defaultTextureList = getArray (_assetConfig >> "textureSources" >> "DigitalCamoGrey" >> "textures");
    };
    case "I_Truck_02_MRL_F": {
        _defaultTextureList = getArray (_assetConfig >> "textureSources" >> "Opfor" >> "textures");
    };
    case "B_APC_Wheeled_03_cannon_F": {
        _defaultTextureList = [
            "A3\armor_f_gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_co.paa",
            "A3\armor_f_gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext2_co.paa",
            "A3\armor_f_gamma\APC_Wheeled_03\Data\rcws30_co.paa",
            "A3\armor_f_gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_alpha_co.paa",
            "A3\Armor_F\Data\camonet_AAF_FIA_green_CO.paa",
            "A3\armor_f\data\cage_G3_co.paa"
        ];
        
    };
    case "I_Heli_light_03_dynamicLoadout_F": {
        _defaultTextureList = getArray (_assetConfig >> "textureSources" >> "EAF" >> "textures");
    };
    case "B_AAA_System_01_F";
    case "B_SAM_System_01_F";
    case "B_SAM_System_02_F": {
        if (_side == east) then {
            _defaultTextureList = getArray (_assetConfig >> "textureSources" >> "Green" >> "textures");
        };
    };
};

_customTexturesList pushBack [localize "STR_WLM_DEFAULT", _defaultTextureList, localize "STR_WLM_OFFICIAL"];
_customTexturesList pushBack [format ["--- %1 ---", localize "STR_WLM_OFFICIAL"], "", ""];

private _additionalTextureSources = [_side] call WLM_fnc_textureLists;

{
    private _textureSource = _x;
    _customTexturesList pushBack [_textureSource # 0, _textureSource # 1, localize "STR_WLM_OFFICIAL"];
} forEach _additionalTextureSources;

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

private _ignoreTextureSlots = ["aiming_dot", "CamoNet", "CamoSlat", "insignia", "number_01", "number_02", "number_03"];
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
} forEach _customTexturesList;

uiNamespace setVariable ["WLM_assetTexturesMap", _customTexturesMap];
uiNamespace setVariable ["WLM_assetTextureSlots", _textureSlots];

_camoSelectControl lbSetCurSel 0;
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
    {
        if (count _textureList <= _forEachIndex) exitWith {};
        private _texture = _textureList select _forEachIndex;
        _asset setObjectTextureGlobal [_forEachIndex, _texture];
    } forEach _textureSlots;
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
    "wing_fold_l"
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

uiNamespace setVariable ["WLM_assetAvailableCustomizations", _availableCustomizations];

_customizationSelectControl lbAdd (localize "STR_WLM_CUSTOMIZATION");

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
private _hasSmoke = false;
{
    private _turretWeapons = _asset weaponsTurret _x;
    if ("SmokeLauncher" in _turretWeapons) exitWith {
        _hasSmoke = true;
    };
} forEach _assetTurrets;
if (_hasSmoke) then {
    if ([0] in _assetTurrets) then {
        private _smokeGunnerItem = _customizationSelectControl lbAdd "Give Smoke to Gunner";
        _customizationSelectControl lbSetData [_smokeGunnerItem, "setSmokeToGunner"];
    };
    if ([0, 0] in _assetTurrets) then {
        private _smokeCommanderItem = _customizationSelectControl lbAdd "Give Smoke to Commander";
        _customizationSelectControl lbSetData [_smokeCommanderItem, "setSmokeToCommander"];
    };
    private _smokeDriverItem = _customizationSelectControl lbAdd "Give Smoke to Driver";
    _customizationSelectControl lbSetData [_smokeDriverItem, "setSmokeToDriver"];
};

private _hornWeapons = ["CarHorn", "TruckHorn", "TruckHorn2", "TruckHorn3", "SportCarHorn", "MiniCarHorn"];
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

    private _asset = uiNamespace getVariable "WLM_asset";
    private _assetConfig = configFile >> "CfgVehicles" >> typeOf _asset;
    private _availableCustomizations = uiNamespace getVariable "WLM_assetAvailableCustomizations";

    private _customization = _control lbData _lbCurSel;

    if (_customization == "everything") then {
        {
            private _customization = _x;
            _asset animateSource [_customization, 1];
        } forEach (_availableCustomizations);
    } else {
        private _finalizeCustomization = {
            params ["_asset"];
            sleep 0.5;
            0 spawn WLM_fnc_constructVehicleMagazine;
        };

        if (["setHornTo", _customization] call BIS_fnc_inString) then {
            private _hornName = _customization regexReplace ["setHornTo", ""];
            [_asset, _hornName] remoteExec ["WLM_fnc_changeHornServer", 2];
        } else {
            switch (_customization) do {
                case "setSmokeToGunner": {
                    [_asset, [0]] remoteExec ["WLM_fnc_moveSmokesServer", 2];
                    _asset spawn _finalizeCustomization;
                };
                case "setSmokeToCommander": {
                    [_asset, [0, 0]] remoteExec ["WLM_fnc_moveSmokesServer", 2];
                    _asset spawn _finalizeCustomization;
                };
                case "setSmokeToDriver": {
                    [_asset, [-1]] remoteExec ["WLM_fnc_moveSmokesServer", 2];
                    _asset spawn _finalizeCustomization;
                };
                default {
                    private _currentValue = _asset animationPhase _customization;
                    if (_currentValue == 1) then {
                        private _forceAnimations = getArray (_assetConfig >> "animationSources" >> _customization >> "forceAnimate2");
                        for "_i" from 0 to ((count _forceAnimations - 1) / 2) do {
                            private _forceAnimationName = _forceAnimations # (_i * 2);
                            private _forceAnimationValue = _forceAnimations # (_i * 2 + 1);
                            _asset animateSource [_forceAnimationName, _forceAnimationValue];
                        };
                        _asset animateSource [_customization, 0];
                    } else {
                        private _forceAnimations = getArray (_assetConfig >> "animationSources" >> _customization >> "forceAnimate");
                        for "_i" from 0 to ((count _forceAnimations - 1) / 2) do {
                            private _forceAnimationName = _forceAnimations # (_i * 2);
                            private _forceAnimationValue = _forceAnimations # (_i * 2 + 1);
                            _asset animateSource [_forceAnimationName, _forceAnimationValue];
                        };
                        _asset animateSource [_customization, 1];
                    };
                };
            };
        };
    };
    
    _control lbSetCurSel 0;
}];

_asset spawn {
	params ["_asset"];
    private _display = findDisplay WLM_DISPLAY;
    private _rearmButtonControl = _display displayCtrl WLM_REARM_BUTTON;
	while {!isNull _display} do {
		private _cooldown = (((_asset getVariable "BIS_WL_nextRearm") - serverTime) max 0);
		private _nearbyVehicles = (_asset nearObjects ["All", WL_MAINTENANCE_RADIUS]) select { alive _x };
		private _rearmVehicleIndex = _nearbyVehicles findIf { getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "transportAmmo") > 0 };
		private _amount = (_nearbyVehicles # _rearmVehicleIndex) getVariable ["GOM_fnc_ammocargo", 0];
		private _amountText = format ["(%1)", _amount call GOM_fnc_kgToTon];

        private _rearmText = if (_cooldown == 0) then {
            format ["%1 %2", localize "STR_WLM_REARM", _amountText];
        } else {
            [_cooldown, "MM:SS"] call BIS_fnc_secondsToString;
        };

		_rearmButtonControl ctrlSetText _rearmText;
		sleep 1;
	};
};