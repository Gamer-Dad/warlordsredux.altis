private _sectorConfig = missionConfigFile >> "CfgWarlordSectors";
private _sectors = "true" configClasses _sectorConfig;

private _sectorRectangles = [];
private _sectorEllipses = [];
private _sectorIcons = [];
private _sectorLines = [];

private _sectorLocations = createHashMap;
{
    private _sector = _x;

    private _sectorClass = configName _sector;
    private _name = getText (_sector >> "name");
    private _location = getArray (_sector >> "location");
    private _area = getArray (_sector >> "area");

    _sectorLocations set [_sectorClass, _location];

    private _isRectangle = _area # 3 == 1;
    if (_isRectangle) then {
        _sectorRectangles pushBack [
            _location,
            _area # 0,
            _area # 1,
            _area # 2,
            [1, 1, 1, 0.4],
            "#(rgb,8,8,3)color(0.5,0.5,0.5,1)"
        ];
    } else {
        _sectorEllipses pushBack [
            _location,
            _area # 0,
            _area # 1,
            _area # 2,
            [1, 1, 1, 0.4],
            "#(rgb,8,8,3)color(0.5,0.5,0.5,1)"
        ];
    };
    _sectorIcons pushBack [
        "\A3\ui_f\data\map\markers\nato\n_installation.paa",
        [1, 1, 1, 1],
        _location,
        20,
        20,
        0,
        _name,
        2,
        0.05
    ];
} forEach _sectors;

private _connections = getArray (_sectorConfig >> "connections");
{
    _x params ["_from", "_to"];
    private _fromLocation = _sectorLocations getOrDefault [_from, [0, 0, 0]];
    private _toLocation = _sectorLocations getOrDefault [_to, [0, 0, 0]];
    _sectorLines pushBack [
        _fromLocation,
        _toLocation,
        [1, 1, 1, 1],
        10
    ];
} forEach _connections;

uiNamespace setVariable ["WL2_sectorRectangles", _sectorRectangles];
uiNamespace setVariable ["WL2_sectorEllipses", _sectorEllipses];
uiNamespace setVariable ["WL2_sectorIcons", _sectorIcons];
uiNamespace setVariable ["WL2_sectorLines", _sectorLines];

private _mainMap = controlNull;

waitUntil {
    _mainMap = (findDisplay 313) displayCtrl 51;
    !isNull _mainMap;
};

_mainMap ctrlAddEventHandler ["Draw", {
    params ["_map"];
    private _sectorRectangles = uiNamespace getVariable ["WL2_sectorRectangles", []];
    private _sectorEllipses = uiNamespace getVariable ["WL2_sectorEllipses", []];
    private _sectorIcons = uiNamespace getVariable ["WL2_sectorIcons", []];
    private _sectorLines = uiNamespace getVariable ["WL2_sectorLines", []];
    {
        _map drawRectangle _x;
    } forEach _sectorRectangles;
    {
        _map drawEllipse _x;
    } forEach _sectorEllipses;
    {
        _map drawIcon _x;
    } forEach _sectorIcons;
    {
        _map drawLine _x;
    } forEach _sectorLines;
}];