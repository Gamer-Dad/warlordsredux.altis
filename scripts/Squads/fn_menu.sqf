/*
    Author: Rook
    Description: Opens the squad menu.
*/

#include "squad_constants.inc"
params ["_firstStart"];

if (_firstStart && isNull (findDisplay MENU)) then {
    createDialog "SquadsMenu";
};

disableSerialization;

0 spawn {
    private _selectedSquad = [-1];
    private _selectedPlayer = -1;

    private _squadManager = missionNamespace getVariable ["SQUAD_MANAGER", []];
    private _getSquadlist = {
        _squadListUnordered = _squadManager select { 
            private _squad = _x;
            private _isNotEmpty = count (_squad select 2) > 0;
            private _isSameSide =  _squad select 3 == side player;
            _isNotEmpty && _isSameSide;
        };

        _mySquad = _squadListUnordered select {(_x select 2) find (getPlayerID player) > -1};
        _mySquad + (_squadListUnordered - _mySquad);
    };

    private _squadList = call _getSquadlist;
    private _squaddedPlayers = [];

    private _treeEntries = createHashMap;
    private _listEntries = createHashMap;

    private _constructSquadTree = {
        tvClear TREE;
        _treeEntries = createHashMap;

        {
            private _squad = _x;
            private _squadItem = tvAdd [TREE, [], _squad select 0];
            tvSetData [TREE, [_squadItem], format ["%1", _forEachIndex]];
            tvSetTooltip [TREE, [_squadItem], format [localize "STR_SQUADS_squadLeaderTooltip", name (allPlayers select {getPlayerID _x == (_squad select 1)} select 0)]];

            {
                private _playerId = _x;
                private _player = allPlayers select {getPlayerID _x == _playerId} select 0;
                if (isNil "_player") exitWith {};
                private _playerName = name _player;

                if (_playerId == (_squad select 1)) then {
                    _playerName = format ["%1 (SL)", _playerName];
                };

                private _playerItem = tvAdd [TREE, [_squadItem], _playerName];
                tvSetData [TREE, [_squadItem, _playerItem], format ["%1", _playerId]];

                _points = WL_PlayerSquadContribution getOrDefault [_playerId, 0];
                tvSetTooltip [TREE, [_squadItem, _playerItem], format [localize "STR_SQUADS_squadMemberTooltip", _playerName, _points]];

                _tvColor = if (_playerId == (getPlayerID player)) then { [0.4, 0.6, 1.0, 1] } else { [1, 1, 1, 1] };

                private _treeControl = displayCtrl TREE;
                _treeControl tvSetColor [[_squadItem, _playerItem], _tvColor];
                _treeControl tvSetSelectColor [[_squadItem, _playerItem], _tvColor];
                _treeControl tvSetColor [[_squadItem], _tvColor];
                _treeControl tvSetSelectColor [[_squadItem], _tvColor];

                _treeEntries set [format ["%1", _playerId], [_squadItem, _playerItem]];
            } forEach (_squad select 2);

            _squaddedPlayers append (_x select 2);
        } forEach (_squadList);

        tvExpandAll TREE;
        tvSetCurSel [TREE, _selectedSquad];

        private _treeDisplay = displayCtrl TREE;
        _treeDisplay ctrlAddEventHandler ["TreeSelChanged", "_this call SQD_fnc_treeSelectionChanged"];
    };

    private _constructPlayerList = {
        lbClear PLAYER_LIST;
        _listEntries = createHashMap;

        private _unsquaddedPlayers = allPlayers select {!(getPlayerID _x in _squaddedPlayers) && side _x == side player && _x != player};
        {
            private _player = _x;
            private _playerName = name _player;

            private _playerItem = lbAdd [PLAYER_LIST, _playerName];
            lbSetData [PLAYER_LIST, _playerItem, format ["%1", getPlayerID _player]];

            _points = WL_PlayerSquadContribution getOrDefault [getPlayerID _player, 0];
            lbSetTooltip [PLAYER_LIST, _playerItem, format [localize "STR_SQUADS_squadMemberTooltip", _playerName, _points]];

            _listEntries set [format ["%1", getPlayerID _player], _playerItem];
        } forEach _unsquaddedPlayers;

        lbSetCurSel [PLAYER_LIST, _selectedPlayer];

        private _squadListDisplay = displayCtrl PLAYER_LIST;
        _squadListDisplay ctrlAddEventHandler ["LBSelChanged", "_this call SQD_fnc_playerSelectionChanged"];
    };

    private _constructButtons = {
        private _mySquad = _squadList select {(_x select 2) find (getPlayerID player) > -1} select 0;
        if (isNil "_mySquad") then {
            ctrlShow [CREATE_BUTTON, true];
            ctrlShow [LEAVE_BUTTON, false];
            ctrlShow [RENAME_BUTTON, false];
        } else {
            ctrlShow [CREATE_BUTTON, false];
            ctrlShow [LEAVE_BUTTON, true];

            private _isSquadLeader = (getPlayerID player) == (_mySquad select 1);
            if (_isSquadLeader) then {
                ctrlShow [RENAME_BUTTON, true];
            } else {
                ctrlShow [RENAME_BUTTON, false];
            };
        };

        ctrlShow [PROMOTE_BUTTON, false];
        ctrlShow [KICK_BUTTON, false];
    };

    private _updatePictures = {
        params ["_treeEntries", "_listEntries"];

        private _getPictureForPlayerId = {
            params ["_playerId"];
            private _player = allPlayers select {getPlayerID _x == _playerId} select 0;

            if (isNil "_player") exitWith {
                ""
            };

            if (isNull (objectParent _player)) then {
                if (!alive _player) then {
                    "\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa";
                } else {
                    "\a3\ui_f\data\igui\cfg\simpletasks\types\rifle_ca.paa";
                };
            } else {
                private _vehicle = vehicle _player;
                getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "picture");
            };
        };

        {
            private _treePath = [_y select 0, _y select 1];
            private _playerId = _x;

            private _picture = [_playerId] call _getPictureForPlayerId;
            tvSetPicture [TREE, _treePath, _picture];

            private _points = WL_PlayerSquadContribution getOrDefault [_playerId, 0];
            tvSetTooltip [TREE, _treePath, format [localize "STR_SQUADS_squadMemberTooltip", name (allPlayers select {getPlayerID _x == _playerId} select 0), _points]];
        } forEach _treeEntries;

        {
            private _playerId = _x;
            
            private _picture = [_playerId] call _getPictureForPlayerId;
            lbSetPicture [PLAYER_LIST, _y, _picture];

            private _points = WL_PlayerSquadContribution getOrDefault [_playerId, 0];
            lbSetTooltip [PLAYER_LIST, _y, format [localize "STR_SQUADS_squadMemberTooltip", name (allPlayers select {getPlayerID _x == _playerId} select 0), _points]];
        } forEach _listEntries;
    };

    call _constructSquadTree;
    call _constructPlayerList;
    call _constructButtons;
    [_treeEntries, _listEntries] spawn _updatePictures;
    
    private _dirtySquadManager = {
        scopeName "checkFunction";
        params ["_oldSquadManager", "_newSquadManager"];
        
        // check if the sizes are the same
        if (count _oldSquadManager != count _newSquadManager) then {
            true breakOut "checkFunction";
        };

        {
            private _oldSquad = _x;
            private _newSquad = _newSquadManager select _forEachIndex;

            // check names
            if (_oldSquad select 0 != _newSquad select 0) then {
                true breakOut "checkFunction";
            };

            // check if the squad leader is the same
            if (_oldSquad select 1 != _newSquad select 1) then {
                true breakOut "checkFunction";
            };

            // check if the number of squad members are the same
            if (count (_oldSquad select 2) != count (_newSquad select 2)) then {
                true breakOut "checkFunction";
            };

            {
                private _oldSquadMember = _x;
                private _newSquadMember = (_newSquad select 2) select _forEachIndex;

                // check if the squad member is the same
                if (_oldSquadMember != _newSquadMember) then {
                    true breakOut "checkFunction";
                };
            } forEach (_oldSquad select 2);
        } forEach _oldSquadManager;

        false;
    };

    private _updateLoop = 0;
    while { !(isNull (findDisplay 5000)) } do {
        _oldSquadManager = +_squadManager;

        sleep 0.5;

        _selectedSquad = tvCurSel TREE;
        _selectedPlayer = lbCurSel PLAYER_LIST;

        _newSquadManager = missionNamespace getVariable ["SQUAD_MANAGER", []];

        // only update if the squad manager has changed
        // or else the updates would change UI settings
        private _dirty = [_oldSquadManager, _newSquadManager] call _dirtySquadManager;
        if (_dirty) then {
            _squadManager = _newSquadManager;
            _squadList = call _getSquadlist;
            _squaddedPlayers = [];

            call _constructSquadTree;
            call _constructPlayerList;
            call _constructButtons;

            [_treeEntries, _listEntries] spawn _updatePictures;
        };

        if (_updateLoop > 5) then {
            _updateLoop = 0;
            [_treeEntries, _listEntries] spawn _updatePictures;
        } else {
            _updateLoop = _updateLoop + 1;
        };
    };
};