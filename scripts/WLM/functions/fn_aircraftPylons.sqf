params ["_asset"];

private _DISPLAY = findDisplay 5300;

if (isNull _DISPLAY) then {
    _DISPLAY = createDialog ["WLM_PylonUI", true];
};

uiNamespace setVariable ["WLM_asset", _asset];

disableSerialization;

private _BACKGROUND_PIC = 5303;

private _assetConfig = configFile >> "CfgVehicles" >> typeOf _asset;

private _pylonConfig = _assetConfig >> "Components" >> "TransportPylonsComponent";

private _assetTypeName = getText (_assetConfig >> "displayName");

private _VEHICLE_NAME = _DISPLAY displayCtrl 5310;
_VEHICLE_NAME ctrlSetText _assetTypeName;

private _assetUiPicture = getText (_pylonConfig >> "UIPicture");
private _assetRegularPicture = getText (_assetConfig >> "picture");

private _backgroundPic = _DISPLAY displayCtrl _BACKGROUND_PIC;
if (_assetUiPicture != "") then {
    _backgroundPic ctrlSetText _assetUiPicture;
} else {
    if (_assetRegularPicture != "") then {
        _backgroundPic ctrlSetText _assetRegularPicture;
    };
};

private _PYLON_IDC_START = 5501;
private _PYLON_USER_IDC_START = 5601;

