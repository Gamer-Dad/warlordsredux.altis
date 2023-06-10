#include "..\warlords_constants.inc"

params ["_unit", "_reward", "_assist", "_uid"];

private _p = _uid call BIS_fnc_getUnitByUID;
if !(local _p) exitWith {};

disableSerialization;

private _blockW = safeZoneW / 1000;
private _blockH = safeZoneH / (1000 / (getResolution # 4));

private _displayW = _blockW * 180;
private _displayH = _blockH * 54;
private _displayX = safeZoneW + safeZoneX - _displayW - (_blockW * 10);
private _displayY = safeZoneH + safeZoneY - _displayH - (_blockH * 50); //lower vaule here is lower on screen, default valute is 100

{
	private _ctrl = (findDisplay 46) displayCtrl _x;
	_ctrl ctrlSetPosition [((ctrlPosition _ctrl) select 0), (((ctrlPosition _ctrl) select 1) - 0.025)];
	_ctrl ctrlCommit 0;
} forEach (uiNamespace getVariable ["activeControls", []]);

if ((isNil {(uiNamespace getVariable "control")}) && {!(9 isEqualType (uiNamespace getVariable "control"))}) exitWith {
	diag_log ("Error client kill reward control is not a number. | File: killRewardClient.sqf | Line: 24");
};
private _control = (uiNamespace getVariable "control");
private _ctrl = (findDisplay 46) ctrlCreate ["RscStructuredText", _control];

_ctrl ctrlSetPosition [_displayX - (_blockW * 110), _displayY - (_blockH * 30), _blockW * 160, _blockH * 16];

if (_unit isKindOf "Man") then {
	if (_assist) then {
		_ctrl ctrlSetStructuredText parseText format ["<t size='0.9' align='right' color='#228b22'>Kill assist: %1CP</t>", _reward];
	} else {
		_ctrl ctrlSetStructuredText parseText format ["<t size='0.9' align='right' color='#228b22'>Enemy killed +%1CP</t>", _reward];
	};
} else {
	if (_assist) then {
		_displayName = getText (configFile >> "CfgVehicles" >> (typeOf _unit) >> "displayName");
		_ctrl ctrlSetStructuredText parseText format ["<t size='0.9' align='right' shadow = '1' color='#228b22'>Assist: %1 + %2CP</t>", _displayName, _reward];
	} else {
		_displayName = getText (configFile >> "CfgVehicles" >> (typeOf _unit) >> "displayName");
		_ctrl ctrlSetStructuredText parseText format ["<t size='0.9' align='right' shadow = '1' color='#228b22'>%1 destroyed +%2CP</t>", _displayName, _reward];
	};
};
if (MRTM_playKillSound) then {
	playSoundUI ["AddItemOK", 0.1, 1];
};

_ctrl ctrlCommit 0;

_control spawn {
	disableSerialization;
	_ctrl = (findDisplay 46) displayCtrl _this;
	_ctrl ctrlCommit 0;
	UISleep 10;
	ctrlDelete _ctrl;
	
	private _var = ((uiNamespace getVariable ["activeControls", []]) - [_this]);
	uiNamespace setVariable ["activeControls", _var];
};

private _var = ((uiNamespace getVariable ["activeControls", []]) + [_control]);
uiNamespace setVariable ["activeControls", _var];
private _c = (_control + 1);
uiNamespace setVariable ["control", _c];