waituntil {uiSleep 0.1; !isnull (findDisplay 46)};

waitUntil {
	uiSleep 0.1;
	!(isNull ((findDisplay 12) displayCtrl 51));
};

((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw",(format ['_this call %1',(BIS_fnc_iconDrawMap)])];

0 spawn {
	_display1Opened = false;
	_display2opened = false;
	for '_i' from 0 to 1 step 0 do {
		if (!(_display1Opened)) then {
			if (!isNull ((findDisplay 160) displayCtrl 51)) then {
				_display1Opened = TRUE;
				((findDisplay 160) displayCtrl 51) ctrlAddEventHandler ["Draw",(format ['_this call %1',(BIS_fnc_iconDrawMap)])];
			};
		} else {
			if (isNull ((findDisplay 160) displayCtrl 51)) then {
				_display1Opened = false;
			};		
		};
		if (!(_display2opened)) then {
			if (!isNull((findDisplay -1) displayCtrl 500)) then {
				_display2opened = TRUE;
				((findDisplay -1) displayCtrl 500) ctrlAddEventHandler ["Draw",(format ['_this call %1',(BIS_fnc_iconDrawMap)])];
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
					_gps ctrlAddEventHandler ["Draw",(format ['_this call %1',(BIS_fnc_iconDrawGPS)])];
					_e = true;
				};
			};
		} forEach (uiNamespace getVariable 'IGUI_displays');
		uiSleep 0.1;
		if (_e) exitWith {};
	};
};