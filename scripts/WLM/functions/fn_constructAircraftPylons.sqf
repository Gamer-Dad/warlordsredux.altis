#include "..\WLM_constants.inc"

params ["_asset"];

private _assetConfig = configFile >> "CfgVehicles" >> typeOf _asset;
private _pylonConfig = _assetConfig >> "Components" >> "TransportPylonsComponent";
private _pylonsInfo = configProperties [_pylonConfig >> "pylons"];
private _currentAssetPylonInfo = getAllPylonsInfo _asset;

{
    private _uiPosition = getArray (_x >> "uiPosition");
    private _selectBox = _display ctrlCreate ["WLM_PylonSelect", WLM_PYLON_START + _forEachIndex];
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

    private _pylonConfigName = configName _x;
    private _currentPylonInfo = _currentAssetPylonInfo select { _pylonConfigName == (_x # 1) } select 0;

    _selectBox lbAdd (localize "STR_WLM_EMPTY");
    _selectBox lbSetCurSel 0;

    private _allowedMagazines = _asset getCompatiblePylonMagazines _pylonConfigName;

    private _allowListForPylon = missionNamespace getVariable ["WL2_allowPylonMagazines", createHashMap];
    _allowedMagazines append (_allowListForPylon getOrDefault [typeOf _asset, []]);

    private _bannedWords = ["leaflet", "bombcluster"];
    _allowedMagazines = _allowedMagazines select {
        private _mag = _x;
        private _isBanned = false;
        {
            _isBanned = _isBanned || [_x, _mag] call BIS_fnc_inString;
        } forEach _bannedWords;
        !_isBanned;
    };

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
    } forEach _allowedMagazines;

    _selectBox ctrlSetPosition [_xPos, _yPos, _textWidth + 0.04, 0.035];

    _selectBox ctrlCommit 0;

    private _selectUserBox = _display ctrlCreate ["WLM_PylonSelectUser", WLM_PYLON_USER_START + _forEachIndex];
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
