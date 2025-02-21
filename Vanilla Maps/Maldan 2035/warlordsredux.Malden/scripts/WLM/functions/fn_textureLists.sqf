params ["_side"];

private _asset = uiNamespace getVariable "WLM_asset";

private _blacklistWest = ["Digital Green", "AAF", "Opfor", "Hex"];
private _blacklistEast = ["Digital Green", "AAF", "Blufor"];

private _whitelistWest = [];
private _whitelistEast = [];

_whitelistWest pushBack ["Heli_Light_01_base_F",
    ["NATO Black", "A3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"],
    ["Blue", "A3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"],
    ["Digital Gray", "A3\air_f\Heli_Light_01\Data\Skins\Heli_Light_01_ext_digital_co.paa"],
    ["Line", "A3\air_f\Heli_Light_01\Data\Skins\Heli_Light_01_ext_blueline_co.paa"],
    ["Sheriff", "A3\air_f\Heli_Light_01\Data\Skins\Heli_Light_01_ext_sheriff_co.paa"],
    ["Wasp", "A3\air_f\Heli_Light_01\Data\Skins\Heli_Light_01_ext_wasp_co.paa"],
    ["Wave", "A3\air_f\Heli_Light_01\Data\Skins\Heli_Light_01_ext_wave_co.paa"]
];

_whitelistWest pushBack ["UAV_02_base_F",
    ["Digital Gray", "\A3\Drones_F\Air_F_Gamma\UAV_02\Data\UAV_02_INDP_CO.paa"]
];

_whitelistWest pushBack ["Heli_Attack_01_base_F",
    ["Green", "A3\Air_F\Heli_Light_02\Data\heli_light_02_common_co.paa"],
    ["Black", "A3\Air_F_Beta\heli_attack_01\data\UI\Heli_Attack_01_EDEN_CA.PAA"]
];

private _assetConfig = configFile >> "CfgVehicles" >> typeOf _asset;
private _officialTextureSources = configProperties [_assetConfig >> "TextureSources"];

private _checkBlacklist = {
    params ["_blacklist", "_textureSourceName"];

    private _isBlacklisted = false;
    {
        private _findSubstring = [_x, _textureSourceName, false] call BIS_fnc_inString; // case insensitive search
        if (_findSubstring) then {
            _isBlacklisted = true;
        };
    } forEach _blacklist;

    _isBlacklisted;
};

private _sideBlacklist = switch (_side) do {
    case west: {
        _blacklistWest
    };
    case east: {
        _blacklistEast
    };
    default {
        []
    };
};

private _sideWhitelist = switch (_side) do {
    case west: {
        _whitelistWest
    };
    case east: {
        _whitelistEast
    };
    default {
        []
    };
};

private _texturesToReturn = [];
{
    private _textureSource = _x;
    private _textureSourceName = getText (_textureSource >> "displayName");
    private _textureSourceTextures = getArray (_textureSource >> "textures");

    private _isBlacklisted = [_sideBlacklist, _textureSourceName] call _checkBlacklist;
    if (!_isBlacklisted) then {
        _texturesToReturn pushBack [_textureSourceName, _textureSourceTextures];
    };
} forEach _officialTextureSources;

{
    private _typeVehicleAllowed = _x # 0;
    if (_asset isKindOf _typeVehicleAllowed) then {
        private _whiteListedTextures = +_x;
        _whiteListedTextures deleteAt 0;
        _texturesToReturn append _whiteListedTextures;
    };
} forEach _sideWhitelist;

_texturesToReturn;