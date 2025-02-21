#include "constants.inc"

params ["_type", "_data", "_cost"];

private _item = _data getOrDefault ["item", ""];
private _magazines = _data getOrDefault ["magazines", []];
private _attachments = _data getOrDefault ["attachments", []];

private _checkForSpace = {
    params ["_toAdd"];
    private _backpacks = if (BIS_WL_playerSide == west) then {
        [
            "B_AssaultPack_mcamo",
            "B_FieldPack_cbr",
            "B_TacticalPack_mcamo",
            "B_Kitbag_mcamo",
            "B_Carryall_mcamo",
            "B_Bergen_mcamo_F"
        ];
    } else {
        [
            "B_AssaultPack_ocamo",
            "B_FieldPack_ocamo",
            "B_TacticalPack_ocamo",
            "B_Kitbag_tan",
            "B_Carryall_ocamo",
            "B_Bergen_hex_F"
        ];
    };

    private _index = 0;

    while { (_index < count _backpacks) && !(player canAdd _toAdd) } do {
        private _backpack = _backpacks # _index;

        private _currentBackpackLoad = getContainerMaxLoad backpack player;
        private _newBackpackLoad = getContainerMaxLoad _backpack;

        if (_currentBackpackLoad < _newBackpackLoad) then {
            private _backpackItems = backpackItems player;
            removeBackpack player;
            player addBackpack _backpack;
            {
                player addItemToBackpack _x;
            } forEach _backpackItems;
        };

        _index = _index + 1;
    };
};

switch (_type) do {
    case "Uniform": {
        private _uniformItems = uniformItems player;
        removeUniform player;
        player forceAddUniform _item;
        {
            [_x] call _checkForSpace;
            player addItem _x;
        } forEach _uniformItems;
    };
    case "Vest": {
        private _vestItems = vestItems player;
        removeVest player;
        player addVest _item;
        {
            [_x] call _checkForSpace;
            player addItem _x;
        } forEach _vestItems;
    };
    case "Helmet": {
        removeHeadgear player;
        player addHeadgear _item;
    };
    case "Primary": {
        private _oldMagazines = compatibleMagazines (primaryWeapon player);
        {
            player removeMagazines _x;
        } forEach _oldMagazines;
        player removeWeapon (primaryWeapon player);

        {
            [_x] call _checkForSpace;
            player addMagazine _x;
        } forEach _magazines;

        player addWeapon _item;
        player selectWeapon _item;

        {
            player addPrimaryWeaponItem _x;
        } forEach _attachments;
    };
    case "Secondary": {
        private _oldMagazines = compatibleMagazines (handgunWeapon player);
        {
            player removeMagazines _x;
        } forEach _oldMagazines;

        player removeWeapon (handgunWeapon player);

        if (_item != "none") then {
            {
                [_x] call _checkForSpace;
                player addMagazine _x;
            } forEach _magazines;

            player addWeapon _item;

            {
                player addHandgunItem _x;
            } forEach _attachments;
        };
    };
    case "Launcher": {
        private _oldMagazines = compatibleMagazines (secondaryWeapon player);
        {
            player removeMagazines _x;
        } forEach _oldMagazines;

        player removeWeapon (secondaryWeapon player);

        if (count _magazines > 0) then {
            private _firstMag = _magazines # 0;
            [_firstMag] call _checkForSpace;
            player addMagazine _firstMag;
            player addWeapon _item;

            _magazines deleteAt 0;
            {
                [_x] call _checkForSpace;
                player addMagazine _x;
            } forEach _magazines;
        };
    };
    default {};
};

private _backpackItems = backpackItems player;
if (count _backpackItems == 0) then {
    removeBackpack player;
};