#include "constants.inc"

params ["_data", "_side", "_lastLoadout"];

private _playerFunds = (missionNamespace getVariable "fundsDatabaseClients") get (getPlayerUID player);

private _totalCost = 0;
{
    private _type = _x;
    if !(_x in ["Uniform", "Vest", "Helmet", "Primary", "Secondary", "Launcher"]) then {
        continue;
    };

    private _customizationData = _y;

    private _customizationMap = missionNamespace getVariable [format ["WLC_%1_%2", _type, _side], createHashMap];
    private _customization = _customizationMap getOrDefault [_customizationData, createHashMap];

    private _item = _customization getOrDefault ["item", ""];

    private _loadoutMains = [];
    {
        _loadoutMains pushBack (_lastLoadout # _x # 0);
    } forEach [0, 1, 2, 3, 4];
    _loadoutMains pushBack (_lastLoadout # 6);

    private _cost = if (_item in _loadoutMains) then {
        0;
    } else {
        _customization getOrDefault ["cost", 0];
    };
    private _level = _customization getOrDefault ["level", 0];
    private _playerLevel = ["getLevel"] call WLC_fnc_getLevelInfo;

    private _custom = +_customization;
    if (_type in ["Primary", "Secondary", "Launcher"]) then {
        private _attachment = _data getOrDefault [_type + "Attachment", ""];
        private _variants = _custom getOrDefault ["variants", createHashMap];
        private _variant = _variants getOrDefault [_attachment, createHashMap];
        private _attachments = _custom getOrDefault ["attachments", []];
        _attachments append (_variant getOrDefault ["attachments", []]);
        _custom set ["attachments", _attachments];
        _cost = _cost + (_variant getOrDefault ["cost", 0]);

        private _ammo = _data getOrDefault [_type + "Ammo", ""];
        private _loadouts = _custom getOrDefault ["loadouts", createHashMap];
        private _loadout = _loadouts getOrDefault [_ammo, createHashMap];
        private _magazines = _custom getOrDefault ["magazines", []];
        _magazines append (_loadout getOrDefault ["magazines", []]);
        _custom set ["magazines", _magazines];

        private _loadoutCost = _loadout getOrDefault ["cost", 0];
        if (_loadoutCost > 0 && count _magazines > 0) then {
            private _lastMagazines = [];
            if (count (_lastLoadout # 1) >= 5) then {
                private _launcherAmmo = _lastLoadout # 1 # 4;
                if (count _launcherAmmo > 0) then {
                    _lastMagazines pushBack (_launcherAmmo # 0)
                };
            };
            {
                private _storage = _lastLoadout # _x;
                if (count _storage < 2) then {
                    continue;
                };
                {
                    private _item = _x # 0;
                    private _amount = _x # 1;
                    for "_i" from 1 to _amount do {
                        _lastMagazines pushBack _item;
                    };
                } forEach (_storage # 1);
            } forEach [3, 4, 5];

            private _addMagazines = [];
            private _magazinesToAdd = +_magazines;
            {
                private _magazine = _x;
                private _findIndex = _lastMagazines findIf {
                    _x == _magazine
                };
                if (_findIndex == -1) then {
                    _addMagazines pushBack _magazine;
                } else {
                    _lastMagazines deleteAt _findIndex;
                };
            } forEach _magazinesToAdd;
            private _addedMagazines = count _addMagazines / count _magazines;
            _loadoutCost = round (_loadoutCost * _addedMagazines);
        };

        _cost = _cost + _loadoutCost;
        _level = _level max (_loadout getOrDefault ["level", 0]);
    };

    if (_level <= _playerLevel && _cost >= 0 && _playerFunds >= _cost && _item != "") then {
        [player, "equip", _cost] remoteExec ["WL2_fnc_handleClientRequest", 2];
        _totalCost = _totalCost + _cost;
        [_type, _custom, _cost] call WLC_fnc_clientEquip;
    };
} forEach _data;

private _message = if (_totalCost > 0) then {
    private _moneySign = [_side] call WL2_fnc_getMoneySign;
    format ["Equipment and customizations applied for %1%2.", _moneySign, _totalCost];
} else {
     "Equipment and customizations applied for free.";
};
systemChat _message;