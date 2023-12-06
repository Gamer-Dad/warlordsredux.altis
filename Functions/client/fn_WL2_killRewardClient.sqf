params ["_unit", "_reward", ["_assist", false]];

disableSerialization;

_blockW = safeZoneW / 1000;
_blockH = safeZoneH / (1000 / (getResolution # 4));

_displayW = _blockW * 180;
_displayH = _blockH * 54;
_displayX = safeZoneW + safeZoneX - _displayW - (_blockW * 10);
_displayY = safeZoneH + safeZoneY - _displayH - (_blockH * 50);

{
	_ctrl = (findDisplay 46) displayCtrl _x;
	_ctrl ctrlSetPosition [((ctrlPosition _ctrl) select 0), (((ctrlPosition _ctrl) select 1) - 0.025)];
	_ctrl ctrlCommit 0;
} forEach (uiNamespace getVariable ["activeControls", []]);

_ctrlNmbr = (uiNamespace getVariable ["control", 50000]);
_ctrl = (findDisplay 46) ctrlCreate ["RscStructuredText", _ctrlNmbr];
_ctrl ctrlSetPosition [_displayX - (_blockW * 110), _displayY - (_blockH * 30), _blockW * 160, _blockH * 16];

_scale = 0.65 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale;
if (_unit isKindOf "Man") then {
	if (_assist) then {
		_ctrl ctrlSetStructuredText parseText format ["<t size='%2' align='right' color='#228b22'>Kill assist +%1CP</t>", _reward, _scale];
	} else {
		_ctrl ctrlSetStructuredText parseText format ["<t size='%2' align='right' color='#228b22'>Enemy killed +%1CP</t>", _reward, _scale];
	};
} else {
	_displayName = getText (configFile >> "CfgVehicles" >> (typeOf _unit) >> "displayName");
	if (_assist) then {
		_ctrl ctrlSetStructuredText parseText format ["<t size='%3' align='right' shadow = '1' color='#228b22'>Assist:%1 +%2CP</t>", _displayName, _reward, _scale];
	} else {
		_ctrl ctrlSetStructuredText parseText format ["<t size='%4' align='right' shadow = '1' color='#228b22'>%1 destroyed %3%2CP</t>", _displayName, _reward, (if (_reward > 0) then {"+"} else {""}), _scale];
	};
};

WAS_score = true;
["Kill", _unit] spawn MRTM_fnc_statTracker;

if (profileNamespace getVariable ["MRTM_playKillSound", true]) then {
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

_controls = uiNamespace getVariable ["activeControls", []];
_controls pushBack _ctrlNmbr;
uiNamespace setVariable ["activeControls", _controls];
_c = _ctrlNmbr + 1;
uiNamespace setVariable ["control", _c];