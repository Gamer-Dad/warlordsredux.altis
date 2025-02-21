#include "..\..\warlords_constants.inc"

params [["_fullRefresh", false, [false]]];

call WL2_fnc_purchaseMenuRefresh;

waitUntil {!isNull (uiNamespace getVariable ["BIS_WL_osd_action_voting_title", controlNull])};
private _scale = (0.8 call WL2_fnc_purchaseMenuGetUIScale);
private _side = BIS_WL_playerSide;
private _maxSubordinates = missionNamespace getVariable [format ["BIS_WL_maxSubordinates_%1", _side], 1];
(uiNamespace getVariable "BIS_WL_osd_cp_current") ctrlSetStructuredText parseText format ["<t color='#ffffff' shadow = '2' size = '%2'>%3%1</t>", ((missionNamespace getVariable "fundsDatabaseClients") get (getPlayerUID player)), 1 call WL2_fnc_purchaseMenuGetUIScale, [_side] call WL2_fnc_getMoneySign];
(uiNamespace getVariable "BIS_WL_osd_income_side_2") ctrlSetStructuredText parseText format ["<t size = '%3' shadow = '2'>%1/%2</t>", BIS_WL_matesAvailable, _maxSubordinates, _scale];

if (_fullRefresh) then {
	(uiNamespace getVariable "BIS_WL_osd_sectors_side_1") ctrlSetStructuredText parseText format ["<t size = '%2' align = 'center' shadow = '2'>%1</t>", count (BIS_WL_sectorsArray # 0), 0.6 call WL2_fnc_purchaseMenuGetUIScale];
	(uiNamespace getVariable "BIS_WL_osd_income_side_1") ctrlSetStructuredText parseText format ["<t size = '%2' shadow = '2'>+%1</t>", BIS_WL_playerSide call WL2_fnc_income, _scale];
};

private _cdText = "";
private _playerVehicle = vehicle (getConnectedUAVUnit player);
if (isNull _playerVehicle) then {
	if (vehicle player != player) then {
		_playerVehicle = vehicle player;
	};
};

private _accessControl = [_playerVehicle, player, "full"] call WL2_fnc_accessControl;
if (!isNull _playerVehicle) then {
	if (_accessControl # 0) then {
		private _cooldown = ((_playerVehicle getVariable ["BIS_WL_nextRearm", 0]) - serverTime) max 0;
		if (_cooldown > 0) then {
			private _cooldownDisplay = [_cooldown, "MM:SS"] call BIS_fnc_secondsToString;
			_cdText = format ["<t color = '#ff0000' size = '%1' shadow = '2'>%2</t>", _scale, _cooldownDisplay];
		} else {
			_cdText = format ["<t color = '#00ff00' size = '%1' shadow = '2'>Ready</t>", _scale];
		};
	};
};

private _rearm_possible = uiNamespace getVariable "BIS_WL_osd_rearm_possible";
if !(_accessControl # 0) then {
	private _vehicleOwner = _playerVehicle getVariable ["BIS_WL_ownerAsset", "123"];
	private _vehicleOwnerUnit = _vehicleOwner call BIS_fnc_getUnitByUid;
	_rearm_possible ctrlSetStructuredText parseText format ["<t color = '#ff0000' size = '%1' shadow = '2' align = 'center'>Owner: %2 (%3)</t>", _scale, name _vehicleOwnerUnit, _accessControl # 1];
} else {
	if (BIS_WL_showHint_maintenance) then {
		if (_cdText != "") then {
			_cdText = format ["(%1)", _cdText];
		};
		_rearm_possible ctrlSetStructuredText parseText format ["<t color = '#00ff00' size = '%1' shadow = '2' align = 'center'>%2 %3</t>", _scale, localize "STR_A3_WL_OSD_rearm_possible", _cdText];
	} else {
		if (_cdText != "") then {
			_cdText = format ["Rearm: %1", _cdText];
		};
		_rearm_possible ctrlSetStructuredText parseText format ["<t color = '#ffffff' size = '%1' shadow = '2' align = 'center'>%2</t>", _scale, _cdText];
	};
};