comment "Magazine Repack";
// Event Listener to Detect Inventory UI Open
// This script has been taken and modified from MAZ_Enhacement_Pack_Core to fit in to the usecase of WL Redux thus none of the original names have been onCommandModeChanged
// Feel free to use this in your usecase as well

uiNamespace setVariable ["WL2_canRepack", true];

["MAZ_inventoryUIOpened", "onEachFrame", {
    if (!isNull (findDisplay 602)) then {
        ["inventoryOpened"] call MAZ_fnc_initializeUI;
    };
}] call BIS_fnc_addStackedEventHandler;

// Initialize the Button and UI Elements
MAZ_fnc_initializeUI = {
    params ["_context"]; // Optionally pass context like "inventoryOpened" or custom triggers

    if (_context == "inventoryOpened") then {
        // Create Repack Button
        with uiNamespace do {
            private _repackButton = (findDisplay 602) ctrlCreate ["RscButtonMenu", 1600];
            _repackButton ctrlSetBackgroundColor [0, 0, 0, 0.6];
            _repackButton ctrlSetPosition [
                0.433069 * safeZoneW + safeZoneX,
                0.7545 * safeZoneH + safeZoneY,
                0.3025 * safeZoneW,
                0.027 * safeZoneH
            ];
            _repackButton ctrlSetEventHandler ["ButtonClick", "0 spawn MAZ_fnc_repackMagazines"];
            _repackButton ctrlSetStructuredText parseText "<t size='0.05'>&#160;</t><br/><t align='center' size='1.01'>Repack Magazines</t>";
            _repackButton ctrlSetFont "PuristaSemiBold";
            _repackButton ctrlCommit 0;
        };

        showChat true; // Ensure chat visibility for debugging or user feedback
    };
};

MAZ_fnc_repackMagazines = {
	if !(uiNamespace getVariable ["WL2_canRepack", false]) exitWith {};

	private _allMags = magazinesAmmoFull player;
	private _primWep = primaryWeapon player;
	private _primWepCompatMags = [_primWep] call BIS_fnc_compatibleMagazines;
	private _secWep = handgunWeapon player;
	private _secWepCompatMags = [_secWep] call BIS_fnc_compatibleMagazines;

	private _ammoCountPrimary = 0;
	private _ammoCountSecondary = 0;
	private _primaryMagazines = [];
	private _secondaryMagazines = [];
	private _fullMagTimeReduction = 0;
	{
		_x params ["_magClass", "_magAmmo", "_loaded", "_magType", "_magLoc"];
		_magClass = toLower _magClass;
		if ("grenade" in _magClass) then {
			continue
		};
		if ("shell" in _magClass) then {
			continue
		};
		if (_magType != -1) then {
			continue
		};
		private _maxMagCapacity = getNumber (configfile >> "CfgMagazines" >> _magClass >> "count");
		if (_magAmmo == _maxMagCapacity) then {
			_fullMagTimeReduction = _fullMagTimeReduction + _magAmmo;
		};
		if (_magClass in _primWepCompatMags) then {
			_ammoCountPrimary = _ammoCountPrimary + _magAmmo;
			_primaryMagazines pushBack [_magClass, _maxMagCapacity, _magLoc];
		};
		if (_magClass in _secWepCompatMags) then {
			_ammoCountSecondary = _ammoCountSecondary + _magAmmo;
			_secondaryMagazines pushBack [_magClass, _maxMagCapacity, _magLoc];
		};
	}forEach _allMags;

	_primaryMagazines = [_primaryMagazines, [], {
		_x select 1
	}, "DESCEND"] call BIS_fnc_sortBy;
	_secondaryMagazines = [_secondaryMagazines, [], {
		_x select 1
	}, "DESCEND"] call BIS_fnc_sortBy;
	{
		player removeMagazine (_x select 0);
	}forEach (_primaryMagazines + _secondaryMagazines);

	private _timeToLoad = (_ammoCountPrimary + _ammoCountSecondary - _fullMagTimeReduction) * 0.25;
	private _magIndex = 0;
	while { _ammoCountPrimary > 0 && _magIndex < (count _primaryMagazines) } do {
		private _mag = _primaryMagazines select _magIndex;
		_mag params ["_type", "_max"];
		private _bullets = if (_ammoCountPrimary < _max) then {
			_ammoCountPrimary
		} else {
			_max
		};
		player addMagazine [_type, _bullets];

		_ammoCountPrimary = _ammoCountPrimary - _bullets;
		_magIndex = _magIndex + 1;
	};
	_magIndex = 0;
	while { _ammoCountSecondary > 0 && _magIndex < (count _secondaryMagazines) } do {
		private _mag = _secondaryMagazines select _magIndex;
		_mag params ["_type", "_max"];
		private _bullets = if (_ammoCountSecondary < _max) then {
			_ammoCountSecondary
		} else {
			_max
		};
		player addMagazine [_type, _bullets];

		_ammoCountSecondary = _ammoCountSecondary - _bullets;
		_magIndex = _magIndex + 1;
	};

	if (_timeToLoad > 0) then {
		[_timeToLoad] spawn MAZ_fnc_repackLoadingBar;
	};
};

