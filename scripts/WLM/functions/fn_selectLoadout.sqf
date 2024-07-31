#include "..\WLM_constants.inc";

params ["_control", "_lbCurSel", "_lbSelection"];

if (_lbCurSel == 0) exitWith {};    // careful

private _loadoutName = _control lbData _lbCurSel;
private _asset = uiNamespace getVariable "WLM_asset";

private _pylonConfig = configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent";
private _pylonsInfo = configProperties [_pylonConfig >> "pylons"];

private _myPreset = if (_loadoutName != "") then {
    getArray (_pylonConfig >> "Presets" >> _loadoutName >> "attachment") apply { [_x, []] };
} else  {
    private _variableName = format ["WLM_savedLoadout_%1", typeOf _asset];
    private _savedLoadouts = profileNamespace getVariable [_variableName, []];
    private _selectedLoadout = _savedLoadouts select (_lbCurSel - 1);
    _selectedLoadout # 1;
};

private _display = findDisplay WLM_DISPLAY;

{
    private _pylonControl = _display displayCtrl (WLM_PYLON_START + _forEachIndex);
    private _pylonUserControl = _display displayCtrl (WLM_PYLON_USER_START + _forEachIndex);

    _pylonControl lbSetCurSel 0;

    for "_i" from 1 to (lbSize _pylonControl - 1) do { 
        if (count _myPreset <= _forEachIndex) exitWith {};
        
        private _presetItem = _myPreset select _forEachIndex;

        if ((_pylonControl lbData _i) == _presetItem # 0) exitWith { 
            _pylonControl lbSetCurSel _i; 

            if (_presetItem # 1 isEqualTo [0]) then {
                _pylonUserControl ctrlSetTooltip "Control: Gunner";
                _pylonUserControl ctrlSetText "a3\ui_f\data\IGUI\Cfg\CommandBar\imageGunner_ca.paa";
            } else {
                _pylonUserControl ctrlSetTooltip "Control: Pilot";
                _pylonUserControl ctrlSetText "a3\ui_f\data\IGUI\Cfg\CommandBar\imageDriver_ca.paa";
            };
        };
    };
} forEach _pylonsInfo;

_control lbSetCurSel 0;