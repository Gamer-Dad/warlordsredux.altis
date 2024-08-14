private _v=_this select 0;
private _d=_this select 1;
private _indicator=_this select 2;

if !((vehicle player) == _v) exitWith {};
if !((typeOf _v) in apsAPSAll) exitWith {};

private _type = switch (_v getVariable "apsType") do {
	case 2: { "Heavy APS" };
	case 1: { "Medium APS" };
	case 0: { "Light APS" };
	default { "Dazzler" };
};

_text = "";
if (!_indicator) then {
	_text = format["%1 is now %2<br/>", _type, (if (_v call APS_fnc_active) then {"active"} else {"inactive"})];
};
if !((typeOf _v) in apsDazzler) then {
	_text = _text + format["Charges: %1/%2", (_v getVariable"apsAmmo"), (_v call APS_fnc_getMaxAmmo)];
};

if (!_indicator) exitWith {};

if(_d<1)then{_d=1};

playSound"Alarm";

private _apsDisplay = uiNamespace getVariable ["RscWLAPSDisplay", objNull];
if (isNull _apsDisplay) then {
	"APSDisplay" cutRsc ["RscWLAPSDisplay", "PLAIN", -1, true, true];
	_apsDisplay = uiNamespace getVariable "RscWLAPSDisplay";
};

private _indicatorBackground = _apsDisplay displayCtrl 7006;
private _indicatorDanger = _apsDisplay displayCtrl 7007;
private _indicatorRadar = _apsDisplay displayCtrl 7008;

_indicatorBackground ctrlSetBackgroundColor [0, 0, 0, 0.7];
_indicatorDanger ctrlShow true;
_indicatorRadar ctrlShow true;

_indicatorDanger ctrlSetAngle [_d + 22.5, 0.5, 0.5];

sleep 5;

_indicatorBackground ctrlSetBackgroundColor [0, 0, 0, 0];
_indicatorDanger ctrlShow false;
_indicatorRadar ctrlShow false;
