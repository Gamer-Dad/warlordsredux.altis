#include "..\warlords_constants.inc"


for [{_i = 100}, {_i <= 114}, {_i = _i + 1}] do {
	(_display displayCtrl _i) ctrlEnable FALSE;
};

_purchase_bounty_background = _display displayCtrl 121;
_purchase_bounty_units = _display displayCtrl 122;
_purchase_bounty_amount = _display displayCtrl 123;
_purchase_bounty_cp_title = _display displayCtrl 124;
_purchase_bounty_ok = _display displayCtrl 125;
_purchase_bounty_cancel = _display displayCtrl 126;

_purchase_bounty_background ctrlSetFade 0;
_purchase_bounty_background ctrlCommit 0;

_purchase_bounty_units ctrlSetFade 0;
_purchase_bounty_units ctrlEnable TRUE;
_purchase_bounty_units ctrlCommit 0;

_purchase_bounty_amount ctrlSetFade 0;
_purchase_bounty_amount ctrlEnable TRUE;
_purchase_bounty_amount ctrlCommit 0;

_purchase_bounty_amount ctrlSetText str (ceil (((missionNamespace getVariable "fundsDatabaseClients") get (getPlayerUID player)) / 2));

_purchase_bounty_cp_title ctrlSetFade 0;
_purchase_bounty_cp_title ctrlEnable TRUE;
_purchase_bounty_cp_title ctrlCommit 0;

_purchase_bounty_ok ctrlSetFade 0;
_purchase_bounty_ok ctrlEnable TRUE;
_purchase_bounty_ok ctrlCommit 0;

_purchase_bounty_cancel ctrlSetFade 0;
_purchase_bounty_cancel ctrlEnable TRUE;
_purchase_bounty_cancel ctrlCommit 0;

{_purchase_bounty_units lbAdd name _x} forEach (BIS_WL_allWarlords select {(isPlayer _x) && (side group _x != side group player)});
_purchase_bounty_units lbSetCurSel 0;

[_purchase_bounty_units, _purchase_bounty_ok, _purchase_bounty_amount] spawn {
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
			uiNamespace setVariable ["BIS_WL_bountyPossible", TRUE];
			(_this # 1) ctrlSetBackgroundColor _color;
			(_this # 1) ctrlSetTextColor [1, 1, 1, 1];
			(_this # 1) ctrlSetTooltip "";
		} else {
			uiNamespace setVariable ["BIS_WL_bountyPossible", FALSE];
			(_this # 1) ctrlSetBackgroundColor [(_color # 0) * 0.5, (_color # 1) * 0.5, (_color # 2) * 0.5, _color # 3];
			(_this # 1) ctrlSetTextColor [0.5, 0.5, 0.5, 1];
			if (_value > 0) then {(_this # 1) ctrlSetTooltip localize "STR_A3_WL_low_funds"} else {(_this # 1) ctrlSetTooltip ""};
		};
		_set = (_this # 0) lbText lbCurSel (_this # 0);
		lbClear (_this # 0);
		{(_this # 0) lbAdd name _x} forEach (BIS_WL_allWarlords select {(isPlayer _x) && (side group _x != side group player)});
		lbSort (_this # 0);
		if (lbSize (_this # 0) == 0) exitWith {
			_display = uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull];
			for [{_i = 100}, {_i <= 114}, {_i = _i + 1}] do {
				(_display displayCtrl _i) ctrlEnable TRUE;
			};
			for [{_i = 121}, {_i <= 126}, {_i = _i + 1}] do {
				(_display displayCtrl _i) ctrlEnable FALSE;
				(_display displayCtrl _i) ctrlSetFade 1;
				(_display displayCtrl _i) ctrlCommit 0;
			};
			playSound "AddItemFailed";
		};
		if (_set == "") then {
			(_this # 0) lbSetCurSel 0;
		} else {
			_id = -1;
			for [{_i = 0}, {_i < lbSize (_this # 0)}, {_i = _i + 1}] do {
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
		_t = WL_SYNCED_TIME + WL_TIMEOUT_SHORT;
		waitUntil {WL_SYNCED_TIME > _t || ctrlText (_this # 2) != _valueText};
	};
};