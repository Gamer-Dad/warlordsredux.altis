#include "..\WLM_constants.inc";

params ["_control"];

private _asset = uiNamespace getVariable "WLM_asset";
private _pylonConfig = configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent";
private _pylonsInfo = configProperties [_pylonConfig >> "pylons"];
private _display = findDisplay WLM_DISPLAY;

private _attachments = [];
{
    private _pylonControl = _display displayCtrl (WLM_PYLON_START + _forEachIndex);
    private _currentSelection = lbCurSel _pylonControl;
    private _attachment = _pylonControl lbData _currentSelection;

    private _pylonUserControl = _display displayCtrl (WLM_PYLON_USER_START + _forEachIndex);
    private _userIsPilot = ctrlTooltip _pylonUserControl == "Control: Pilot";
    private _turret = if (_userIsPilot) then {
        []
    } else {
        [0]
    };

    _attachments pushBack [_attachment, _turret];
} forEach _pylonsInfo;

private _variableName = format ["WLM_savedLoadout_%1", typeOf _asset];
private _loadoutSave = profileNamespace getVariable [_variableName, []];
_loadoutSave pushBack _attachments;
profileNamespace setVariable [_variableName, _loadoutSave];