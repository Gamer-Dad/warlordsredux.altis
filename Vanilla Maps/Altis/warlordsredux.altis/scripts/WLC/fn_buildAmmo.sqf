#include "constants.inc"

params ["_control", "_lbCurSel"];

private _display = findDisplay WLC_DISPLAY;
private _magDisplay = _display displayCtrl WLC_MAGAZINE_DISPLAY;

{
    ctrlDelete _x;
} forEach (allControls _magDisplay);

private _selector = uiNamespace getVariable "WLC_selectedControl";
private _item = uiNamespace getVariable "WLC_selectedItem";
private _itemData = _selector lbData _item;

private _selectedType = uiNamespace getVariable "WLC_selectedType";

private _customizationList = missionNamespace getVariable [format ["WLC_%1_%2", _selectedType, BIS_WL_playerSide], createHashMap];
private _customization = _customizationList getOrDefault [_itemData, createHashMap];

private _magazines = _customization getOrDefault ["magazines", []];
private _loadouts = _customization getOrDefault ["loadouts", createHashMap];

private _selection = _control lbData _lbCurSel;
private _currentLoadout = _loadouts getOrDefault [_selection, createHashMap];
private _currentLoadoutMags = _currentLoadout getOrDefault ["magazines", []];

{
    private _row = floor (_forEachIndex / 7);
    private _col = _forEachIndex % 7;
    private _itemPosition = [_col * (0.05 + 0.01), _row * (0.05 + 0.03), 0.05, 0.05 * 4 / 3];

    private _magPicBg = _display ctrlCreate ["WLCAttachmentPicBg", -1, _magDisplay];
    _magPicBg ctrlSetPosition _itemPosition;
    _magPicBg ctrlSetText "";
    _magPicBg ctrlCommit 0;

    private _magPic = _display ctrlCreate ["WLCAttachmentPic", -1, _magDisplay];
    _magPic ctrlSetPosition _itemPosition;
    _magPic ctrlSetText (getText (configFile >> "CfgMagazines" >> _x >> "picture"));
    _magPic ctrlSetTooltip ([_x] call WLM_fnc_getMagazineTooltip);
    _magPic ctrlCommit 0;
} forEach (_currentLoadoutMags + _magazines);

private _requiredLevel = (_customization getOrDefault ["level", 0]) max (_currentLoadout getOrDefault ["level", 0]);
private _playerLevel = ["getLevel"] call WLC_fnc_getLevelInfo;
if (_requiredLevel <= _playerLevel) then {
    profileNamespace setVariable [format ["WLC_%1_Ammo", _selectedType], _selection];
} else {
    playSoundUI ["AddItemFailed"];
};

private _cost = (_customization getOrDefault ["cost", 0]) + (_currentLoadout getOrDefault ["cost", 0]);
[_cost, _requiredLevel] call WLC_fnc_updateItemCost;