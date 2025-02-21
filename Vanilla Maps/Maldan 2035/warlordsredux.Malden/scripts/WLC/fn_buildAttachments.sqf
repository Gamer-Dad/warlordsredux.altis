#include "constants.inc"

params ["_control", "_lbCurSel"];

private _display = findDisplay WLC_DISPLAY;
private _attachmentDisplay = _display displayCtrl WLC_ATTACHMENT_DISPLAY;

{
    ctrlDelete _x;
} forEach (allControls _attachmentDisplay);

private _selector = uiNamespace getVariable "WLC_selectedControl";
private _item = uiNamespace getVariable "WLC_selectedItem";
private _itemData = _selector lbData _item;

private _selectedType = uiNamespace getVariable "WLC_selectedType";

private _customizationList = missionNamespace getVariable [format ["WLC_%1_%2", _selectedType, BIS_WL_playerSide], createHashMap];
private _customization = _customizationList getOrDefault [_itemData, createHashMap];

private _attachments = _customization getOrDefault ["attachments", []];
private _variants = _customization getOrDefault ["variants", createHashMap];

private _selection = _control lbData _lbCurSel;
private _currentVariant = _variants getOrDefault [_selection, createHashMap];
private _currentVariantAttachments = _currentVariant getOrDefault ["attachments", []];

{
    private _itemPosition = [_forEachIndex * (0.07 + 0.01), 0, 0.07, 0.07 * 4 / 3];

    private _attachmentPicBg = _display ctrlCreate ["WLCAttachmentPicBg", -1, _attachmentDisplay];
    _attachmentPicBg ctrlSetPosition _itemPosition;
    _attachmentPicBg ctrlSetText "";
    _attachmentPicBg ctrlCommit 0;

    private _attachmentPic = _display ctrlCreate ["WLCAttachmentPic", -1, _attachmentDisplay];
    _attachmentPic ctrlSetPosition _itemPosition;
    _attachmentPic ctrlSetText (getText (configFile >> "CfgWeapons" >> _x >> "picture"));
    _attachmentPic ctrlSetTooltip ([_x] call WLM_fnc_getMagazineTooltip);
    _attachmentPic ctrlCommit 0;
} forEach (_currentVariantAttachments + _attachments);

profileNamespace setVariable [format ["WLC_%1_Attach", _selectedType], _selection];