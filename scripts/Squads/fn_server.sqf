params ["_action", "_params"];

_message = nil;
_return = nil;

switch (_action) do {
    case "create": {
        // Create squad with name & leader
        private _squadName = _params select 0;
        private _leader = _params select 1;
        private _side = _params select 2;

        private _newSquad = [_squadName, _leader, [_leader], _side];
        SQUAD_MANAGER pushBack _newSquad;
        
        _message = format ["Squad %1 created by %2 on %3", _squadName, _leader, _side];
        _return = count SQUAD_MANAGER - 1;
    };
    case "invite": {
        // Invite player to squad
        private _playerId = _params select 0;
        private _inviter = _params select 1;

        private _squad = SQUAD_MANAGER select {(_x select 2) find _inviter > -1} select 0;
        if (isNil "_squad") exitWith {
            _message = format ["Inviter squad for %1 not found", _inviter];
            _return = 1;
        };

        private _userInfo = getUserInfo _playerId;

        if (isNil "_userInfo" || count _userInfo < 1) exitWith {
            _message = format ["Player %1 not found", _playerId];
            _return = 1;
        };

        private _owner = _userInfo select 1;

        ['invited', [_inviter]] remoteExec ["SQD_fnc_client", _owner];

        _message = format ["%1 invited to Squad %2", _playerId, _squad];
        _return = 0;
    };
    case "add": {
        // Player join squad
        private _inviter = _params select 0;
        private _playerId = _params select 1;

        ["remove", [_playerId]] call SQD_fnc_server;

        private _squad = SQUAD_MANAGER select {(_x select 2) find _inviter > -1} select 0;
        if (isNil "_squad") exitWith {
            _message = format ["Inviter squad for %1 not found", _inviter];
            _return = 1;
        };
        
        (_squad select 2) pushBack _playerId;
        
        _message = format ["Player %1 joined Squad %2", _playerId, (_squad select 0)];
        _return = _squadNumber;
    };
    case "remove": {
        // Remove player from squad
        private _playerId = _params select 0;
        
        private _squads = SQUAD_MANAGER select {(_x select 2) find _playerId > -1};

        { 
            private _squad = _x;
            private _members = _squad select 2;
            _members = _members - [_playerId];
            _squad set [2, _members];

            if (_playerId == (_squad select 1)) then {
                _squad set [1, _squad select 2 select 0];
            };
        } forEach _squads;

        _message = format ["Player %1 removed from all squads.", _playerId];
        _return = 0;
    };
    case "promote": {
        // Promote player to squad leader
        private _playerId = _params select 0;

        private _squad = SQUAD_MANAGER select {(_x select 2) find _playerId > -1} select 0;
        _squad set [1, _playerId];

        _message = format ["Player %1 promoted to Squad Leader of %2", _playerId, (_squad select 0)];
        _return = 0;
    };
    case "getSquadmates": {
        // Get squadmates of player
        private _playerId = _params select 0;

        private _squad = SQUAD_MANAGER select {(_x select 2) find _playerId > -1} select 0;
        private _squadmates = if (isNil "_squad") then {[]} else {_squad select 2};

        _message = format ["Squadmates of %1: %2", _playerId, _squadmates];
        _return = _squadmates;
    };
    case "rename": {
        // Rename squad
        private _playerId = _params select 0;
        private _newName = _params select 1;

        private _squad = SQUAD_MANAGER select {(_x select 1) == _playerId} select 0;
        if (isNil "_squad") exitWith {
            _message = format ["Squad for player %1 not found", _playerId];
            _return = 1;
        };

        _squad set [0, _newName];

        _message = format ["Player %1 renamed squad to %2", _playerId, _newName];
        _return = 0;
    };
    case "isSquadLeader": {
        // Check if player is squad leader
        private _playerId = _params select 0;

        private _squad = SQUAD_MANAGER select {(_x select 1) == _playerId};
        private _isLeader = !isNil "_squad";

        _message = format ["Player %1 is squad leader: %2", _playerId, _isLeader];
        _return = _isLeader;
    };
    case "isInASquad": {
        // Check if player is in squad
        private _playerId = _params select 0;

        private _squad = SQUAD_MANAGER select {(_x select 2) find _playerId > -1};
        private _isInSquad = !isNil "_squad";

        _message = format ["Player %1 is in squad: %2", _playerId, _isInSquad];
        _return = _isInSquad;
    };
    case "isRegularSquadMember": {
        // Check if player is regular squad member
        private _playerId = _params select 0;

        _isRegular = ["isInASquad", [_playerId]] call SQD_fnc_server && !(["isSquadLeader", [_playerId]] call SQD_fnc_server);

        _message = format ["Player %1 is regular squad member: %2", _playerId, _isRegular];
        _return = _isRegular;
    };
    case "getSquadSizeOfSquadLeader": {
        // Get squad size of squad leader
        private _playerId = _params select 0;

        private _squad = SQUAD_MANAGER select {(_x select 1) == _playerId} select 0;
        private _squadSize = if (isNil "_squad") then {1} else {count (_squad select 2)};

        _message = format ["Squad size of squad leader %1: %2", _playerId, _squadSize];
        _return = _squadSize;
    };

    case "earnPoints": {
        private _playerId = _params select 0;
        private _points = _params select 1;

        _oldPoints = WL_PlayerSquadContribution getOrDefault [_playerId, 0];
        _points = _points + _oldPoints;
        WL_PlayerSquadContribution set [_playerId, _points];

        missionNamespace setVariable ["WL_PlayerSquadContribution", WL_PlayerSquadContribution, true];

        _message = format ["Player %1 earned %2 points", _playerId, _points];
        _return = 0;
    };
};

missionNamespace setVariable ["SQUAD_MANAGER", SQUAD_MANAGER, true];

_return;