#include "..\warlords_constants.inc"

_i = 100;
for "_i" from 100 to 114 do {
	(_display displayCtrl _i) ctrlEnable false;
};

_purchase_transfer_background = _display displayCtrl 115;
_purchase_transfer_units = _display displayCtrl 116;
_purchase_transfer_amount = _display displayCtrl 117;
_purchase_transfer_cp_title = _display displayCtrl 118;
_purchase_transfer_ok = _display displayCtrl 119;
_purchase_transfer_cancel = _display displayCtrl 120;

_purchase_transfer_background ctrlSetFade 0;
_purchase_transfer_background ctrlCommit 0;

_purchase_transfer_units ctrlSetFade 0;
_purchase_transfer_units ctrlEnable TRUE;
_purchase_transfer_units ctrlCommit 0;

_purchase_transfer_amount ctrlSetFade 0;
_purchase_transfer_amount ctrlEnable TRUE;
_purchase_transfer_amount ctrlCommit 0;

_purchase_transfer_amount ctrlSetText str (ceil ((missionNamespace getVariable "fundsDatabaseClients") get (getPlayerUID player)));

_purchase_transfer_cp_title ctrlSetFade 0;
_purchase_transfer_cp_title ctrlEnable TRUE;
_purchase_transfer_cp_title ctrlCommit 0;

_purchase_transfer_ok ctrlSetFade 0;
_purchase_transfer_ok ctrlEnable TRUE;
_purchase_transfer_ok ctrlCommit 0;

_purchase_transfer_cancel ctrlSetFade 0;
_purchase_transfer_cancel ctrlEnable TRUE;
_purchase_transfer_cancel ctrlCommit 0;

{_purchase_transfer_units lbAdd name _x} forEach ((BIS_WL_allWarlords select {isPlayer _x && side group _x == side group player}) - [player]);
_purchase_transfer_units lbSetCurSel 0;

[_purchase_transfer_units, _purchase_transfer_ok, _purchase_transfer_amount] spawn {
	_valueText = ctrlText (_this # 2);
	_color = BIS_WL_colorFriendly;
	while {ctrlEnabled (_this # 1)} do {
		_valueArr = toArray ctrlText (_this # 2);
		private _i = 0;
		while {_i < count _valueArr} do {
			if (_valueArr # _i < 48 || {_valueArr # _i > 57}) then {
				_valueArr deleteAt _i;
			}
			else {
				_i = _i + 1;
			};
		};
		_i = nil;
		_valueText = toString _valueArr;
		(_this # 2) ctrlSetText _valueText;
		_value = (if (_valueText != "") then {parseNumber _valueText} else {0});
		if (_value <= ((missionNamespace getVariable "fundsDatabaseClients") get (getPlayerUID player)) && _value > 0) then {
			uiNamespace setVariable ["BIS_WL_fundsTransferPossible", TRUE];
			(_this # 1) ctrlSetBackgroundColor _color;
			(_this # 1) ctrlSetTextColor [1, 1, 1, 1];
			(_this # 1) ctrlSetTooltip "";
		} else {
			uiNamespace setVariable ["BIS_WL_fundsTransferPossible", FALSE];
			(_this # 1) ctrlSetBackgroundColor [(_color # 0) * 0.5, (_color # 1) * 0.5, (_color # 2) * 0.5, _color # 3];
			(_this # 1) ctrlSetTextColor [0.5, 0.5, 0.5, 1];
			if (_value > 0) then {(_this # 1) ctrlSetTooltip localize "STR_A3_WL_low_funds"} else {(_this # 1) ctrlSetTooltip ""};
		};
		_set = (_this # 0) lbText lbCurSel (_this # 0);
		lbClear (_this # 0);
		{(_this # 0) lbAdd name _x} forEach ((BIS_WL_allWarlords select {isPlayer _x && side group _x == side group player}) - [player]);
		lbSort (_this # 0);
		if (lbSize (_this # 0) == 0) exitWith {
			_display = uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull];
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
			(_this # 0) lbSetCurSel 0;
		} else {
			_id = -1;
			_i = 0;
			_size = ((lbSize (_this # 0)) - 1);
			for "_i" from 0 to _size do {
				if (((_this # 0) lbText _i) == _set) then {
					_id = _i;
				};				
			};
			if (_id >= 0) then {
				(_this # 0) lbSetCurSel _id;
			} else {
				(_this # 0) lbSetCurSel 0;
			};
		};
		_t = serverTime + WL_TIMEOUT_SHORT;
		waitUntil {serverTime > _t || {ctrlText (_this # 2) != _valueText}};
	};
};
