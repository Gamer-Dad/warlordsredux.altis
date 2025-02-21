params ["_asset"];

private _actionId = _asset addAction [
	"<t color='#00FF00'>Stabilize Boat</t>",
	{
		params ["_asset", "_caller", "_actionId"];
        private _previousState = _asset getVariable ["WL2_stabilizeBoat", false];
        _asset setVariable ["WL2_stabilizeBoat", !_previousState];
	},
	[],
	10,
	false,
	false,
	"",
	"vehicle _this == _target && speed _target < 10",
	30,
	false
];

while { alive _asset } do {
    private _stabilized = _asset getVariable ["WL2_stabilizeBoat", false];

    _asset setUserActionText [_actionId, if (_stabilized) then {
        "<t color='#FF0000'>Unstabilize Boat</t>"
    } else {
        "<t color='#00FF00'>Stabilize Boat</t>"
    }];

    if (_stabilized) then {
        _asset setVectorUp [0, 0, 1];
    };
    sleep 0.001;
};