/*
	Author: MrThomasM

	Description: Sets listbox picture.
*/
params ["_unit"];

if (_unit in (units player)) exitWith {(format ["a3\ui_f\data\map\vehicleicons\%1_ca.paa", (getText (configFile >> 'CfgVehicles' >> (typeOf _unit) >> 'icon'))])};

if ((getPlayerUID _unit) in (missionNamespace getVariable [(format ["MRTM_invitesOut_%1", getPlayerUID player]), []])) exitWith {"Img\green_arrow_ca.paa"};

if ((getPlayerUID _unit) in (missionNamespace getVariable [(format ["MRTM_invitesIn_%1", getPlayerUID player]), []])) exitWith {"Img\red_arrow_ca.paa"};

if (count ((units _unit) select {isPlayer _x}) > 1) exitwith {"\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_cancel_ca.paa"};

"a3\ui_f\data\gui\rsc\rscdisplayarcademap\icon_toolbox_units_ca.paa";