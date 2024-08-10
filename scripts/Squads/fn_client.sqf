#include "squad_constants.inc"

params ["_action", "_params"];

private _squadManager = missionNamespace getVariable ["SQUAD_MANAGER", []];
private _mySquadNumber = _squadManager findIf {(_x select 2) find (getPlayerID player) > -1};

_return = nil;

switch (_action) do {
    case "create": {
        private _squadName = format ["%1 SQUAD", toUpper (name player)];
        private _leader = getPlayerID player;
        private _side = side player;

        ctrlShow [CREATE_BUTTON, false];
    
        ["create", [_squadName, _leader, _side]] remoteExec ["SQD_fnc_server", 2];
    };
    case "leave": {
        if (_mySquadNumber == -1) exitWith {
            _return = 1;
        };

        ctrlShow [LEAVE_BUTTON, false];

        ["remove", [getPlayerID player]] remoteExec ["SQD_fnc_server", 2];
    };
    case "invite": {
        if (_mySquadNumber == -1) exitWith {
            _return = 1;
        };

        private _selection = lbCurSel PLAYER_LIST;
        if (isNil "_selection") exitWith {
            _return = 1;
        };

        private _player = lbData [PLAYER_LIST, _selection];
        private _inviter = getPlayerID player;

        ["invite", [_player, _inviter]] remoteExec ["SQD_fnc_server", 2];

        private _playerName = lbText [PLAYER_LIST, _selection];
        systemChat format [localize "STR_SQUADS_sendInvitationSuccessText", _playerName];

        playSoundUI ["a3\ui_f\data\sound\cfgnotifications\tasksucceeded.wss"];
    };
    case "invited": {
        // input: inviter id
        private _inviter = _params select 0;
        
        if (SQD_HAS_INVITE) exitWith {
            _return = 1;
        };
        SQD_HAS_INVITE = true;

        private _squad = _squadManager select { (_x select 2) find _inviter > -1 } select 0;
        if (isNil "_squad") exitWith {
            _return = 1;
        };
        private _inviterName = name (allPlayers select {getPlayerID _x == _inviter} select 0);

        playSoundUI ["a3\sounds_f\sfx\blip1.wss"];

        _acceptInvite = [
            format [localize "STR_SQUADS_receiveInvitationText", _inviterName, _squad select 0], 
            localize "STR_SQUADS_joinSquadTitle", 
            localize "STR_SQUADS_joinSquadAccept", 
            localize "STR_SQUADS_joinSquadDecline"
        ] call BIS_fnc_guiMessage;

        SQD_HAS_INVITE = false;
        
        if (_acceptInvite) then {
            ["add", [_inviter, getPlayerID player]] remoteExec ["SQD_fnc_server", 2];
        };
    };
    case "promote": {
        private _selection = tvCurSel TREE;
        if (isNil "_selection") exitWith {
            _return = 1;
        };

        private _player = tvData [TREE, _selection];

        ctrlShow [PROMOTE_BUTTON, false];
        ctrlShow [KICK_BUTTON, false];

        ["promote", [_player]] remoteExec ["SQD_fnc_server", 2];
    };
    case "kick": {
        private _selection = tvCurSel TREE;
        if (isNil "_selection") exitWith {
            _return = 1;
        };

        private _player = tvData [TREE, _selection];

        ctrlShow [KICK_BUTTON, false];

        ["remove", [_player]] remoteExec ["SQD_fnc_server", 2];
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
        private _sl = ['getMySquadLeader'] call SQD_fnc_client;
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

        _tagAlong = (units player) select {
            (_x distance2D player <= 100) && 
            (isNull objectParent _x) && 
            alive _x && 
            _x != player && 
            _x getVariable ["BIS_WL_ownerAsset", "123"] == getPlayerUID player
        };
        
        {
            _x setVehiclePosition [_destination, [], 5, "NONE"];
        } forEach _tagAlong;

        player setVehiclePosition [_destination, [], 5, "NONE"];

        sleep 1;

        titleCut ["", "BLACK IN", 1];
    };
    case "rename": {
        if (isNull (findDisplay RENAME_WINDOW)) then {
            createDialog "SquadsMenu_Rename";
        };

        private _squad = _squadManager select _mySquadNumber;
        private _squadName = _squad select 0;
        ctrlSetText [RENAME_EDIT, _squadName];

        private _renamEditControl = displayCtrl RENAME_EDIT;
        ctrlSetFocus _renamEditControl;
        _renamEditControl ctrlSetTextSelection [0, count _squadName];

        _return = true;
    };
    case "renamed": {
        private _newName = ctrlText RENAME_EDIT;
        ["rename", [getPlayerID player, _newName]] remoteExec ["SQD_fnc_server", 2];
        (findDisplay RENAME_WINDOW) closeDisplay 1;
    };
    case "isRegularSquadMember": {
        // Check if player is regular squad member
        private _playerId = _params select 0;

        private _isRegular = _squadManager findIf { (_x select 2) find _playerId > -1 && (_x select 1) != _playerId } > -1;

        _message = format ["Player %1 is regular squad member: %2", _playerId, _isRegular];
        _return = _isRegular;
    };
    case "isSquadLeader": {
        // Check if player is squad leader
        private _playerId = _params select 0;

        private _sl = ['getMySquadLeader'] call SQD_fnc_client;
        private _squad = _squadManager select {(_x select 2) find _playerId > -1} select 0;

        if (isNil "_squad") then {
            _return = false;
        } else {
            private _squadLeaderID = _squad select 1;
            _return = (_squadLeaderID == _playerId);
        };
    };
    case "isSquadLeaderOfSize": {
        // Check if player is squad leader of a squad of a certain size or greater
        private _playerId = _params select 0;
        private _size = _params select 1;

        private _squad = _squadManager select { (_x select 1) == _playerId } select 0;
        private _isLeader = !isNil "_squad";
        private _squadSize = if (isNil "_squad") then { 1 } else {count (_squad select 2)};

        _return = _isLeader && (_squadSize >= _size);
    };
};

if (isNil "_return") exitWith { };

_return;