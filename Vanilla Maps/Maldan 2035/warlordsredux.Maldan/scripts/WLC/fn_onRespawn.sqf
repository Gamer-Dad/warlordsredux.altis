#include "constants.inc"

if (WLC_ENABLED == 0) exitWith {};

private _side = BIS_WL_playerSide;

private _data = createHashMap;
{
    private _type = _x;
    private _customizationData = profileNamespace getVariable [format ["WLC_%1", _type], ""];
    _data set [_type, _customizationData];
} forEach ["Uniform", "Vest", "Helmet", "Primary", "Secondary", "Launcher"];

{
    private _type = _x;
    private _attachmentData = profileNamespace getVariable [format ["WLC_%1_Attach", _type], ""];
    private _ammoData = profileNamespace getVariable [format ["WLC_%1_Ammo", _type], ""];
    _data set [_type + "Attachment", _attachmentData];
    _data set [_type + "Ammo", _ammoData];
} forEach ["Primary", "Secondary", "Launcher"];

[_data, _side, BIS_WL_lastLoadout] call WLC_fnc_processSelection;