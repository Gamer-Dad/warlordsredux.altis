_location1 = createLocation ["NameLocal", [12293.5,8890.99,0.00144958], 20, 20];
_location1 setText "Skopos Base";

_location2 = createLocation ["NameLocal", [2682.61,22089.7,0.00142598], 20, 20];
_location2 setText "Bomos";

_location3 = createLocation ["NameLocal", [9200.32,21567.7,0.00141716], 20, 20];
_location3 setText "Ammolofi Airfield";

_location4 = createLocation ["NameLocal", [8214.26,10886.3,0.00186157], 20, 20];
_location4 setText "Zaros Solar";

_location5 = createLocation ["NameLocal", [20649.6,15646.5,0.00144196], 20, 20];
_location5 setText "Nifi Solar";

_location6 = createLocation ["NameLocal", [21841.1,20987.2,0.00139046], 20, 20];
_location6 setText "Ghost Hotel";

_location7 = createLocation ["NameLocal", [20957.7,19266.7,0.0012331], 20, 20];
_location7 setText "Georgios Base";

_location8 = createLocation ["NameLocal", [23870.8,23747.5,0.00155449], 20, 20];
_location8 setText "Sideras";

_location9 = createLocation ["NameLocal", [17428.3,13158,0.00154591], 20, 20];
_location9 setText "Pyrgos Base";

_location10 = createLocation ["NameLocal", [14282,13018.3,0.00122261], 20, 20];
_location10 setText "Sagonisi Base";

_location11 = createLocation ["NameLocal", [20977.8,7358.11,0.00152588], 20, 20];
_location11 setText "Selekano Airbase";

_location12 = createLocation ["NameLocal", [3363.47,12621,0.00150859], 20, 20];
_location12 setText "Kavala Beach";

_location13 = createLocation ["NameLocal", [12738.2,16531.8,0.000343323], 20, 20];
_location13 setText "Lakka Factory";

_location13 = createLocation ["NameLocal", [15152.4,17273.3,0.00146675], 20, 20];
_location13 setText "Compound";

_location13 = createLocation ["NameLocal", [23582.1,21097.6,0.0018158], 20, 20];
_location13 setText "Nidasos Base";

_location14 = createLocation ["NameLocal", [23128.7,18689.5,0.00143886], 20, 20];
_location14 setText "Salt Flats";

{
	_sector = _x;

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
} forEach BIS_WL_allSectors;