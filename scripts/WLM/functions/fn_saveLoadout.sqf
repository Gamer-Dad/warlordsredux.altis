params ["_control"];

private _asset = uiNamespace getVariable "WLM_asset";
private _pylonConfig = configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent";
private _pylonsInfo = configProperties [_pylonConfig >> "pylons"];
private _DISPLAY = findDisplay 5300;

private _PYLON_IDC_START = 5501;
private _PYLON_USER_IDC_START = 5601;

private _attachments = [];
{
    private _pylonCtrl = _DISPLAY displayCtrl (_PYLON_IDC_START + _forEachIndex);
    private _currentSelection = lbCurSel _pylonCtrl;
    private _attachment = _pylonCtrl lbData _currentSelection;

    private _pylonUserCtrl = _DISPLAY displayCtrl (_PYLON_USER_IDC_START + _forEachIndex);
    private _userIsPilot = ctrlTooltip _pylonUserCtrl == "Control: Pilot";
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