MAZ_fnc_repackLoadingBar = {
	params ['_amountOfMags'];
	(findDisplay 602) closeDisplay 2;

	disableSerialization;
	uiNamespace setVariable ["WL2_canRepack", false];
	MAZ_magRepackDone = false;
	with uiNamespace do {
		display = findDisplay 46;

		progressBarBackground = display ctrlCreate ['RscStructuredText', -1];
		progressBarBackground ctrlSetBackgroundColor [0, 0, 0, 0.5];
		progressBarBackground ctrlSetPosition [0.29375 * safeZoneW + safeZoneX, 0.753 * safeZoneH + safeZoneY, 0.4125 * safeZoneW, 0.022 * safeZoneH];
		progressBarBackground ctrlSetFade 1;
		progressBarBackground ctrlCommit 0;
		progressBarBackground ctrlSetFade 0;
		progressBarBackground ctrlCommit 1;

		progressBarForeground = display ctrlCreate ['RscText', -1];
		progressBarForeground ctrlSetBackgroundColor [0.3, 1, 0.2, 0.7];
		progressBarForeground ctrlSetPosition [0.29375 * safeZoneW + safeZoneX, 0.753 * safeZoneH + safeZoneY, 0 * safeZoneW, 0.022 * safeZoneH];
		progressBarForeground ctrlSetFade 1;
		progressBarForeground ctrlCommit 0;
		progressBarForeground ctrlSetFade 0;
		progressBarForeground ctrlSetPosition [0.29375 * safeZoneW + safeZoneX, 0.753 * safeZoneH + safeZoneY, 0.020625 * safeZoneW, 0.022 * safeZoneH];
		progressBarForeground ctrlCommit 1;

		progressBarText = display ctrlCreate ['RscStructuredText', -1];
		progressBarText ctrlSetBackgroundColor [0, 0, 0, 0.5];
		progressBarText ctrlSetPosition [0.29375 * safeZoneW + safeZoneX, 0.753 * safeZoneH + safeZoneY, 0.4125 * safeZoneW, 0.022 * safeZoneH];
		progressBarText ctrlSetStructuredText parseText "<t align='center'>Repacking Mags...</t>";
		progressBarText ctrlSetFade 1;
		progressBarText ctrlCommit 0;
		progressBarText ctrlSetFade 0;
		progressBarText ctrlCommit 1;

		uiSleep 1;
	};

	0 spawn MAZ_fnc_repackAnimation;

	with uiNamespace do {
		progressBarForeground ctrlSetPosition [0.29375 * safeZoneW + safeZoneX, 0.753 * safeZoneH + safeZoneY, 0.4125 * safeZoneW, 0.022 * safeZoneH];
		progressBarForeground ctrlCommit _amountOfMags;

		uiSleep _amountOfMags;

		missionNamespace setVariable ["MAZ_magRepackDone", true];
		player playActionNow "stop";

		progressBarText ctrlSetStructuredText parseText "<t align='center'>Magazines Repacked.</t>";
		progressBarText ctrlCommit 0;

		uiSleep 5;

		progressBarBackground ctrlSetFade 1;
		progressBarBackground ctrlCommit 1;

		progressBarForeground ctrlSetFade 1;
		progressBarForeground ctrlCommit 1;

		progressBarText ctrlSetFade 1;
		progressBarText ctrlCommit 1;

		uiSleep 1;

		ctrlDelete progressBarBackground;
		ctrlDelete progressBarForeground;
		ctrlDelete progressBarText;

		uiNamespace setVariable ["WL2_canRepack", true];
	};
};

MAZ_fnc_repackAnimation = {
	while { !MAZ_magRepackDone && vehicle player == player } do {
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 5;
	};
};