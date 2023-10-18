params ["_asset"];

createDialog ["rearmMenu", true];
assetGlbl = _asset;

_asset spawn {
	params ["_asset"];
	while {!isNull (findDisplay 1000)} do {
		private _cooldown = (((_asset getVariable "BIS_WL_nextRearm") - serverTime) max 0);
		private _nearbyVehicles = (_asset nearObjects ["All", 30]) select {alive _x};
		private _rearmVehicleIndex = _nearbyVehicles findIf {getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "transportAmmo") > 0};
		private _amount = (_nearbyVehicles # _rearmVehicleIndex) getvariable ["GOM_fnc_ammocargo", 0];
		private _amountText = format ["(%1)", (_amount call GOM_fnc_kgToTon)];
		ctrlSetText [1, (if (_cooldown == 0) then {(format ["%1 %2", localize "STR_rearm", _amountText])} else {[_cooldown, "MM:SS"] call BIS_fnc_secondsToString})];
		sleep 1;
	};
};

_asset call BIS_fnc_getCamos;
_asset call BIS_fnc_getHulls;
_asset call BIS_fnc_getExtras;

((findDisplay 1000) displayCtrl 1501) ctrlAddEventHandler ["LBSelChanged", {
	params ["_control", "_lbCurSel", "_lbSelection"];
	_asset = assetGlbl;
	_anim = ((parseSimpleArray (lbData [1501, _lbCurSel])) # 0);
	_animPhase = ((parseSimpleArray (lbData [1501, _lbCurSel])) # 1);
	_state = 1;
	if (_animPhase == 1) then {
		_state = 0;
	};
	if (_animPhase == 0) then {
		_state = 1;
	};
	[_asset, _anim, _state, _lbCurSel, 1501] spawn BIS_fnc_animate;
}];

((findDisplay 1000) displayCtrl 1500) ctrlAddEventHandler ["LBSelChanged", {
	params ["_control", "_lbCurSel", "_lbSelection"];
	_asset = assetGlbl;
	_anim = ((parseSimpleArray (lbData [1500, _lbCurSel])) # 0);
	_animPhase = ((parseSimpleArray (lbData [1500, _lbCurSel])) # 1);
	_state = 1;
	if (_animPhase == 1) then {
		_state = 0;
	};
	if (_animPhase == 0) then {
		_state = 1;
	};
	[_asset, _anim, _state, _lbCurSel, 1500] spawn BIS_fnc_animate;
}];

((findDisplay 1000) displayCtrl 1503) ctrlAddEventHandler ["LBSelChanged", {
	params ["_control", "_lbCurSel", "_lbSelection"];
	_asset = assetGlbl;
	_anim = ((parseSimpleArray (lbData [1503, _lbCurSel])) # 0);
	_animPhase = ((parseSimpleArray (lbData [1503, _lbCurSel])) # 1);
	_state = 1;
	if (_animPhase == 1) then {
		_state = 0;
	};
	if (_animPhase == 0) then {
		_state = 1;
	};
	[_asset, _anim, _state, _lbCurSel, 1503] spawn BIS_fnc_animate;
}];

((findDisplay 1000) displayCtrl 1) ctrlAddEventHandler ["buttonClick", {
	params ["_control"];
	_asset = assetGlbl;
	private _cooldown = (((_asset getVariable "BIS_WL_nextRearm") - serverTime) max 0);
	private _cooldown = (((_asset getVariable "BIS_WL_nextRearm") - serverTime) max 0);
	private _nearbyVehicles = (_asset nearObjects ["All", 30]) select {alive _x};
	private _rearmVehicleIndex = _nearbyVehicles findIf {getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "transportAmmo") > 0};
	private _amount = (_nearbyVehicles # _rearmVehicleIndex) getvariable ["GOM_fnc_ammocargo", 0];
	if (_cooldown == 0 && {_amount > 0}) then {
		_asset spawn BIS_fnc_rearm;
	} else {
		_asset spawn BIS_fnc_WL2_vehicleRearm;	
	};
}];