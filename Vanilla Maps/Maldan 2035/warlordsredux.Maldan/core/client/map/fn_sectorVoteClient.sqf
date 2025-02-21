#include "..\..\warlords_constants.inc"

// Ongoing checks for sector target
0 spawn {
    private _lastTargetFriendly = objNull;
    while {!BIS_WL_missionEnd} do {
        if !(BIS_WL_playerSide in BIS_WL_competingSides) exitWith {
            WL_VotePhase = 0;
            private _voteDisplay = uiNamespace getVariable ["RscWLVoteDisplay", objNull];
            if (!isNull _voteDisplay) then {
                private _indicator = _voteDisplay displayCtrl 7002;
                private _indicatorBackground = _voteDisplay displayCtrl 7003;
                _indicator ctrlSetText "";
                _indicatorBackground ctrlSetBackgroundColor [0, 0, 0, 0];
            };
        };

        if (isNull WL_TARGET_FRIENDLY) then {
            call WL2_fnc_sectorVoteDisplay;
        };

        if (_lastTargetFriendly != WL_TARGET_FRIENDLY) then {
            ["client"] call WL2_fnc_updateSectorArrays;

            if (!isNull WL_TARGET_FRIENDLY) then {
                call WL2_fnc_refreshCurrentTargetData;
                private _voteDisplay = uiNamespace getVariable ["RscWLVoteDisplay", objNull];
                if (!isNull _voteDisplay) then {
                    private _indicator = _voteDisplay displayCtrl 7002;
                    private _indicatorBackground = _voteDisplay displayCtrl 7003;
                    _indicator ctrlSetText "";
                    _indicatorBackground ctrlSetBackgroundColor [0, 0, 0, 0];
                };

                "Selected" call WL2_fnc_announcer;
                [toUpper format [localize "STR_A3_WL_popup_voting_done", WL_TARGET_FRIENDLY getVariable "BIS_WL_name"]] spawn WL2_fnc_smoothText;
            };
        };

        _lastTargetFriendly = WL_TARGET_FRIENDLY;
        sleep 1;
    };
};

// Checks for voting phase
while {!BIS_WL_missionEnd} do {
    if !(BIS_WL_playerSide in BIS_WL_competingSides) exitWith {
        WL_VotePhase = 0;
    };

    private _isVoting = isNull WL_TARGET_FRIENDLY;
    private _isVoted = !isNull BIS_WL_targetVote;
    private _isRegularSquadMember = ["isRegularSquadMember", [getPlayerID player]] call SQD_fnc_client;

    private _newPhase = if (_isRegularSquadMember || !_isVoting) then {
        0
    } else {
        if (!_isVoted) then {
            1
        } else {
            2
        };
    };

    if (WL_VotePhase != _newPhase) then {
        WL_VotePhase = _newPhase;

        ["client"] call WL2_fnc_updateSectorArrays;
        switch (WL_VotePhase) do {
            // Stopped voting
            case 0: {
                BIS_WL_targetVote = objNull;
                missionNamespace setVariable [format ["BIS_WL_targetVote_%1", getPlayerID player], objNull, 2];
            };
            // Started voting
            case 1: {
                "Voting" call WL2_fnc_announcer;
                [toUpper localize "STR_A3_WL_popup_voting"] spawn WL2_fnc_smoothText;

                private _voteDisplay = uiNamespace getVariable ["RscWLVoteDisplay", objNull];
                if (isNull _voteDisplay) then {
                    "VoteDisplay" cutRsc ["RscWLVoteDisplay", "PLAIN", -1, true, false];
                    _voteDisplay = uiNamespace getVariable "RscWLVoteDisplay";
                };

                private _indicator = _voteDisplay displayCtrl 7002;
                private _indicatorBackground = _voteDisplay displayCtrl 7003;
                _indicatorBackground ctrlSetBackgroundColor [0, 0, 0, 0.7];
            };
            // Voted
            case 2: {};
        };
    };

    sleep WL_TIMEOUT_SHORT;
};