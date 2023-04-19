#include "..\warlords_constants.inc"

{(_x displayCtrl 51) ctrlRemoveEventHandler ["Draw", missionNamespace getVariable ["BIS_WL_mapIconHandler", -1]]} forEach allDisplays;

waitUntil {!isNil "BIS_WL_playerSide"};

westColor = [0,0.3,0.6,1];
eastColor = [0.5,0,0,1];
aafColor = [0,0.5,0,1];
civilianColor = [0.4,0,0.5,1];

MRTM_fnc_iconColor = {
	params ["_t"];
	if (side group player == west) exitWith {westColor};
	if (side group player == east) exitWith {eastColor};
	if (side group player == resistance) exitWith {aafColor};
	if (side group player == civilian) exitWith {civilianColor};
	civilianColor;
};

MRTM_fnc_isDowned = {
	params ["_p"];
	_result = false;
	if ((lifeState _p) isEqualTo 'INCAPACITATED') exitWith {true};
	_result;
};

MRTM_fnc_iconType = {
	params ["_p"];
	private _vt = typeOf (vehicle _p);
	_r = "";
	if (vehicle _p == _p) then {
		_r = getText (configFile >> 'CfgVehicles' >> _vt >> 'icon');
	} else {
		_r = "";
	};
	_r;
};

MRTM_fnc_iconSize = {
	params ["_e"];
	if (_e isKindOf 'Man') exitWith {22};
	if (_e isKindOf 'StaticWeapon') exitWith {22};
	if (_e isKindOf 'LandVehicle') exitWith {26};
	if (_e isKindOf 'Ship') exitWith {24};
	if (_e isKindOf 'Air') exitWith {24};
	22;
};

MRTM_fnc_getDir = {
	params ["_t"];
	_dir = getDirVisual _t;
	_dir;
};

MRTM_fnc_getPos = {
	params ["_t"];
	_pos = getPosASLVisual _t;
	_pos;
};

MRTM_fnc_iconText = {
	params ["_t"];
	_vd = getText (configFile >> 'CfgVehicles' >> (typeOf _t) >> 'displayName');
	_text = "";
	if (vehicle _t isKindOf 'CAManBase') then {
		if (isPlayer _t) then {
			_text = name _t;
		} else {
			_text = format ["%1 [AI]", name _t];
		};
	} else {
		if (count (crew _t) == 1) then {
			if (isPlayer ((crew _t) select 0)) then {
				_text = format ["%1", name ((crew _t) select 0)];
			} else {
				_text = format ["%1 [AI]", name ((crew _t) select 0)];
			};
		} else {
			_playerCrew = (crew _t) select {isPlayer _x};
			{
				if ((_forEachindex + 1) == count _playerCrew) then {
					_text= _text+ format ["%1", name _x];
				} else {
					_text= _text+ format ["%1, ", name _x];
				};
			} forEach _playerCrew;

			countCrewAi = count ((crew _t) - _playerCrew);
			if (countCrewAi > 0) then {
				_text = _text + format ["+%1", countCrewAi];
			};
		};
	};

	if (unitIsUAV _t) then {
		if (isUAVConnected _t) then {
			_op = (UAVControl _t) select 0;
			_text = format ["%1", name _op];
		} else {
			_text = format ["[AUTO] [%1]", _vd];
		};
	};
	_text;
};

