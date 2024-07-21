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
    _savedLoadouts select (_lbCurSel - 1);
};

private _PYLON_IDC_START = 5501;
private _PYLON_USER_IDC_START = 5601;
private _DISPLAY = findDisplay 5300;

{
    private _pylonCtrl = _DISPLAY displayCtrl (_PYLON_IDC_START + _forEachIndex);
    private _pylonUserCtrl = _DISPLAY displayCtrl (_PYLON_USER_IDC_START + _forEachIndex);

    _pylonCtrl lbSetCurSel 0;

    for "_i" from 1 to (lbSize _pylonCtrl - 1) do { 
        if (count _myPreset <= _forEachIndex) exitWith {};
        
        private _presetItem = _myPreset select _forEachIndex;

        if ((_pylonCtrl lbData _i) == _presetItem # 0) exitWith { 
            _pylonCtrl lbSetCurSel _i; 

            if (_presetItem # 1 isEqualTo [0]) then {
                _pylonUserCtrl ctrlSetTooltip "Control: Gunner";
                _pylonUserCtrl ctrlSetText "a3\ui_f\data\IGUI\Cfg\CommandBar\imageGunner_ca.paa";
            } else {
                _pylonUserCtrl ctrlSetTooltip "Control: Pilot";
                _pylonUserCtrl ctrlSetText "a3\ui_f\data\IGUI\Cfg\CommandBar\imageDriver_ca.paa";
            };
        };
    };
} forEach _pylonsInfo;

_control lbSetCurSel 0;