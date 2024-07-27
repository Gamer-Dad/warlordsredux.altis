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

    private _pylonUserCtrl = _DISPLAY displayCtrl (_PYLON_USER_IDC_START + _forEachIndex);
    private _userIsPilot = ctrlTooltip _pylonUserCtrl == "Control: Pilot";
    private _turret = if (_userIsPilot) then {
        []
    } else {
        [0]
    };

    private _attachment = _pylonCtrl lbData _currentSelection;
    _attachments pushBack [_attachment, _turret];
} forEach _pylonsInfo;

_asset setVehicleReceiveRemoteTargets true;
_asset setVehicleReportRemoteTargets true;
_asset setVehicleReportOwnPosition true;

[_asset, _attachments] remoteExec ["WLM_fnc_serverPylonManager", 2];

[_attachments, _asset] spawn {
    params ["_attachments", "_asset"];
    {
        private _successSound = selectRandom ['FD_Target_PopDown_Large_F','FD_Target_PopDown_Small_F','FD_Target_PopUp_Small_F'];
        private _soundPath = getArray (configfile >> "CfgSounds" >> _successSound >> "sound");
        playSound3D [_soundPath # 0, _asset, false, getPosASL _asset, random [1.8,2.0,2.2], random [1.8,2.0,2.2], 180];
        sleep 0.1;
    } forEach _attachments;
};