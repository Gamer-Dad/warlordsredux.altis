params ["_vehicle", "_angle", "_indicator"];

if (vehicle player != _vehicle) exitWith {};
if !((typeOf _vehicle) in apsAPSAll) exitWith {};

private _type = switch (_vehicle getVariable "apsType") do {
	case 2: { "Heavy APS" };
	case 1: { "Medium APS" };
	case 0: { "Light APS" };
	default { "Dazzler" };
};

private _text = _type;
if ((typeOf _vehicle) in apsDazzler) then {
	_text = _text + (if (_vehicle call APS_fnc_active) then {
		" is active.";
	} else {
		" is inactive.";
	});
} else {
	_text = _text + format[" Charges: %1/%2", _vehicle getVariable ["apsAmmo", 0], _vehicle call APS_fnc_getMaxAmmo];
};

private _apsDisplay = uiNamespace getVariable ["RscWLAPSDisplay", objNull];
if (isNull _apsDisplay) then {
	"APSDisplay" cutRsc ["RscWLAPSDisplay", "PLAIN", -1, true, true];
	_apsDisplay = uiNamespace getVariable "RscWLAPSDisplay";
};

private _indicatorBackground = _apsDisplay displayCtrl 7006;
private _indicatorDanger = _apsDisplay displayCtrl 7007;
private _indicatorRadar = _apsDisplay displayCtrl 7008;
private _indicatorText = _apsDisplay displayCtrl 7100;

if (_angle < 1) then{
	_angle = 1;
};

if (_indicator) then {
	playSound"Alarm";

	_indicatorDanger ctrlSetText "\a3\ui_f\data\IGUI\Cfg\Radar\danger_ca.paa";

	_indicatorDanger ctrlSetAngle [_angle + 22.5, 0.5, 0.5];
	_indicatorDanger ctrlShow true;
	_indicatorRadar ctrlShow true;
} else {
	_indicatorDanger ctrlSetText "";
	_indicatorRadar ctrlShow true;
};

_indicatorBackground ctrlSetBackgroundColor [0, 0, 0, 0.7];
_indicatorText ctrlSetText _text;

uiNamespace setVariable ["WL_APS_showScreenExpire", time + 7];

waitUntil {
	sleep 0.5;
	time > uiNamespace getVariable ["WL_APS_showScreenExpire", 0]
};

_indicatorBackground ctrlSetBackgroundColor [0, 0, 0, 0];
_indicatorText ctrlSetText "";

_indicatorDanger ctrlShow false;
_indicatorRadar ctrlShow false;
