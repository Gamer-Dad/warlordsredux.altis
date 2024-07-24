#include "..\WLM_constants.inc";

private _asset = uiNamespace getVariable "WLM_asset";
private _pylonConfig = configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent";
private _pylonsInfo = configProperties [_pylonConfig >> "pylons"];
private _display = findDisplay WLM_DISPLAY;

private _loadSelectControl = _display displayCtrl WLM_LOAD_SELECT;
lbClear _loadSelectControl;

private _presets = configProperties [_pylonConfig >> "Presets"];
_loadSelectControl lbAdd "Loadouts";

private _variableName = format ["WLM_savedLoadout_%1", typeOf _asset];
private _savedLoadouts = profileNamespace getVariable [_variableName, []];

{
    private _loadoutName = format ["Custom: Slot %1", _forEachIndex + 1];
    private _presetItem = _loadSelectControl lbAdd _loadoutName;
    _loadSelectControl lbSetData [_presetItem, ""];
} forEach _savedLoadouts;

{
    private _presetName = getText (_x >> "displayName");
    private _presetItem = _loadSelectControl lbAdd format ["Preset: %1", _presetName];
    _loadSelectControl lbSetData [_presetItem, configName _x];
} forEach _presets;

_loadSelectControl ctrlAddEventHandler ["LBSelChanged", "_this call WLM_fnc_selectLoadout"];
_loadSelectControl lbSetCurSel 0;
