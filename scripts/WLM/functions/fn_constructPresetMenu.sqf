private _asset = uiNamespace getVariable "WLM_asset";
private _pylonConfig = configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent";
private _pylonsInfo = configProperties [_pylonConfig >> "pylons"];
private _DISPLAY = findDisplay 5300;

private _LOAD_SELECT = _DISPLAY displayCtrl 5306;
lbClear _LOAD_SELECT;

private _presets = configProperties [_pylonConfig >> "Presets"];
_LOAD_SELECT lbAdd "Loadouts";

private _variableName = format ["WLM_savedLoadout_%1", typeOf _asset];
private _savedLoadouts = profileNamespace getVariable [_variableName, []];

{
    private _loadoutName = format ["Custom: Slot %1", _forEachIndex + 1];
    private _presetItem = _LOAD_SELECT lbAdd _loadoutName;
    _LOAD_SELECT lbSetData [_presetItem, ""];
} forEach _savedLoadouts;

{
    private _presetName = getText (_x >> "displayName");
    private _presetItem = _LOAD_SELECT lbAdd format ["Preset: %1", _presetName];
    _LOAD_SELECT lbSetData [_presetItem, configName _x];
} forEach _presets;

_LOAD_SELECT ctrlAddEventHandler ["LBSelChanged", "_this call WLM_fnc_selectLoadout"];
_LOAD_SELECT lbSetCurSel 0;
