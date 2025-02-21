#include "constants.inc"

params ["_control", "_lbCurSel", "_type"];

private _display = findDisplay WLC_DISPLAY;
if (isNull _display) exitWith {};

uiNamespace setVariable ["WLC_selectedType", _type];
uiNamespace setVariable ["WLC_selectedControl", _control];
uiNamespace setVariable ["WLC_selectedItem", _lbCurSel];

private _fullDisplayBg = _display displayCtrl WLC_FULL_DISPLAY_BG;
private _weaponDisplayBg = _display displayCtrl WLC_WEAPON_DISPLAY_BG;
private _weaponDisplayTooltip = _display displayCtrl WLC_WEAPON_DISPLAY_TOOLTIP_HELPER;

private _weaponDisplay = _display displayCtrl WLC_WEAPON_DISPLAY;
private _fullDisplay = _display displayCtrl WLC_FULL_DISPLAY;
private _attachmentDisplay = _display displayCtrl WLC_ATTACHMENT_DISPLAY;
private _magDisplay = _display displayCtrl WLC_MAGAZINE_DISPLAY;
private _itemCostDisplay = _display displayCtrl WLC_COST_DISPLAY;
private _massDisplay = _display displayCtrl WLC_MASS_DISPLAY;

private _variantDisplay = _display displayCtrl WLC_WEAPON_ATTACHMENT_SELECT;
private _loadoutDisplay = _display displayCtrl WLC_MAGAZINE_SELECT;

{
    ctrlDelete _x;
} forEach (allControls _attachmentDisplay);
{
    ctrlDelete _x;
} forEach (allControls _magDisplay);

_fullDisplayBg ctrlShow false;
_fullDisplay ctrlShow false;
_massDisplay ctrlShow false;
_weaponDisplayBg ctrlShow false;
_weaponDisplay ctrlShow false;
_weaponDisplayTooltip ctrlShow false;
_attachmentDisplay ctrlShow false;
_magDisplay ctrlShow false;
_variantDisplay ctrlShow false;
_loadoutDisplay ctrlShow false;

_variantDisplay ctrlRemoveAllEventHandlers "LBSelChanged";
_loadoutDisplay ctrlRemoveAllEventHandlers "LBSelChanged";

if (_lbCurSel <= 0) exitWith {
    profileNamespace setVariable [format ["WLC_%1", _type], ""];
};

private _getItemTooltip = {
    params ["_item"];
    private _itemName = [_item] call WLM_fnc_getMagazineTooltip;

    private _protections = "true" configClasses (configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "HitpointsProtectionInfo");
    private _protectionArr = _protections apply {
        private _protectionName = configName _x;
        private _protectionArmor = getNumber (_x >> "armor");
        private _protectionPassThrough = getNumber (_x >> "passThrough");
        format ["[%1]\nArmor: %2\nPassthrough: %3", _protectionName, _protectionArmor, _protectionPassThrough];
    };
    private _protectionText = _protectionArr joinString "\n\n";

    if (_protectionText == "") then {
        _itemName;
    } else {
        format ["%1\n\n%2", _itemName, _protectionText];
    };
};
private _customizationData = _control lbData _lbCurSel;
private _selectedValue = _control lbValue _lbCurSel;
private _playerLevel = ["getLevel"] call WLC_fnc_getLevelInfo;
if (_selectedValue <= _playerLevel) then {
    profileNamespace setVariable [format ["WLC_%1", _type], _customizationData];
};

private _customizationList = missionNamespace getVariable [format ["WLC_%1_%2", _type, BIS_WL_playerSide], createHashMap];
private _customization = _customizationList getOrDefault [_customizationData, createHashMap];
private _actualClass = _customization getOrDefault ["item", _customizationData];

private _level = _customization getOrDefault ["level", 0];
private _cost = _customization getOrDefault ["cost", 0];
[_cost, _level] call WLC_fnc_updateItemCost;
private _moneySign = [BIS_WL_playerSide] call WL2_fnc_getMoneySign;

