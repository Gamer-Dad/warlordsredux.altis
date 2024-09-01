params ["_unit", "_reward", ["_customText", ""], ["_customColor", "#228b22"]];

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

private _displayText = "";
private _displayName = "";

if (_customText != "") then {
	_displayText = format ["%1 +%2CP", _customText, _reward];
} else {
	if (_unit isKindOf "Man") then {
		_displayText = "Enemy killed %2CP";
	} else {
		_displayName = getText (configFile >> "CfgVehicles" >> (typeOf _unit) >> "displayName");
		_displayText = "%1 destroyed %2CP";
	};
	_displayText = format [_displayText, _displayName, if (_reward > 0) then {format ["+%1", _reward]} else {format ["%1", _reward]}];
};
_ctrl ctrlSetStructuredText parseText format ["<t size='%1' align='right' color='%2'>%3</t>", _scale, _customColor, _displayText];

WAS_score = true;

if (profileNamespace getVariable ["MRTM_playKillSound", true] && _customColor == "#228b22") then {
	playSoundUI ["AddItemOK", 1, 1];
};

_ctrl ctrlCommit 0;

_ctrlNmbr spawn {
	disableSerialization;
	_ctrl = (findDisplay 46) displayCtrl _this;
	_ctrl ctrlCommit 0;
	UISleep 10;
	ctrlDelete _ctrl;

	_controls = uiNamespace getVariable ["activeControls", []];
	_controls deleteAt _this;
	uiNamespace setVariable ["activeControls", _controls];
};

_controls = uiNamespace getVariable ["activeControls", []];
_controls pushBack _ctrlNmbr;
uiNamespace setVariable ["activeControls", _controls];
_c = _ctrlNmbr + 1;
uiNamespace setVariable ["control", _c];