params ["_asset"];

_extraArray = [
	"showbag",
	"showtools",
	"showlog",
	"Hide_Shield",
	"HideBackpacks",
	"HideConstruction",
	"HideDoor1",
	"HideDoor2",
	"HideDoor3",
	"HideBumper1",
	"HideBumper2"
];

_animations = [];
{
	_animations pushBack configName _x;
}forEach (configProperties [configfile >> "CfgVehicles" >> (typeof cursorTarget) >> "animationSources"]);
_animations append animationNames _asset;

{
	_lb = lbAdd [1503, _x];
	lbSetData [1503, _lb, str ([_x, (_asset animationPhase _x)])];
	lbSetCurSel [1503, _lb];
} forEach (_animations select {_x in _extraArray});