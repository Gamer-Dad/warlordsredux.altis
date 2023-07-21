#include "..\warlords_constants.inc"

params ["_unit", "_reward", "_transport"];

disableSerialization;

_blockW = safeZoneW / 1000;
_blockH = safeZoneH / (1000 / (getResolution # 4));

_displayW = _blockW * 180;
_displayH = _blockH * 54;
_displayX = safeZoneW + safeZoneX - _displayW - (_blockW * 10);
_displayY = safeZoneH + safeZoneY - _displayH - (_blockH * 50); //lower vaule here is lower on screen, default valute is 100

{
	_ctrl = (findDisplay 46) displayCtrl _x;
	_ctrl ctrlSetPosition [((ctrlPosition _ctrl) select 0), (((ctrlPosition _ctrl) select 1) - 0.025)];
	_ctrl ctrlCommit 0;
} forEach (uiNamespace getVariable ["activeControls", []]);

if ((isNil {(uiNamespace getVariable "control")}) && {!(9 isEqualType (uiNamespace getVariable "control"))}) exitWith {
	diag_log ("Error: Client kill reward control is not a number. | File: fn_WL2_killRewardClient.sqf | Line: 24");
};
_ctrlNmbr = (uiNamespace getVariable "control");
_ctrl = (findDisplay 46) ctrlCreate ["RscStructuredText", _ctrlNmbr];

_ctrl ctrlSetPosition [_displayX - (_blockW * 110), _displayY - (_blockH * 30), _blockW * 160, _blockH * 16];

switch true do {
	case (_transport): { 
		_ctrl ctrlSetStructuredText parseText format ["<t size='0.8' align='right' color='#add8e6'>%1%2</t>", localize "STR_A3_WL_supplied", 
			if (_reward > 0) then { format [" +%1CP", _reward] } else { "" }];
	};
	case (_bounty): { 
		_ctrl ctrlSetStructuredText parseText format ["<t size='0.8' align='right' color='#228b22'>%1CP Bounty collected</t>", _reward];
	};
	case (_unit isKindOf "Man"): { 
		_ctrl ctrlSetStructuredText parseText format ["<t size='0.8' align='right' color='#228b22'>Enemy killed +%1CP</t>", _reward];
	};
	default { 
		_displayName = getText (configFile >> "CfgVehicles" >> (typeOf _unit) >> "displayName");
		_ctrl ctrlSetStructuredText parseText format ["<t size='0.8' align='right' shadow = '1' color='#228b22'>%1 destroyed +%2CP</t>", _displayName, _reward];
	 };
};

if (MRTM_playKillSound) then {
	playSoundUI ["AddItemOK", 0.1, 1];
};

_ctrl ctrlCommit 0;

_ctrlNmbr spawn {
	disableSerialization;
	_ctrl = (findDisplay 46) displayCtrl _this;
	_ctrl ctrlCommit 0;
	UISleep 10;
	ctrlDelete _ctrl;
	
	_var = ((uiNamespace getVariable ["activeControls", []]) - [_this]);
	uiNamespace setVariable ["activeControls", _var];
};

_var = ((uiNamespace getVariable ["activeControls", []]) + [_ctrlNmbr]);
uiNamespace setVariable ["activeControls", _var];
_c = _ctrlNmbr + 1;
uiNamespace setVariable ["control", _c];