if (_type in ["Primary", "Secondary", "Launcher"]) then {
    _weaponDisplayBg ctrlShow true;

    _weaponDisplay ctrlShow true;
    _weaponDisplay ctrlSetText (getText (configFile >> "CfgWeapons" >> _actualClass >> "picture"));

    _weaponDisplayTooltip ctrlShow true;
    _weaponDisplayTooltip ctrlSetTooltip ([_actualClass] call WLM_fnc_getMagazineTooltip);

    lbClear _variantDisplay;
    private _selectedVariant = profileNamespace getVariable [format ["WLC_%1_Attach", _type], ""];
    private _variantIndex = -1;
    private _variants = _customization getOrDefault ["variants", createHashMap];

    private _variantsSorted = [_variants toArray false, [], {
        (_x # 1) getOrDefault ["cost", 0];
    }] call BIS_fnc_sortBy;
    {
        private _variant = _x # 0;
        private _variantEntry = _x # 1;
        private _variantName = _variantEntry getOrDefault ["name", ""];
        private _variantAttachments = _variantEntry getOrDefault ["attachments", []];
        private _index = _variantDisplay lbAdd _variantName;
        _variantDisplay lbSetData [_index, _variant];

        if (_variant == _selectedVariant) then {
            _variantIndex = _index;
        };
    } forEach _variantsSorted;
    _variantDisplay ctrlAddEventHandler ["LBSelChanged", "_this call WLC_fnc_buildAttachments"];
    _variantDisplay lbSetCurSel _variantIndex;
    _variantDisplay ctrlShow (count _variants > 0);
    _attachmentDisplay ctrlShow true;

    _loadoutDisplay ctrlShow true;
    lbClear _loadoutDisplay;

    private _selectedLoadout = profileNamespace getVariable [format ["WLC_%1_Ammo", _type], ""];
    private _loadoutIndex = 0;
    private _loadouts = _customization getOrDefault ["loadouts", createHashMap];

    private _loadoutSorted = [_loadouts toArray false, [], {
        private _item = _x # 1;
        private _cost = _item getOrDefault ["cost", 0];
        private _level = _item getOrDefault ["level", 0];
        _level * 100 + _cost;
    }] call BIS_fnc_sortBy;
    {
        private _loadout = _x # 0;
        private _loadoutEntry = _x # 1;
        private _loadoutName = _loadoutEntry getOrDefault ["name", ""];
        private _loadoutMags = _loadoutEntry getOrDefault ["magazines", []];
        private _loadoutCost = _loadoutEntry getOrDefault ["cost", 0];
        private _loadoutLevel = _loadoutEntry getOrDefault ["level", 0];

        private _displayName = if (_loadoutCost > 0) then {
            format ["%1 [%2%3]", _loadoutName, _moneySign, _loadoutCost];
        } else {
            _loadoutName;
        };

        private _index = _loadoutDisplay lbAdd _displayName;
        _loadoutDisplay lbSetData [_index, _loadout];
        _loadoutDisplay lbSetValue [_index, _loadoutCost];

        if (_loadoutLevel > _playerLevel) then {
            _loadoutDisplay lbSetColor [_index, [1, 0, 0, 1]];
            _loadoutDisplay lbSetText [_index, format ["(Lvl %1) %2", _loadoutLevel, _displayName]];
        };

        if (_loadout == _selectedLoadout) then {
            _loadoutIndex = _index;
        };
    } forEach _loadoutSorted;
    _loadoutDisplay ctrlAddEventHandler ["LBSelChanged", "_this call WLC_fnc_buildAmmo"];
    _loadoutDisplay lbSetCurSel _loadoutIndex;
    _magDisplay ctrlShow true;
};

if (_type in ["Uniform", "Vest", "Helmet"]) then {
    _fullDisplayBg ctrlShow true;
    _fullDisplay ctrlShow true;

    _fullDisplay ctrlSetText (getText (configFile >> "CfgWeapons" >> _actualClass >> "picture"));
    _fullDisplay ctrlSetTooltip ([_actualClass] call _getItemTooltip);

    _massDisplay ctrlShow true;
    private _mass = getNumber (configFile >> "CfgWeapons" >> _actualClass >> "ItemInfo" >> "mass");
    _massDisplay ctrlSetStructuredText parseText format ["<t size='1.2'>Mass: %1 kg</t>", _mass];
};