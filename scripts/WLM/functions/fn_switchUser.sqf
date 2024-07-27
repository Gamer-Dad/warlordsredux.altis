params ["_control"];

if (ctrlTooltip _control == "Control: Pilot") then {
    _control ctrlSetText "a3\ui_f\data\IGUI\Cfg\CommandBar\imageGunner_ca.paa";
    _control ctrlSetTooltip "Control: Gunner";
} else {
    _control ctrlSetText "a3\ui_f\data\IGUI\Cfg\CommandBar\imageDriver_ca.paa";
    _control ctrlSetTooltip "Control: Pilot";
};