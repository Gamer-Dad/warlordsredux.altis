#include "..\warlords_constants.inc"

params ["_event"];

["RequestMenu_close"] call BIS_fnc_WL2_setupUI;

if (_event == "save") then {
	BIS_WL_savedLoadout = +getUnitLoadout player;
	[toUpper localize "STR_A3_WL_loadout_saved"] spawn BIS_fnc_WL2_smoothText;
	private _varName = format ["BIS_WL_purchasable_%1", BIS_WL_playerSide];
	private _gearArr = (missionNamespace getVariable _varName) # 5;
	private _savedLoadoutArr = _gearArr # 1;
	private _text = _savedLoadoutArr # 5;
	private _text = format [localize "STR_A3_WL_saved_loadout_info", "<br/>"];
	_text = _text + "<br/><br/>";
	{
		switch (_forEachIndex) do {
			case 0;
			case 1;
			case 2;
			case 3;
			case 4: {
				if (count _x > 0) then {
					_text = _text + (getText (configFile >> "CfgWeapons" >> _x # 0 >> "displayName")) + "<br/>";
				};
			};
			case 5: {
				if (count _x > 0) then {
					_text = _text + (getText (configFile >> "CfgVehicles" >> _x # 0 >> "displayName")) + "<br/>";
				};
			};
		};
	} forEach BIS_WL_savedLoadout;
	_savedLoadoutArr set [5, _text];
	_gearArr set [1, _savedLoadoutArr];
	(missionNamespace getVariable _varName) set [5, _gearArr];
} else {
	[player, -BIS_WL_savedLoadoutCost] call BIS_fnc_WL2_fundsControl;
	player setUnitLoadout BIS_WL_savedLoadout;
	[toUpper localize "STR_A3_WL_loadout_applied"] spawn BIS_fnc_WL2_smoothText;
};