#include "..\warlords_constants.inc"

BIS_WL_sectorLinks = [];
_i = 0;

{
	_sector = _x;
	_sectorPos = position _sector;
	
	_mrkrAreaBig = createMarkerLocal [format ["BIS_WL_sectorMarker_%1_areaBig", _forEachIndex], _sectorPos];
	_mrkrAreaBig setMarkerShapeLocal "ELLIPSE";
	_mrkrAreaBig setMarkerBrushLocal (if (BIS_WL_zoneRestrictionSetting == 1) then {"FDiagonal"} else {"SolidBorder"});
	_mrkrAreaBig setMarkerAlphaLocal 1;
} forEach BIS_WL_allSectors;

{
	_sector = _x;
	_sectorPos = position _sector;
	_area = _sector getVariable "objectArea";
	
	if !(isServer) then {
		if (_sector in WL_BASES) then {
			_sector setVariable ["BIS_WL_value", BIS_WL_baseValue];
		} else {
			_area params ["_a", "_b", "_angle", "_isRectangle"];
			_size = _a * _b * (if (_isRectangle) then {4} else {pi});
			_sector setVariable ["BIS_WL_value", round (_size / 10000)];
		};
	};
	
	_mrkrArea = createMarkerLocal [format ["BIS_WL_sectorMarker_%1_area", _forEachIndex], _sectorPos];
	_mrkrArea setMarkerShapeLocal (if (_area # 3) then {"RECTANGLE"} else {"ELLIPSE"});
	_mrkrArea setMarkerDirLocal (_area # 2);
	_mrkrArea setMarkerBrushLocal "Solid";
	_mrkrArea setMarkerAlphaLocal 1;
	_mrkrArea setMarkerSizeLocal [(_area # 0), (_area # 1)];
} forEach BIS_WL_allSectors;

{
	_sector = _x;
	
	_owner = _sector getVariable "BIS_WL_owner";
	_revealedBy = _sector getVariable "BIS_WL_revealedBy";
	_sectorPos = position _sector;
	
	_mrkrAreaBig = format ["BIS_WL_sectorMarker_%1_areaBig", _forEachIndex];
	_mrkrArea = format ["BIS_WL_sectorMarker_%1_area", _forEachIndex];
	
	_mrkrAreaBig setMarkerColorLocal "ColorBrown";
	
	_mrkrMain = createMarkerLocal [format ["BIS_WL_sectorMarker_%1_main", _forEachIndex], _sectorPos];
	
	_sector setVariable ["BIS_WL_markers", [_mrkrMain, _mrkrArea, _mrkrAreaBig]];
	
	if !(BIS_WL_playerSide in _revealedBy) then {
		_mrkrMain setMarkerTypeLocal "u_installation";
		_mrkrMain setMarkerColorLocal "ColorUNKNOWN";
		_mrkrArea setMarkerColorLocal "ColorUNKNOWN";
		[_sector] spawn BIS_fnc_WL2_sectorRevealHandle;
	};

	[_sector, _owner, _mrkrMain, _mrkrArea, _mrkrAreaBig] spawn BIS_fnc_WL2_sectorOwnershipHandleClient;
	
	_neighbors = (synchronizedObjects _sector) select {typeOf _x == "Logic"};
	_sector setVariable ["BIS_WL_pairedWith", []];
	_pairedWith = _sector getVariable "BIS_WL_pairedWith";
	
	{
		_neighbor = _x;
		_neighborPairedWith = +(_x getVariable ["BIS_WL_pairedWith", []]);
		if !(_sector in _neighborPairedWith) then {
			_pos1 = position _sector;
			_pos2 = position _neighbor;
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
	
	_agentGrp = _sector getVariable "BIS_WL_agentGrp";
	_agentGrp setVariable ["BIS_WL_sector", _sector];
	_agentGrp addGroupIcon ["selector_selectable", [0, 0]];
	_agentGrp setGroupIconParams [[0,0,0,0], "", 1, FALSE];
	
	_name = _sector getVariable ["BIS_WL_name", ""];
	
	if (_name == "") then {
		_nearLocations = nearestLocations [_sector, ["NameLocal", "NameVillage", "NameCity", "NameCityCapital"], 300, _sector];
		if (count _nearLocations > 0) then {
			_location = _nearLocations # 0;
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