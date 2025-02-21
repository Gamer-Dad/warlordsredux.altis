params ["_sender", "_selectIndex"];

if (isNil "POLL_results") then {
    POLL_results = createHashMap;
};

private _resultArray = POLL_results getOrDefault [_selectIndex, []];
_resultArray pushBack _sender;
POLL_results set [_selectIndex, _resultArray];