MRTM_fnc_iconDrawMap = {
	_m = _this select 0;
	{
		if (!isNull _x) then {
			_ve = vehicle _x;
			if (alive _ve) then {
				if (_ve isEqualTo (vehicle player)) then {
					_m drawIcon [
						'a3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa',
						[1,0,0,0.75],
						[_x] call MRTM_fnc_getPos,
						24,
						24,
						[_x] call MRTM_fnc_getDir,
						"",
						0,
						0.025,
						"TahomaB",
						"right"
					];
				};
				_m drawIcon [
					[_x] call MRTM_fnc_iconType,
					[_x] call MRTM_fnc_iconColor,
					[_x] call MRTM_fnc_getPos,
					[_x] call MRTM_fnc_iconSize,
					[_x] call MRTM_fnc_iconSize,
					[_x] call MRTM_fnc_getDir,
					[_x] call MRTM_fnc_iconText,
					1,
					0.025,
					"TahomaB",
					"right"
				];
			};
		};
	} count ((allUnits) select {side group _x == side group player && isNull objectParent _x});
	{
		if (!isNull _x) then {
			_ve = vehicle _x;
			if (alive _ve) then {
				_m drawIcon [
					[_x] call MRTM_fnc_iconType,
					[_x] call MRTM_fnc_iconColor,
					[_x] call MRTM_fnc_getPos,
					[_x] call MRTM_fnc_iconSize,
					[_x] call MRTM_fnc_iconSize,
					[_x] call MRTM_fnc_getDir,
					[_x] call MRTM_fnc_iconText,
					1,
					0.025,
					"TahomaB",
					"right"
				];
			};
		};	
	} count (vehicles select {(crew _x) findIf {isPlayer _x} == 0 && (crew _x ) findIf {side group _x == side group player} == 0});
	{
		if (!isNull _x) then {
			_ve = vehicle _x;
			if (alive _ve) then {
				_m drawIcon [
					[_x] call MRTM_fnc_iconType,
					[_x] call MRTM_fnc_iconColor,
					[_x] call MRTM_fnc_getPos,
					[_x] call MRTM_fnc_iconSize,
					[_x] call MRTM_fnc_iconSize,
					[_x] call MRTM_fnc_getDir,
					[_x] call MRTM_fnc_iconText,
					1,
					0.025,
					"TahomaB",
					"right"
				];
			};
		};		
	} count ((allUnitsUAV) select {side group (crew _x select 0) == side group player});
	{
		if (!isNull _x) then {
			_ve = vehicle _x;
			if (alive _ve) then {
				if (_x != vehicle player) then {
					_m drawIcon [
						[_x] call MRTM_fnc_iconType,
						[_x] call MRTM_fnc_iconColor,
						[_x] call MRTM_fnc_getPos,
						[_x] call MRTM_fnc_iconSize,
						[_x] call MRTM_fnc_iconSize,
						[_x] call MRTM_fnc_getDir,
						[_x] call MRTM_fnc_iconText,
						1,
						0.025,
						"TahomaB",
						"right"
					];
				};
			};
		};	
	} count (WL_PLAYER_VEHS select {(crew _x) findIf {_x == player} != 0});
};

waitUntil {
	uiSleep 0.1; 
	!(isNull (findDisplay 12));
};

((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ['Draw',(format ['_this call %1',(MRTM_fnc_iconDrawMap)])];

0 spawn {
	_display1Opened = false;
	_display2opened = false;
	for '_x' from 0 to 1 step 0 do {
		if (!(_display1Opened)) then {
			if (!isNull ((findDisplay 160) displayCtrl 51)) then {
				_display1Opened = TRUE;
				((findDisplay 160) displayCtrl 51) ctrlAddEventHandler ['Draw',(format ['_this call %1',(MRTM_fnc_iconDrawMap)])];
			};
		} else {
			if (isNull ((findDisplay 160) displayCtrl 51)) then {
				_display1Opened = false;
			};		
		};
		if (!(_display2opened)) then {
			if (!isNull((findDisplay -1) displayCtrl 500)) then {
				_display2opened = TRUE;
				((findDisplay -1) displayCtrl 500) ctrlAddEventHandler ['Draw',(format ['_this call %1',(MRTM_fnc_iconDrawMap)])];
			};
		} else {
			if (isNull ((findDisplay -1) displayCtrl 500)) then {
				_display2opened = false;
			};		
		};
		uiSleep 0.25;
	};
};