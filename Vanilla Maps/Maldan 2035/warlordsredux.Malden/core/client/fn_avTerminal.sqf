if (!hasInterface) exitWith {};

while { !BIS_WL_missionEnd } do {
    waitUntil {
        sleep 0.001;
        !isNull findDisplay 160
    };

    while { !isNull findDisplay 160 } do {
        private _selectBox = findDisplay 160 displayCtrl 117;

        waitUntil { lbSize _selectBox != 0 || isNull findDisplay 160 };

        private _size = lbSize _selectBox;
        private _changes = false;

        private _allPlayers = call BIS_fnc_listPlayers;

        for "_i" from 1 to (_size - 1) do {
            private _text = ((_selectBox lbText _i) splitString ",") # 0;
            // private _data = _text splitString "#";
            private _assetGroups = (allGroups select { groupID _x == _text });
            if (count _assetGroups == 0) then { continue; };

            private _assetGroup = _assetGroups # 0;

            private _owner = _assetGroup getVariable ["WL2_assetOwner", objNull];
            if (isNull _owner) then { continue; };
            _changes = true;

            private _ownerName = name _owner;
            private _assetType = _assetGroup getVariable ["WL2_assetTypeName", ""];

            _selectBox lbSetText [_i, format ["[%1] %2", _ownerName, _assetType]];

            if (_ownerName == name player) then {
                _selectBox lbSetColor [_i, [0, 1, 0, 1]];
            } else {
                private _player = _allPlayers select { _x = _owner } select 0;
                private _isInMySquad = ["isInMySquad", [getPlayerID _owner]] call SQD_fnc_client;

                if (_isInMySquad) then {
                    _selectBox lbSetColor [_i, [0, 1, 1, 1]];
                };
            };
        };

        if (_changes) then {
            lbSort _selectBox;
        };

        sleep 0.001;
    };
};