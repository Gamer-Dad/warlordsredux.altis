#include "..\..\warlords_constants.inc"

private _previousState = BIS_WL_currentSelection;
private _previousVotePhase = WL_VotePhase;
private _lastFullUpdate = -1;
while { !BIS_WL_missionEnd } do {
    sleep 0.1;
    if (_previousState == BIS_WL_currentSelection && _previousVotePhase == WL_VotePhase && _lastFullUpdate + 2 > serverTime) then {
        continue;
    };

    // state changed or full update every 2s
    _previousState = BIS_WL_currentSelection;
    _lastFullUpdate = serverTime;
    _previousVotePhase = WL_VotePhase;

    call WL2_fnc_updateSelectionState;
};