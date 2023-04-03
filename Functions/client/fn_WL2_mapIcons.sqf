#include "..\warlords_constants.inc"

{(_x displayCtrl 51) ctrlRemoveEventHandler ["Draw", missionNamespace getVariable ["BIS_WL_mapIconHandler", -1]]} forEach allDisplays;

waitUntil {!isNil "BIS_WL_playerSide"};

westColor = [0,0.3,0.6,1];
eastColor = [0.5,0,0,1];
aafColor = [0,0.5,0,1];
civilianColor = [0.4,0,0.5,1];

MRTM_fnc_iconColor = {
	params["_e"];
	if (side _e == west) exitWith {westColor};
	if (side _e == east) exitWith {eastColor};
	if (side _e == resistance) exitWith {aafColor};
	if (side _e == civilian) exitWith {civilianColor};
	civilianColor;
};

MRTM_fnc_iconSize = {
	params ["_e"];
	if (_e isKindOf 'Man') exitWith {20};
	if (_e isKindOf 'StaticWeapon') exitWith {15};
	if (_e isKindOf 'LandVehicle') exitWith {30};
	if (_e isKindOf 'Ship') exitWith {25};
	if (_e isKindOf 'Air') exitWith {30};
	30;
};

MRTM_fnc_iconText = {
	params ["_e"];
	_t = "";
	if (count (crew _e) == 1) then {
		if (isPlayer ((crew _e) # 0)) then {
			_t = format ["%1", name ((crew _e) # 0)];
		} else {
			_t = "";
		};
	} else {
		_playerCrew = (crew _e) select {isPlayer _x};
		{
			if ((_forEachindex + 1) == count _playerCrew) then {
				_t = _t + format ["%1", name _x];
			} else {
				_t = _t + format ["%1, ", name _x];
			};
		} forEach _playerCrew;

		countCrewAi = count ((crew _e) - _playerCrew);
		if (countCrewAi > 0) then {
			_t = _t + format [" +%1", countCrewAi];
		};
	};
	_t;
};

BIS_WL_mapIconHandler = WL_CONTROL_MAP ctrlAddEventHandler ["Draw", {
	{
		if (_x == player) then {
			WL_CONTROL_MAP drawIcon [
				"A3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa",
				[1, 0, 0, 0.8],
				getPosATL _x,
				[_x] call MRTM_fnc_iconSize,
				[_x] call MRTM_fnc_iconSize,
				getDir _x,
				"",
				0,
				WL_MAP_FONT_SIZE,
				"RobotoCondensed",
				"right"
			];
		} else {
			WL_CONTROL_MAP drawIcon [
				getText (configFile >> "CfgVehicles" >> typeOf _x >> "Icon"),
				[_x] call MRTM_fnc_iconColor,
				getPosATL _x,
				[_x] call MRTM_fnc_iconSize,
				[_x] call MRTM_fnc_iconSize,
				getDir _x,
				format [" %1", name _x],
				0,
				WL_MAP_FONT_SIZE,
				"RobotoCondensed",
				"right"
			];
		};
	} forEach (BIS_WL_allWarlords select {side group _x == BIS_WL_playerSide && isNull objectParent _x}); // All players of side on foot

	{
		WL_CONTROL_MAP drawIcon [
			getText (configFile >> "CfgVehicles" >> typeOf _x >> "Icon"),
			[_x] call MRTM_fnc_iconColor,
			getPosATL _x,
			[_x] call MRTM_fnc_iconSize,
			[_x] call MRTM_fnc_iconSize,
			getDir _x,
			[_x] call MRTM_fnc_iconText,
			0,
			WL_MAP_FONT_SIZE,
			"RobotoCondensed",
			"right"
		];
	} forEach (vehicles select {(crew _x) findIf {isPlayer _x} == 0 && (crew _x ) findIf {side group _x == BIS_WL_playerSide} == 0}); // All vehicles

	{
		if (_x != vehicle player) then {
			WL_CONTROL_MAP drawIcon [
				getText (configFile >> "CfgVehicles" >> typeOf _x >> "Icon"),
				if (side player == west) then {westColor} else {eastColor},
				getPosATL _x,
				[_x] call MRTM_fnc_iconSize,
				[_x] call MRTM_fnc_iconSize,
				getDir _x,
				_x getVariable "BIS_WL_iconText",
				0,
				WL_MAP_FONT_SIZE,
				"RobotoCondensed",
            	"right"
			];
		};
	} forEach (WL_PLAYER_VEHS select {(crew _x) findIf {_x == player} != 0}); // All of the players's vehicles

	{
		if !(_x == player && isNull (objectParent _x)) then {
			WL_CONTROL_MAP drawIcon [
				getText (configFile >> "CfgVehicles" >> typeOf _x >> "Icon"),
				[_x] call MRTM_fnc_iconColor,
				getPosATL _x,
				[_x] call MRTM_fnc_iconSize,
				[_x] call MRTM_fnc_iconSize,
				getDir _x,
				format [" %1", name _x],
				0,
				WL_MAP_FONT_SIZE,
				"RobotoCondensed",
				"right"
			];
		};
	} forEach (units (group player));
}];