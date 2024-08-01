params ["_control"];

private _asset = uiNamespace getVariable "WLM_asset";

private _isSolo = count (allTurrets _asset) == 0;

if (_isSolo) exitWith {
    _control ctrlSetText "a3\ui_f\data\IGUI\Cfg\CommandBar\imageDriver_ca.paa";
    _control ctrlSetTooltip "Control: Pilot";
};

if (ctrlTooltip _control == "Control: Pilot") then {
    _control ctrlSetText "a3\ui_f\data\IGUI\Cfg\CommandBar\imageGunner_ca.paa";
    _control ctrlSetTooltip "Control: Gunner";
} else {
    _control ctrlSetText "a3\ui_f\data\IGUI\Cfg\CommandBar\imageDriver_ca.paa";
    _control ctrlSetTooltip "Control: Pilot";
};