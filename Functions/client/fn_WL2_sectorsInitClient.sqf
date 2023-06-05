#include "..\warlords_constants.inc"

private _location1 = createLocation ["NameLocal", [12293.5,8890.99,0.00144958], 20, 20];
_location1 setText "Skopos Base";

private _location2 = createLocation ["NameLocal", [2682.61,22089.7,0.00142598], 20, 20];
_location2 setText "Bomos";

private _location3 = createLocation ["NameLocal", [9200.32,21567.7,0.00141716], 20, 20];
_location3 setText "Ammolofi Airfield";

private _location4 = createLocation ["NameLocal", [8214.26,10886.3,0.00186157], 20, 20];
_location4 setText "Zaros Solar";

private _location5 = createLocation ["NameLocal", [20649.6,15646.5,0.00144196], 20, 20];
_location5 setText "Nifi Solar";

private _location6 = createLocation ["NameLocal", [21841.1,20987.2,0.00139046], 20, 20];
_location6 setText "Ghost Hotel";

private _location7 = createLocation ["NameLocal", [20957.7,19266.7,0.0012331], 20, 20];
_location7 setText "Georgios Base";

private _location8 = createLocation ["NameLocal", [23870.8,23747.5,0.00155449], 20, 20];
_location8 setText "Sideras";

private _location9 = createLocation ["NameLocal", [17428.3,13158,0.00154591], 20, 20];
_location9 setText "Pyrgos Base";

private _location10 = createLocation ["NameLocal", [14282,13018.3,0.00122261], 20, 20];
_location10 setText "Sagonisi Base";

private _location11 = createLocation ["NameLocal", [20977.8,7358.11,0.00152588], 20, 20];
_location11 setText "Selekano Airbase";

private _location12 = createLocation ["NameLocal", [3363.47,12621,0.00150859], 20, 20];
_location12 setText "Kavala Beach";

private _location13 = createLocation ["NameLocal", [12738.2,16531.8,0.000343323], 20, 20];
_location13 setText "Lakka Factory";

private _location14 = createLocation ["NameLocal", [15152.4,17273.3,0.00146675], 20, 20];
_location13 setText "Compound";

private _location15 = createLocation ["NameLocal", [23582.1,21097.6,0.0018158], 20, 20];
_location13 setText "Nidasos Base";

private _location16 = createLocation ["NameLocal", [23128.7,18689.5,0.00143886], 20, 20];
_location14 setText "Salt Flats";




BIS_WL_sectorLinks = [];
private _i = 0;

{
	private _sector = _x;
	private _sectorPos = position _sector;
	
	private _mrkrAreaBig = createMarkerLocal [format ["BIS_WL_sectorMarker_%1_areaBig", _forEachIndex], _sectorPos];
	_mrkrAreaBig setMarkerShapeLocal "ELLIPSE";
	_mrkrAreaBig setMarkerBrushLocal (if (BIS_WL_zoneRestrictionSetting == 1) then {"FDiagonal"} else {"SolidBorder"});
	_mrkrAreaBig setMarkerAlphaLocal 1;
} forEach BIS_WL_allSectors;

