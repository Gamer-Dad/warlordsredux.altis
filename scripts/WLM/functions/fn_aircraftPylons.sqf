#include "..\WLM_constants.inc"

params ["_asset"];

private _display = findDisplay WLM_DISPLAY;

if (isNull _display) then {
    _display = createDialog ["WLM_PylonUI", true];
};

uiNamespace setVariable ["WLM_asset", _asset];

disableSerialization;

private _assetConfig = configFile >> "CfgVehicles" >> typeOf _asset;
private _pylonConfig = _assetConfig >> "Components" >> "TransportPylonsComponent";

private _assetTypeName = getText (_assetConfig >> "displayName");

private _vehicleNameControl = _display displayCtrl WLM_VEHICLE_NAME;
_vehicleNameControl ctrlSetText _assetTypeName;

private _assetUiPicture = getText (_pylonConfig >> "UIPicture");
private _assetRegularPicture = getText (_assetConfig >> "picture");

private _backgroundPic = _display displayCtrl WLM_BACKGROUND_PIC;
if (_assetUiPicture != "") then {
    _backgroundPic ctrlSetText _assetUiPicture;
} else {
    if (_assetRegularPicture != "") then {
        _backgroundPic ctrlSetText _assetRegularPicture;
    };
};

_asset call WLM_fnc_constructAircraftPylons;
call WLM_fnc_constructPresetMenu;

private _saveButtonControl = _display displayCtrl WLM_SAVE_BUTTON;
_saveButtonControl ctrlAddEventHandler ["ButtonClick", {
    _this call WLM_fnc_saveLoadout;
    call WLM_fnc_constructPresetMenu;
}];

private _wipeButtonControl = _display displayCtrl WLM_WIPE_BUTTON;
_wipeButtonControl ctrlAddEventHandler ["ButtonClick", {
    [true] call WLM_fnc_wipePylonSaves;
}];

private _applyButtonControl = _display displayCtrl WLM_APPLY_BUTTON;
_applyButtonControl ctrlAddEventHandler ["ButtonClick", {
    [true] call WLM_fnc_applyLoadout;
}];

private _rearmButtonControl = _display displayCtrl WLM_REARM_BUTTON;
_rearmButtonControl ctrlSetText "Rearm";
_rearmButtonControl ctrlAddEventHandler ["ButtonClick", {
    [true] call WLM_fnc_rearmAircraft;
}];

private _camoSelectControl = _display displayCtrl WLM_CAMO_SELECT;

private _textureSlots = getArray (_assetConfig >> "hiddenSelections");

private _customTexturesList = [];
private _defaultTextureList = [];

switch (typeOf _asset) do {
    case "I_Plane_Fighter_03_dynamicLoadout_F": {
        _defaultTextureList = getArray (_assetConfig >> "textureSources" >> "Hex" >> "textures");
    };
    case "I_Plane_Fighter_04_F": {
        _defaultTextureList = getArray (_assetConfig >> "textureSources" >> "DigitalCamoGrey" >> "textures");
    };
    default { 
        _defaultTextureList = getArray (_assetConfig >> "hiddenSelectionsTextures") 
    };
};

_customTexturesList pushBack ["Default Skin", _defaultTextureList, "Official"];

private _additionalTextureSources = [side player] call WLM_fnc_textureLists;

{
    private _textureSource = _x;
    _customTexturesList pushBack [_textureSource # 0, _textureSource # 1, "Official"];
} forEach _additionalTextureSources;

// Image textures
_customTexturesList pushBack ["--- Custom ---", "", ""];

private _pushCustomTexture = {
    params ["_textureName", "_customTexturesList"];
    private _texturePath = format ["Img\camo\%1\%2.paa", (toLower format ["%1", side player]), toLower _textureName];
    if !(fileExists _texturePath) exitWith {};
    _customTexturesList pushBack [_textureName, _texturePath, "Custom"];
};

private _dir = "Img\camo\" + (toLower format ["%1", side player]) + "\";
{
    private _textureName = _x;
    [_textureName, _customTexturesList] call _pushCustomTexture;
} forEach ["Arctic", "Desert", "Urban", "Woodland"];


// Color textures
_customTexturesList pushBack ["--- Solid Colors ---", "", ""];
if (side player == west) then {
    _customTexturesList pushBack ["Stealth Black", "#(rgb,8,8,3)color(0.23,0.23,0.24,0.05)", "Solid Color"];
    _customTexturesList pushBack ["NATO Blue", "#(rgb,8,8,3)color(0.01,0.24,0.76,0.05)", "Solid Color"];
    _customTexturesList pushBack ["Tactical Tan", "#(rgb,8,8,3)color(0.40,0.34,0.27,0.4)", "Solid Color"];
} else {
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
        _camoSelectControl lbSetTooltip [_camoItem, "Category"];
        
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