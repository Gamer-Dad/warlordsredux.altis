params [
    "_action",
    "_params"
];

private _mySquadNumber = missionNamespace getVariable ["SQUAD_MANAGER", []] findIf {(_x select 2) find (getPlayerID player) > -1};
private _squadManager = missionNamespace getVariable ["SQUAD_MANAGER", []];

private _CREATE_BUTTON = 5014;
private _LEAVE_BUTTON = 5012;
private _PROMOTE_BUTTON = 5013;
private _KICK_BUTTON = 5015;
private _PLAYER_LIST = 5006;
private _TREE = 5005;

private _RENAME_EDIT = 5103;
private _RENAME_WINDOW = 5100;

_return = nil;

switch (_action) do {
    case "create": {
        private _squadName = format ["%1 SQUAD", toUpper (name player)];
        private _leader = getPlayerID player;
        private _side = side player;

        ctrlShow [_CREATE_BUTTON, false];
    
        ["create", [_squadName, _leader, _side]] remoteExec ["SQUADS_API", 2];
    };
    case "leave": {
        if (_mySquadNumber == -1) exitWith {
            _return = 1;
        };

        ctrlShow [_LEAVE_BUTTON, false];

        ["remove", [getPlayerID player]] remoteExec ["SQUADS_API", 2];
    };
    case "invite": {
        if (_mySquadNumber == -1) exitWith {
            _return = 1;
        };

        private _selection = lbCurSel _PLAYER_LIST;
        if (isNil "_selection") exitWith {
            _return = 1;
        };

        private _player = lbData [_PLAYER_LIST, _selection];
        private _inviter = getPlayerID player;

        ["invite", [_player, _inviter]] remoteExec ["SQUADS_API", 2];

        private _playerName = lbText [_PLAYER_LIST, _selection];
        systemChat format [localize "STR_SQUADS_sendInvitationSuccessText", _playerName];
    };
    case "invited": {
        // input: inviter id
        private _inviter = _params select 0;

        private _squad = _squadManager select { (_x select 2) find _inviter > -1 } select 0;
        if (isNil "_squad") exitWith {
            _return = 1;
        };
        private _inviterName = name (allPlayers select {getPlayerID _x == _inviter} select 0);

        _acceptInvite = [
            format [localize "STR_SQUADS_receiveInvitationText", _inviterName, _squad select 0], 
            localize "STR_SQUADS_joinSquadTitle", 
            localize "STR_SQUADS_joinSquadAccept", 
            localize "STR_SQUADS_joinSquadDecline"
        ] call BIS_fnc_guiMessage;
        
        if (_acceptInvite) then {
            ["add", [_inviter, getPlayerID player]] remoteExec ["SQUADS_API", 2];
        };
    };
    case "promote": {
        private _selection = tvCurSel _TREE;
        if (isNil "_selection") exitWith {
            _return = 1;
        };

        private _player = tvData [_TREE, _selection];

        ctrlShow [_PROMOTE_BUTTON, false];
        ctrlShow [_KICK_BUTTON, false];

        ["promote", [_player]] remoteExec ["SQUADS_API", 2];
    };
    case "kick": {
        private _selection = tvCurSel _TREE;
        if (isNil "_selection") exitWith {
            _return = 1;
        };

        private _player = tvData [_TREE, _selection];

        ctrlShow [_KICK_BUTTON, false];

        ["remove", [_player]] remoteExec ["SQUADS_API", 2];
    };
    case "isInMySquad": {
        // input: target player id
        private _target = _params select 0;

        if (_mySquadNumber == -1) then {
            _return = false;
        } else {
            _return = (((_squadManager select _mySquadNumber) select 2) find _target) > -1;
        };
    };
    case "isInSquad": {
        // input: target player id
        private _target = _params select 0;
        _return = _squadManager findIf {(_x select 2) find _target > -1} > -1;
    };
    case "getMySquadLeader": {
        private _playerId = getPlayerID player;

        private _squad = _squadManager select {(_x select 2) find _playerId > -1} select 0;

        if (isNil "_squad") then {
            _return = "-1";
        } else {
            private _squadLeaderID = _squad select 1;
            _message = format ["Squad Leader of %1: %2", _playerId, _squadLeaderID];
            _return = _squadLeaderID;
        };
    };
    case "ftSquadLeader": {
        // call this async
        private _sl = ['getMySquadLeader'] call BIS_fnc_squadsClient;
        private _squadLeader = allPlayers select {getPlayerID _x == _sl} select 0;

        if (isNil "_squadLeader") exitWith {
            _return = 1;
        };
        if (!alive _squadLeader) exitWith {
            _return = 2;
        };

        [player, "fastTravelSquadLeader"] remoteExec ["BIS_fnc_WL2_handleClientRequest", 2];

        private _destination = getPosATL _squadLeader;

        titleCut ["", "BLACK OUT", 1];
        openMap [false, false];

        sleep 1;

        _tagAlong = (units player) select {(_x distance2D player <= 100) && {(isNull objectParent _x) && {(alive _x) && {(_x != player) && {_x getVariable ["BIS_WL_ownerAsset", "123"] == getPlayerUID player}}}}};
        {
            _x setVehiclePosition [_destination, [], 5, "NONE"];
        } forEach _tagAlong;
        player setVehiclePosition [_destination, [], 5, "NONE"];

        sleep 1;

        titleCut ["", "BLACK IN", 1];
    };
    case "rename": {
        if (isNull (findDisplay _RENAME_WINDOW)) then {
            createDialog "SquadsMenu_Rename";
        };

        private _squad = _squadManager select _mySquadNumber;
        private _squadName = _squad select 0;
        ctrlSetText [_RENAME_EDIT, _squadName];

        private _RENAME_EDIT_CTRL = displayCtrl _RENAME_EDIT;
        ctrlSetFocus _RENAME_EDIT_CTRL;

        _RENAME_EDIT_CTRL ctrlSetTextSelection [0, count _squadName];

        _return = true;
    };
    case "renamed": {
        private _newName = ctrlText _RENAME_EDIT;
        ["rename", [getPlayerID player, _newName]] remoteExec ["SQUADS_API", 2];
        (findDisplay _RENAME_WINDOW) closeDisplay 1;
    };
    case "isRegularSquadMember": {
        // Check if player is regular squad member
        private _playerId = _params select 0;

        private _isRegular = _squadManager findIf { (_x select 2) find _playerId > -1 && (_x select 1) != _playerId } > -1;

        _message = format ["Player %1 is regular squad member: %2", _playerId, _isRegular];
        _return = _isRegular;
    };
};

if (isNil "_return") exitWith {
//     0 spawn {
//         sleep 0.5;
//         [false] call BIS_fnc_squadsMenu;
//     };
};

_return;