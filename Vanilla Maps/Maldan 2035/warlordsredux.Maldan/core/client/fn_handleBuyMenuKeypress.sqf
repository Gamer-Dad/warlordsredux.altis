#include "..\warlords_constants.inc"
#include "\a3\ui_f\hpp\definedikcodes.inc"

params ["_key"];

private _tempBuyKey = actionKeys "User5";
_tempBuyKey pushBack DIK_NUMPADSLASH;
if (_key in _tempBuyKey) exitWith {
    WL_TEMP_BUY_MENU = true;
    hint "Entering buy code...";
    ["TaskQuickBuyShortcut"] call WLT_fnc_taskComplete;
};

if (!WL_GEAR_BUY_MENU && !WL_TEMP_BUY_MENU) exitWith {
    false;
};

if (_key == DIK_BACKSPACE) exitWith {
    WL_TEMP_BUY_MENU = faLse;
    uiNamespace setVariable ["WL_BuyMenuCode", ""];
    hint "";
    true;
};

if (_key in actionKeys "Gear" && !BIS_WL_gearKeyPressed) exitWith {
    if (!WL_GEAR_BUY_MENU && WL_TEMP_BUY_MENU) then {   // cancel buy code with menu
        WL_TEMP_BUY_MENU = false;
        uiNamespace setVariable ["WL_BuyMenuCode", ""];
        hint "";
        false;
    } else {
        "RequestMenu_close" call WL2_fnc_setupUI;
        true;
    };
};

private _zeusKey = actionKeys "curatorInterface";
private _viewKey = actionKeys "tacticalView";
private _adminKeyPressed = _key in _viewKey || _key in _zeusKey;
private _isAdmin = (getPlayerUID player) in (getArray (missionConfigFile >> "adminIDs"));
if (_adminKeyPressed && !_isAdmin) exitWith {
    true;
};

private _display = uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull];
private _purchase_transfer_amount = _display displayCtrl 117;
if (ctrlEnabled _purchase_transfer_amount) exitWith {
    false;
};

private _isNumberKey = true;
private _existingCode = uiNamespace getVariable ["WL_BuyMenuCode", ""];
private _addToCode = switch (_key) do {
    case DIK_NUMPAD0;
    case DIK_0: {"0"};
    case DIK_NUMPAD1;
    case DIK_1: {"1"};
    case DIK_NUMPAD2;
    case DIK_2: {"2"};
    case DIK_NUMPAD3;
    case DIK_3: {"3"};
    case DIK_NUMPAD4;
    case DIK_4: {"4"};
    case DIK_NUMPAD5;
    case DIK_5: {"5"};
    case DIK_NUMPAD6;
    case DIK_6: {"6"};
    case DIK_NUMPAD7;
    case DIK_7: {"7"};
    case DIK_NUMPAD8;
    case DIK_8: {"8"};
    case DIK_NUMPAD9;
    case DIK_9: {"9"};
    default {
        _isNumberKey = false;
        ""
    };
};

if (!_isNumberKey) exitWith {
    false
};

private _newCode = _existingCode + _addToCode;
uiNamespace setVariable ["WL_BuyMenuCode", _newCode];
hintSilent format ["Code: %1", _newCode];

// process code
private _categoryCode = 0;
private _categoryDone = false;
private _itemCode = 0;
private _itemDone = false;
private _codeArray = _newCode splitString "";
{
    if (_itemDone) then {
        break;
    };
    if (!_categoryDone) then {
        if (_x == "0") then {
            _categoryCode = _categoryCode + 9;
        } else {
            _categoryCode = _categoryCode + parseNumber _x;
            _categoryDone = true;
        };
    } else {
        if (_x == "0") then {
            _itemCode = _itemCode + 9;
        } else {
            _itemCode = _itemCode + parseNumber _x;
            _itemDone = true;
        };
    };
} forEach _codeArray;

_categoryCode = _categoryCode - 1;
_itemCode = _itemCode - 1;
if (_itemDone) then {
    hintSilent "";
    uiNamespace setVariable ["WL_BuyMenuCode", ""];
    WL_TEMP_BUY_MENU = false;

    private _selectedCategory = WL_PLAYER_REQUISITION_LIST # _categoryCode;

    if (_itemCode > (count _selectedCategory - 1)) exitWith {
        systemChat "Invalid buy code item.";
        playSound "AddItemFailed";
        WL_TEMP_BUY_MENU = false;
        true;
    };
    private _selectedItem = _selectedCategory # _itemCode;

    _selectedItem params [
        "_className",
        "_cost",
        "_requirements",
        "_displayName",
        "_picture",
        "_text",
        "_offset"
    ];

    private _tasksRequireUIList = ["FundsTransfer"];
    if (_className in _tasksRequireUIList) exitWith {
        systemChat format ["Invalid task requires UI: %1", _displayName];
        playSound "AddItemFailed";
    };

    private _categoryString = WL_REQUISITION_CATEGORIES # _categoryCode;
    if (isNil "_cost") then {
        _cost = 0;
    };
    private _assetDetails = [_className, _requirements, _displayName, _picture, _text, _offset, _cost, _categoryString];

    private _availability = _assetDetails call WL2_fnc_purchaseMenuAssetAvailability;
    if (_availability # 0) then {
        _assetDetails call WL2_fnc_triggerPurchase;
        systemChat format ["Selected [%1]: %2", _newCode, _displayName];
        playSound "AddItemOK";
        "RequestMenu_close" call WL2_fnc_setupUI;

        ["TaskQuickBuy"] call WLT_fnc_taskComplete;
    } else {
        systemChat format ["Invalid buy action: %1", (_availability # 1) joinString ", "];
        playSound "AddItemFailed";
    };
} else {
    if (_categoryDone) then {
        if (_categoryCode > (count WL_PLAYER_REQUISITION_LIST - 1)) exitWith {
            hintSilent "";
            uiNamespace setVariable ["WL_BuyMenuCode", ""];
            systemChat "Invalid buy code category.";
            playSound "AddItemFailed";
            WL_TEMP_BUY_MENU = false;
            true;
        };

        private _purchase_category = _display displayCtrl 100;
        _purchase_category lbSetCurSel _categoryCode;
    };
};

true;