{
	private _sector = _x;
	private _sectorPos = position _sector;
	private _area = _sector getVariable "objectArea";
	
	if !(isServer) then {
		if (_sector in WL_BASES) then {
			_sector setVariable ["BIS_WL_value", BIS_WL_baseValue];
		} else {
			_area params ["_a", "_b", "_angle", "_isRectangle"];
			_size = _a * _b * (if (_isRectangle) then {4} else {pi});
			_sector setVariable ["BIS_WL_value", round (_size / 10000)];
		};
	};
	
	private _mrkrArea = createMarkerLocal [format ["BIS_WL_sectorMarker_%1_area", _forEachIndex], _sectorPos];
	_mrkrArea setMarkerShapeLocal (if (_area # 3) then {"RECTANGLE"} else {"ELLIPSE"});
	_mrkrArea setMarkerDirLocal (_area # 2);
	_mrkrArea setMarkerBrushLocal "Solid";
	_mrkrArea setMarkerAlphaLocal 1;
	_mrkrArea setMarkerSizeLocal [(_area # 0), (_area # 1)];
} forEach BIS_WL_allSectors;

{
	private _sector = _x;
	
	private _owner = _sector getVariable "BIS_WL_owner";
	private _revealedBy = _sector getVariable "BIS_WL_revealedBy";
	private _sectorPos = position _sector;
	
	private _mrkrAreaBig = format ["BIS_WL_sectorMarker_%1_areaBig", _forEachIndex];
	private _mrkrArea = format ["BIS_WL_sectorMarker_%1_area", _forEachIndex];
	
	_mrkrAreaBig setMarkerColorLocal "ColorBrown";
	
	private _mrkrMain = createMarkerLocal [format ["BIS_WL_sectorMarker_%1_main", _forEachIndex], _sectorPos];
	
	_sector setVariable ["BIS_WL_markers", [_mrkrMain, _mrkrArea, _mrkrAreaBig]];
	
	if !(BIS_WL_playerSide in _revealedBy) then {
		_mrkrMain setMarkerTypeLocal "u_installation";
		_mrkrMain setMarkerColorLocal "ColorUNKNOWN";
		_mrkrArea setMarkerColorLocal "ColorUNKNOWN";
		[_sector] spawn BIS_fnc_WL2_sectorRevealHandle;
	};

	[_sector, _owner] spawn BIS_fnc_WL2_sectorOwnershipHandleClient;
	
	_neighbors = (synchronizedObjects _sector) select {typeOf _x == "Logic"};
	_sector setVariable ["BIS_WL_pairedWith", []];
	private _pairedWith = _sector getVariable "BIS_WL_pairedWith";
	
	{
		private _neighbor = _x;
		private _neighborPairedWith = +(_x getVariable ["BIS_WL_pairedWith", []]);
		if !(_sector in _neighborPairedWith) then {
			private _pos1 = position _sector;
			private _pos2 = position _neighbor;
			_pairedWith pushBack _neighbor;
			_center = [((_pos1 # 0) + (_pos2 # 0)) / 2, ((_pos1 # 1) + (_pos2 # 1)) / 2];
			_size = ((_pos1 distance2D _pos2) / 2) - 150;
			_dir = _pos1 getDir _pos2;
			_mrkr = createMarkerLocal [format ["BIS_WL_linkMrkr_%1", _i], _center];
			_mrkr setMarkerAlphaLocal WL_CONNECTING_LINE_ALPHA_MAX;
			_mrkr setMarkerShapeLocal "RECTANGLE";
			_mrkr setMarkerDirLocal _dir;
			_mrkr setMarkerSizeLocal [WL_CONNECTING_LINE_AXIS, _size];
			BIS_WL_sectorLinks pushBack _mrkr;
			{_x setVariable ["BIS_WL_linkMarkerIndex", _i]} forEach [_sector, _neighbor];
			_i = _i + 1;
		};
	} forEach _neighbors;
	
	private _agentGrp = _sector getVariable "BIS_WL_agentGrp";
	_agentGrp setVariable ["BIS_WL_sector", _sector];
	_agentGrp addGroupIcon ["selector_selectable", [0, 0]];
	_agentGrp setGroupIconParams [[0,0,0,0], "", 1, FALSE];
	
	private _name = _sector getVariable ["BIS_WL_name", ""];
	
	if (_name == "") then {
		private _nearLocations = nearestLocations [_sector, ["NameLocal", "NameVillage", "NameCity", "NameCityCapital"], 300, _sector];
		if (count _nearLocations > 0) then {
			private _location = _nearLocations # 0;
			_name = text _location;
		} else {
			_name = format [localize "STR_A3_WL_default_sector", _forEachIndex + 1];
		};
	} else {
		if (isLocalized _name) then {_name = localize _name};
	};
	
	_sector setVariable ["BIS_WL_name", _name];
	
	_sector spawn BIS_fnc_WL2_handleEnemyCapture;
	
} forEach BIS_WL_allSectors;