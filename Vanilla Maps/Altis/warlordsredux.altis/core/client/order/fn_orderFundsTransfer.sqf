#include "..\..\warlords_constants.inc"

private _display = uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull];

private _i = 100;
for "_i" from 100 to 114 do {
	(_display displayCtrl _i) ctrlEnable false;
};

private _purchase_transfer_background = _display displayCtrl 115;
private _purchase_transfer_units = _display displayCtrl 116;
private _purchase_transfer_amount = _display displayCtrl 117;
private _purchase_transfer_slider = _display displayCtrl 118;
private _purchase_transfer_ok = _display displayCtrl 119;
private _purchase_transfer_cancel = _display displayCtrl 120;

_purchase_transfer_background ctrlSetFade 0;
_purchase_transfer_background ctrlCommit 0;

_purchase_transfer_units ctrlSetFade 0;
_purchase_transfer_units ctrlEnable TRUE;
_purchase_transfer_units ctrlCommit 0;

_purchase_transfer_amount ctrlSetFade 0;
_purchase_transfer_amount ctrlEnable TRUE;
_purchase_transfer_amount ctrlCommit 0;

private _existingMoney = (missionNamespace getVariable "fundsDatabaseClients") get (getPlayerUID player);
private _transferCost = getMissionConfigValue ["BIS_WL_fundsTransferCost", 2000];
private _maxTransfer = _existingMoney - _transferCost;
_purchase_transfer_amount ctrlSetText format ["%1", ceil _maxTransfer];

_purchase_transfer_ok ctrlSetFade 0;
_purchase_transfer_ok ctrlEnable true;
_purchase_transfer_ok ctrlCommit 0;

_purchase_transfer_cancel ctrlSetFade 0;
_purchase_transfer_cancel ctrlEnable true;
_purchase_transfer_cancel ctrlCommit 0;

_purchase_transfer_slider ctrlSetFade 0;
_purchase_transfer_slider ctrlEnable true;
_purchase_transfer_slider ctrlCommit 0;

_purchase_transfer_slider sliderSetRange [0, _maxTransfer];
_purchase_transfer_slider sliderSetPosition _maxTransfer;
_purchase_transfer_slider sliderSetSpeed [1000, 1000, 1000];

{
	_purchase_transfer_units lbAdd name _x
} forEach (allPlayers select {isPlayer _x && {side group _x == BIS_WL_playerSide && {_x != player}}});
_purchase_transfer_units lbSetCurSel 0;

[_purchase_transfer_units, _purchase_transfer_ok, _purchase_transfer_amount, _maxTransfer] spawn {
	params ["_purchase_transfer_units", "_purchase_transfer_ok", "_purchase_transfer_amount", "_maxTransfer"];
	private _moneySign = [BIS_WL_playerSide] call WL2_fnc_getMoneySign;

	private _valueText = ctrlText _purchase_transfer_amount;
	private _color = BIS_WL_colorFriendly;
	while {ctrlEnabled _purchase_transfer_ok} do {
		private _valueArr = toArray ctrlText _purchase_transfer_amount;
		private _i = 0;
		while {_i < count _valueArr} do {
			private _enteredChar = _valueArr # _i;
			if (_enteredChar < 48 || _enteredChar > 57) then {
				_valueArr deleteAt _i;
			}
			else {
				_i = _i + 1;
			};
			sleep 0.0001;
		};
		_i = nil;
		_valueText = toString _valueArr;
		_purchase_transfer_amount ctrlSetText _valueText;

		private _value = if (_valueText != "") then {
			parseNumber _valueText
		} else {
			0
		};
		private _maxTransfer = _this # 3;
		if (_value <= _maxTransfer && _value > 0) then {
			uiNamespace setVariable ["BIS_WL_fundsTransferPossible", true];
			private _transferText = format [
				"<t align = 'center' shadow = '2' size = '%1'>%2 (%3%4)</t>",
				1.25 call WL2_fnc_purchaseMenuGetUIScale,
				localize "STR_A3_WL_button_transfer",
				_moneySign,
				_value
			];
			_purchase_transfer_ok ctrlSetStructuredText parseText _transferText;

			_purchase_transfer_ok ctrlSetBackgroundColor _color;
			_purchase_transfer_ok ctrlSetTextColor [1, 1, 1, 1];
			_purchase_transfer_ok ctrlSetTooltip "";
		} else {
			uiNamespace setVariable ["BIS_WL_fundsTransferPossible", false];
			private _transferText = format [
				"<t align = 'center' shadow = '2' size = '%1'>%2</t>",
				1.25 call WL2_fnc_purchaseMenuGetUIScale,
				localize "STR_A3_WL_button_transfer"
			];
			_purchase_transfer_ok ctrlSetStructuredText parseText _transferText;


			_purchase_transfer_ok ctrlSetBackgroundColor [(_color # 0) * 0.5, (_color # 1) * 0.5, (_color # 2) * 0.5, _color # 3];
			_purchase_transfer_ok ctrlSetTextColor [0.5, 0.5, 0.5, 1];
			if (_value > 0) then {_purchase_transfer_ok ctrlSetTooltip localize "STR_A3_WL_low_funds"} else {_purchase_transfer_ok ctrlSetTooltip ""};
		};
		private _set = _purchase_transfer_units lbText lbCurSel (_this # 0);
		lbClear _purchase_transfer_units;

		{
			_purchase_transfer_units lbAdd name _x;
		} forEach (allPlayers select {isPlayer _x && {side group _x == BIS_WL_playerSide && {_x != player}}});

		lbSort _purchase_transfer_units;
		if (lbSize _purchase_transfer_units == 0) exitWith {
			private _display = uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull];
			_i = 100;
			for "_i" from 100 to 114 do {
				(_display displayCtrl _i) ctrlEnable true;
			};
			_i = 115;
			for "_i" from 115 to 120 do {
				(_display displayCtrl _i) ctrlEnable false;
				(_display displayCtrl _i) ctrlSetFade 1;
				(_display displayCtrl _i) ctrlCommit 0;
			};
			playSound "AddItemFailed";
		};
		if (_set == "") then {
			_purchase_transfer_units lbSetCurSel 0;
		} else {
			private _id = -1;
			private _i = 0;
			private _size = (lbSize _purchase_transfer_units) - 1;
			for "_i" from 0 to _size do {
				if ((_purchase_transfer_units lbText _i) == _set) then {
					_id = _i;
				};
			};
			if (_id >= 0) then {
				_purchase_transfer_units lbSetCurSel _id;
			} else {
				_purchase_transfer_units lbSetCurSel 0;
			};
		};
		private _t = serverTime + WL_TIMEOUT_SHORT;
		waitUntil {serverTime > _t || {ctrlText _purchase_transfer_amount != _valueText}};
	};
};