private _pylonsInfo = configProperties [_pylonConfig >> "pylons"];
{
    private _uiPosition = getArray (_x >> "uiPosition");
    private _selectBox = _DISPLAY ctrlCreate ["WLM_PylonSelect", _PYLON_IDC_START + _forEachIndex];
    private _xPos = _uiPosition # 0;
    private _yPos = _uiPosition # 1;

    // transformation from pylon system (magic)
    _xPos = _xPos + 0.167;
    _yPos = _yPos + 0.225;

    // transformation to grid system
    _xPos = _xPos * 0.745; //+ 0.125;

    private _textWidth = "- EMPTY -" getTextWidth ["PuristaMedium", 0.035];

    // adjust for size
    _xPos = _xPos - _textWidth / 2;
    // _yPos = _yPos - (ctrlTextHeight _selectBox / 2);

    private _pylonConfigName = configName _x;
    private _currentPylonInfo = (getAllPylonsInfo _asset) select { _pylonConfigName == (_x # 1) } select 0;

    _selectBox lbAdd "- EMPTY -";
    _selectBox lbSetCurSel 0;

    {
        private _magazine = configfile >> "CfgMagazines" >> _x;
        private _magazineName = getText (_magazine >> "displayName");
        private _description = getText (_magazine >> "descriptionShort");
        private _magSize = getNumber (_magazine >> "count");

        private _magSizeInName = [format["%1x", _magSize], _magazineName] call BIS_fnc_inString;

        private _displayName = if (_magSizeInName || _magSize <= 1) then {
            _magazineName;
        } else {
            format ["%1 %2x", _magazineName, _magSize];
        };

        private _selectBoxItem = _selectBox lbAdd _displayName;
        _selectBox lbSetTooltip [_selectBoxItem, _description];
        _selectBox lbSetData [_selectBoxItem, _x];

        if (_currentPylonInfo # 3 == (configName _magazine)) then {
            _selectBox lbSetCurSel _selectBoxItem;
        };
    } forEach (_asset getCompatiblePylonMagazines _pylonConfigName);

    _selectBox ctrlSetPosition [_xPos, _yPos, _textWidth + 0.04, 0.035];

    _selectBox ctrlCommit 0;

    private _selectUserBox = _DISPLAY ctrlCreate ["WLM_PylonSelectUser", _PYLON_USER_IDC_START + _forEachIndex];
    _selectUserBox ctrlSetPosition [_xPos - 0.035, _yPos];

    if (_currentPylonInfo # 2 isEqualTo [0]) then {
        _selectUserBox ctrlSetText "a3\ui_f\data\IGUI\Cfg\CommandBar\imageGunner_ca.paa";
        _selectUserBox ctrlSetTooltip "Control: Gunner";
    } else {
        _selectUserBox ctrlSetText "a3\ui_f\data\IGUI\Cfg\CommandBar\imageDriver_ca.paa";
        _selectUserBox ctrlSetTooltip "Control: Pilot";
    };
    
    _selectUserBox ctrlAddEventHandler ["ButtonClick", "_this call WLM_fnc_switchUser"];
    _selectUserBox ctrlCommit 0;
} forEach _pylonsInfo;

call WLM_fnc_constructPresetMenu;

private _SAVE_BUTTON = _DISPLAY displayCtrl 5305;
_SAVE_BUTTON ctrlAddEventHandler ["ButtonClick", {
    _this call WLM_fnc_saveLoadout;
    call WLM_fnc_constructPresetMenu; 
}];

private _CLEAR_SAVED_BUTTON = _DISPLAY displayCtrl 5307;
_CLEAR_SAVED_BUTTON ctrlAddEventHandler ["ButtonClick", {
    private _asset = uiNamespace getVariable "WLM_asset";
    private _variableName = format ["WLM_savedLoadout_%1", typeOf _asset];
    profileNamespace setVariable [_variableName, []];
    call WLM_fnc_constructPresetMenu; 
}];

private _APPLY_BUTTON = _DISPLAY displayCtrl 5304;
_APPLY_BUTTON ctrlAddEventHandler ["ButtonClick", {
    _this call WLM_fnc_applyLoadout;
}];

private _REARM_BUTTON = _DISPLAY displayCtrl 5308;
_REARM_BUTTON ctrlSetText "Rearm";
_REARM_BUTTON ctrlAddEventHandler ["ButtonClick", {
    [true] call WLM_fnc_rearmAircraft;
}];

private _CAMO_COMBO = _DISPLAY displayCtrl 5311;

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

        private _camoItem = _CAMO_COMBO lbAdd _textureName;
        _CAMO_COMBO lbSetData [_camoItem, _textureName];
        _CAMO_COMBO lbSetTooltip [_camoItem, _category];

        continue;
    };

    if (_singleTexture == "") then {
        private _camoItem = _CAMO_COMBO lbAdd _textureName;
        _CAMO_COMBO lbSetData [_camoItem, "-1"];
        _CAMO_COMBO lbSetTooltip [_camoItem, "Category"];
        
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

    private _camoItem = _CAMO_COMBO lbAdd _textureName;
    _CAMO_COMBO lbSetData [_camoItem, _textureName];
    _CAMO_COMBO lbSetTooltip [_camoItem, _category];
} forEach _customTexturesList;

uiNamespace setVariable ["WLM_assetTexturesMap", _customTexturesMap];
uiNamespace setVariable ["WLM_assetTextureSlots", _textureSlots];

_CAMO_COMBO lbSetCurSel 0;
_CAMO_COMBO ctrlAddEventHandler ["LBSelChanged", {
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
    private _DISPLAY = findDisplay 5300;
    private _REARM_BUTTON = _DISPLAY displayCtrl 5308;
	while {!isNull _DISPLAY} do {
		private _cooldown = (((_asset getVariable "BIS_WL_nextRearm") - serverTime) max 0);
		private _nearbyVehicles = (_asset nearObjects ["All", 30]) select {alive _x};
		private _rearmVehicleIndex = _nearbyVehicles findIf {getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "transportAmmo") > 0};
		private _amount = (_nearbyVehicles # _rearmVehicleIndex) getVariable ["GOM_fnc_ammocargo", 0];
		private _amountText = format ["(%1)", (_amount call GOM_fnc_kgToTon)];

        private _rearmText = if (_cooldown == 0) then {
            format ["%1 %2", localize "STR_WLM_REARM", _amountText];
        } else {
            [_cooldown, "MM:SS"] call BIS_fnc_secondsToString;
        };

		_REARM_BUTTON ctrlSetText _rearmText;
		sleep 1;
	};
};