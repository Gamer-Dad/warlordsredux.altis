#include "..\warlords_constants.inc"
sleep 2;

waituntil {!isnull (findDisplay 46)};
waitUntil {!isNil "BIS_WL_playerSide"};

westColor = [0,0.3,0.6,1];
eastColor = [0.5,0,0,1];

MRTM_fnc_iconColor = {
	params ["_t"];
	if ((getPlayerChannel _t) in [1,2]) exitWith {[0,0.8,0,1]};
	if (_t in (units player)) exitWith {[0,0.4,0,1]};
	if (side group player == west) exitWith {westColor};
	if (side group player == east) exitWith {eastColor};
	if (side group player == resistance) exitWith {[0,0.6,0,1]};
	if (side group player == civilian) exitWith {[0.4,0,0.5,1]};
	[0.4,0,0.5,1];
};

MRTM_fnc_iconType = {
	params ["_p"];
	private _vt = typeOf (vehicle _p);
	_i = getText (configFile >> 'CfgVehicles' >> _vt >> 'icon');
	if ((getPlayerChannel _p) in [1,2]) then {
		_i = "a3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa";
	};
	if (((getPlayerChannel _p) == 5) && {((player distance2D _p) < 100)}) then {
		_i = "a3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa";
	};
	_i;
};

MRTM_fnc_iconSize = {
	params ["_e"];
	if (_e isKindOf 'Man') exitWith {23};
	if (_e isKindOf 'StaticWeapon') exitWith {23};
	if (_e isKindOf 'LandVehicle') exitWith {27};
	if (_e isKindOf 'Ship') exitWith {25};
	if (_e isKindOf 'Air') exitWith {25};
	23;
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
	if ((!(alive _t)) && {_t isKindOf 'CAManBase'}) then {
		_text = format ["%1 [K.I.A.]", (name _t)];
	} else {
		if (vehicle _t isKindOf 'CAManBase') then {
			if (isPlayer _t) then {
				_text = (name _t);
			} else {
				_text = format ["%1 [AI]", (name _t)];
			};
		} else {
			if (count (crew _t) == 1) then {
				_crew = ((crew _t) select 0);
				if (isPlayer _crew) then {
					if (alive _crew) then {
						_text = (name _crew);
					};
				} else {
					if (alive _crew) then {
						_text = format ["%1 [AI]", name ((crew _t) select 0)];
					};
				};
				_text = format ["%1: %2", _vd, _text];
			} else {
				if (count (crew _t) == 0) then {
					_text = _vd;
				} else {
					_playerCrew = (crew _t) select {isPlayer _x && {alive _x}};
					{
						if ((_forEachindex + 1) == count _playerCrew) then {
							_text = _text + (name _x);
						} else {
							_text = _text + format ["%1, ", (name _x)];
						};
					} forEach _playerCrew;

					countCrewAi = count (((crew _t) - _playerCrew) select {alive _x});
					if (countCrewAi > 0) then {
						_text = _text + format [" +%1", countCrewAi];
					};
					_text = format ["%1: %2", _vd, _text];
				};
			};
		};
	};

	if (unitIsUAV _t) then {
		if (isUAVConnected _t) then {
			_op = (UAVControl _t) select 0;
			_text = format ["%1: %2", _vd, (name _op)];
		} else {
			_text = format ["[AUTO] %1", _vd];
		};
	};
	_text;
};

MRTM_fnc_iconTextSectorScan = {
	params ["_t"];
	_vd = getText (configFile >> 'CfgVehicles' >> (typeOf _t) >> 'displayName');
	_text = "";
	if !(vehicle _t isKindOf "CAManBase") then {
		_text = _vd;
	};
	_text;
};

