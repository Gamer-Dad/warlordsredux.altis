params ["_modalTitle", "_modalText", "_confirmText", "_cancelText", ["_confirmTooltip", ""], ["_cancelTooltip", ""]];

private _confirmDialog = createDialog ["WL_Prompt_Dialog", true];

private _titleControl = _confirmDialog displayCtrl 5702;
_titleControl ctrlSetText _modalTitle;

private _textControl = _confirmDialog displayCtrl 5706;
_textControl ctrlSetStructuredText parsetext _modalText;

private _confirmButtonControl = _confirmDialog displayCtrl 5704;
private _cancelButtonContrl = _confirmDialog displayCtrl 5705;

_confirmButtonControl ctrlSetText _confirmText;
_confirmButtonControl ctrlSetTooltip _confirmTooltip;

_cancelButtonContrl ctrlSetText _cancelText;
_cancelButtonContrl ctrlSetTooltip _cancelTooltip;

_cancelButtonContrl ctrlAddEventHandler ["ButtonClick", {
    params ["_control"];
    private _parentDisplay = ctrlParent _control;
    _parentDisplay closeDisplay 1;
}];

_confirmButtonControl ctrlAddEventHandler ["ButtonClick", {
    params ["_control"];
    private _parentDisplay = ctrlParent _control;
    uiNamespace setVariable ["WL_DialogResult", true];
    _parentDisplay closeDisplay 1;
}];

waitUntil {
    sleep 0.1;
    isNull _confirmDialog;
};

private _returnValue = uiNamespace getVariable ["WL_DialogResult", false];
uiNamespace setVariable ["WL_DialogResult", false];
_returnValue;