MRTM_fnc_iconDrawMap = {
	_m = _this select 0;
	{
		_m drawIcon [
			[_x] call MRTM_fnc_iconType,
			if (side group _x == west) then {westColor} else {eastColor},
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
	} forEach ((allUnits) select {(player getVariable ["reward_active", false]) && {(side group _x == BIS_WL_enemySide) && {(isNull objectParent _x) && {(alive _x)}}}});		
	if !(isNull BIS_WL_highlightedSector) then {
		_m drawIcon [
			"A3\ui_f\data\map\groupicons\selector_selectedMission_ca.paa",
			[1,1,1,0.5],
			BIS_WL_highlightedSector,
			60,
			60,
			(time * 75) % 360
		];
	};
	if (BIS_WL_currentSelection == WL_ID_SELECTION_ORDERING_NAVAL) then {
		_cursorPos = _m ctrlMapScreenToWorld getMousePosition;
		_isWater = surfaceIsWater _cursorPos;
		_m drawIcon [
			"A3\ui_f\data\map\groupicons\selector_selectedMission_ca.paa",
			if (_isWater) then {[1,1,1,0.5]} else {[1,1,1,0.1]},
			_cursorPos,
			60,
			60,
			if (_isWater) then {(time * 75) % 360} else {0}
		];
	};
	if (!isNull BIS_WL_mapAssetTarget) then {
		_m drawIcon [
			"A3\ui_f\data\map\groupicons\selector_selectedMission_ca.paa",
			[1,1,1,1],
			BIS_WL_mapAssetTarget,
			40,
			40,
			(time * 75) % 360
		];
	};
	{
		_m drawIcon [
			"\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa",
			[1, 0, 0, 1],
			[_x] call MRTM_fnc_getPos,
			20,
			20,
			0,
			[_x] call MRTM_fnc_iconText,
			1,
			0.025,
			"TahomaB",
			"right"
		];
	} forEach ((allPlayers) select {(!alive _x) && {(side group _x == side group player)}});
	{
		private _revealTrigger = _x getVariable "BIS_WL_revealTrigger";
		{
			if (!isNull _x) then {
				_m drawIcon [
					[_x] call MRTM_fnc_iconType,
					if (side group _x == Independent) then {[0,0.6,0,1]} else {if (side group _x == west) then {westColor} else {eastColor}},
					[_x] call MRTM_fnc_getPos,
					[_x] call MRTM_fnc_iconSize,
					[_x] call MRTM_fnc_iconSize,
					[_x] call MRTM_fnc_getDir,
					[_x] call MRTM_fnc_iconTextSectorScan,
					1,
					0.025,
					"TahomaB",
					"right"
				];
			};
		} forEach (((list _revealTrigger) - WL_PLAYER_VEHS) select {(side group _x != side group player) && {(alive _x) && {((side group _x) in BIS_WL_sidesArray)}}});
	} forEach BIS_WL_currentlyScannedSectors;
	{
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
	} forEach ((allPlayers) select {(side group _x == side group player) && {(isNull objectParent _x) && {(alive _x)}}});
	{
		if (!isNull _x) then {
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
	} forEach ((allUnits) select {(side group (crew _x select 0) == side group player) && {(alive _x) && {(isNull objectParent _x) && {typeOf _x != "Logic"}}}});
	{
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
	} forEach ((units player) select {(alive _x) && {(isNull objectParent _x) && {_x != player}}});
	{
		if (!isNull _x) then {
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
	} forEach ((entities [["Tank", "Car", "Plane", "Helicopter"], ["Logic"], false, true]) select {((side _x) == (side group player)) && {(alive _x) && {(typeOf _x != "B_Truck_01_medical_F") && {(typeOf _x != "O_Truck_03_medical_F")}}}});
	{
		if (!isNull _x) then {
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
	} forEach ((allUnitsUAV) select {(side group (crew _x select 0) == side group player) && {(alive _x)}});
	{
		if (!isNull _x) then {
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
	} forEach ((missionNamespace getVariable [format ["BIS_WL_%1_ownedVehicles", getPlayerUID player], []]) select {(alive _x) && {(typeOf _x != "B_Truck_01_medical_F") && {(typeOf _x != "O_Truck_03_medical_F") && {(typeOf _x != "B_Slingload_01_Medevac_F") && {(typeOf _x != "Land_Pod_Heli_Transport_04_medevac_F")}}}}});
	if (side group player == west) then {
		{
			_m drawIcon [
				[_x] call MRTM_fnc_iconType,
				[_x] call MRTM_fnc_iconColor,
				[_x] call MRTM_fnc_getPos,
				[_x] call MRTM_fnc_iconSize,
				[_x] call MRTM_fnc_iconSize,
				[_x] call MRTM_fnc_getDir,
				"Spawn truck",
				1,
				0.025,
				"TahomaB",
				"right"
			];
		} forEach (vehicles select {(typeOf _x == "B_Truck_01_medical_F") && {alive _x}});

		{
			_m drawIcon [
				[_x] call MRTM_fnc_iconType,
				[_x] call MRTM_fnc_iconColor,
				[_x] call MRTM_fnc_getPos,
				[_x] call MRTM_fnc_iconSize,
				[_x] call MRTM_fnc_iconSize,
				[_x] call MRTM_fnc_getDir,
				"Medical container",
				1,
				0.025,
				"TahomaB",
				"right"
			];
		} forEach (vehicles select {(typeOf _x == "B_Slingload_01_Medevac_F") && {alive _x}});
	};
	if (side group player == east) then {
		{
			_m drawIcon [
				[_x] call MRTM_fnc_iconType,
				[_x] call MRTM_fnc_iconColor,
				[_x] call MRTM_fnc_getPos,
				[_x] call MRTM_fnc_iconSize,
				[_x] call MRTM_fnc_iconSize,
				[_x] call MRTM_fnc_getDir,
				"Spawn truck",
				1,
				0.025,
				"TahomaB",
				"right"
			];
		} forEach (vehicles select {(typeOf _x == "O_Truck_03_medical_F") && {alive _x}});

		{
			_m drawIcon [
				[_x] call MRTM_fnc_iconType,
				[_x] call MRTM_fnc_iconColor,
				[_x] call MRTM_fnc_getPos,
				[_x] call MRTM_fnc_iconSize,
				[_x] call MRTM_fnc_iconSize,
				[_x] call MRTM_fnc_getDir,
				"Medical pod",
				1,
				0.025,
				"TahomaB",
				"right"
			];
		} forEach (vehicles select {(typeOf _x == "Land_Pod_Heli_Transport_04_medevac_F") && {alive _x}});
	};
};

MRTM_fnc_iconDrawGPS = {
	if (
		(!('MinimapDisplay' in ((infoPanel 'left') + (infoPanel 'right')))) ||
		{(visibleMap)}
	) exitWith {};	
	_m = _this select 0;
	{
		_m drawIcon [
			"\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa",
			[1, 0, 0, 1],
			[_x] call MRTM_fnc_getPos,
			20,
			20,
			0,
			[_x] call MRTM_fnc_iconText,
			1,
			0.025,
			"TahomaB",
			"right"
		];
	} forEach ((allPlayers) select {(!alive _x) && {(side group _x == side group player) && {(isNull objectParent _x)}}});
	{
		if !(_x isEqualTo player) then {
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
	} forEach ((allPlayers) select {(side group _x == side group player) && {(isNull objectParent _x) && {(alive _x)}}});
	{
		if (!isNull _x) then {
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
	} forEach ((allUnits) select {(side group (crew _x select 0) == side group player) && {(alive _x) && {(isNull objectParent _x) && {typeOf _x != "Logic"}}}});
	{
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
	} forEach ((units player) select {(alive _x) && {(isNull objectParent _x) && {_x != player}}});	
	{
		private _revealTrigger = _x getVariable "BIS_WL_revealTrigger";
		{
			if (!isNull _x) then {
				_m drawIcon [
					[_x] call MRTM_fnc_iconType,
					if (side group _x == Independent) then {[0,0.6,0,1]} else {if (side group _x == west) then {westColor} else {eastColor}},
					[_x] call MRTM_fnc_getPos,
					[_x] call MRTM_fnc_iconSize,
					[_x] call MRTM_fnc_iconSize,
					[_x] call MRTM_fnc_getDir,
					"",
					1,
					0.025,
					"TahomaB",
					"right"
				];
			};
		} forEach (((list _revealTrigger) - WL_PLAYER_VEHS) select {(side group _x != side group player) && {(alive _x) && {((side group _x) in BIS_WL_sidesArray)}}});
	} forEach BIS_WL_currentlyScannedSectors;
	{
		if (!isNull _x) then {
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
	} forEach ((entities [["Tank", "Car", "Plane", "Helicopter"], ["Logic"], false, true]) select {(side _x == side group player) && {(alive _x) && {(typeOf _x != "B_Truck_01_medical_F") && {(typeOf _x != "O_Truck_03_medical_F")}}}});
	if (side group player == west) then {
		{
			_m drawIcon [
				[_x] call MRTM_fnc_iconType,
				[_x] call MRTM_fnc_iconColor,
				[_x] call MRTM_fnc_getPos,
				[_x] call MRTM_fnc_iconSize,
				[_x] call MRTM_fnc_iconSize,
				[_x] call MRTM_fnc_getDir,
				"Spawn truck",
				1,
				0.025,
				"TahomaB",
				"right"
			];
		} forEach (vehicles select {(typeOf _x == "B_Truck_01_medical_F") && {alive _x}});

		{
			_m drawIcon [
				[_x] call MRTM_fnc_iconType,
				[_x] call MRTM_fnc_iconColor,
				[_x] call MRTM_fnc_getPos,
				[_x] call MRTM_fnc_iconSize,
				[_x] call MRTM_fnc_iconSize,
				[_x] call MRTM_fnc_getDir,
				"Medical container",
				1,
				0.025,
				"TahomaB",
				"right"
			];
		} forEach (vehicles select {(typeOf _x == "B_Slingload_01_Medevac_F") && {alive _x}});
	};
	if (side group player == east) then {
		{
			_m drawIcon [
				[_x] call MRTM_fnc_iconType,
				[_x] call MRTM_fnc_iconColor,
				[_x] call MRTM_fnc_getPos,
				[_x] call MRTM_fnc_iconSize,
				[_x] call MRTM_fnc_iconSize,
				[_x] call MRTM_fnc_getDir,
				"Spawn truck",
				1,
				0.025,
				"TahomaB",
				"right"
			];
		} forEach (vehicles select {(typeOf _x == "O_Truck_03_medical_F") && {alive _x}});

		{
			_m drawIcon [
				[_x] call MRTM_fnc_iconType,
				[_x] call MRTM_fnc_iconColor,
				[_x] call MRTM_fnc_getPos,
				[_x] call MRTM_fnc_iconSize,
				[_x] call MRTM_fnc_iconSize,
				[_x] call MRTM_fnc_getDir,
				"Medical pod",
				1,
				0.025,
				"TahomaB",
				"right"
			];
		} forEach (vehicles select {(typeOf _x == "Land_Pod_Heli_Transport_04_medevac_F") && {alive _x}});
	};
};

waitUntil {
	uiSleep 0.1; 
	!(isNull ((findDisplay 12) displayCtrl 51));
};

((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw",(format ['_this call %1',(MRTM_fnc_iconDrawMap)])];

0 spawn {
	_display1Opened = false;
	_display2opened = false;
	for '_i' from 0 to 1 step 0 do {
		if (!(_display1Opened)) then {
			if (!isNull ((findDisplay 160) displayCtrl 51)) then {
				_display1Opened = TRUE;
				((findDisplay 160) displayCtrl 51) ctrlAddEventHandler ["Draw",(format ['_this call %1',(MRTM_fnc_iconDrawMap)])];
			};
		} else {
			if (isNull ((findDisplay 160) displayCtrl 51)) then {
				_display1Opened = false;
			};		
		};
		if (!(_display2opened)) then {
			if (!isNull((findDisplay -1) displayCtrl 500)) then {
				_display2opened = TRUE;
				((findDisplay -1) displayCtrl 500) ctrlAddEventHandler ["Draw",(format ['_this call %1',(MRTM_fnc_iconDrawMap)])];
			};
		} else {
			if (isNull ((findDisplay -1) displayCtrl 500)) then {
				_display2opened = false;
			};		
		};
		uiSleep 0.2;
	};
};

0 spawn {
	private _gps = controlNull;
	private _e = false;
	for "_i" from 0 to 1 step 0 do {
		{
			if (["311", (str _x), false] call BIS_fnc_inString) then {
				if (!isNull (_x displayCtrl 101)) exitWith {
					_gps = (_x displayCtrl 101);
					_gps ctrlRemoveAllEventHandlers "Draw";
					_gps ctrlAddEventHandler ["Draw",(format ['_this call %1',(MRTM_fnc_iconDrawGPS)])];
					_e = true;
				};
			};
		} forEach (uiNamespace getVariable 'IGUI_displays');
		uiSleep WL_TIMEOUT_SHORT;
		if (_e) exitWith {};
	};
};