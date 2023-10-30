/*
    Author: MrThomasM

    Description: Opens the developer tool menu.
*/

params ["_open"];

if (isNull (findDisplay 3000) && {_open}) then {
	private _d = [3000, 4000, 5000, 6000, 7000, 8000];
	{
		if !(isNull (findDisplay _x)) then {
			(findDisplay _x) closeDisplay 1;
		};
	} forEach _d;
	createDialog "MRTM_devTools";

    0 spawn {
        while {!(isNull (findDisplay 4000))} do {
			_pw = ctrlText ((findDisplay 3000) displayCtrl 3002);
			_enable = ((_pw != "") && {(lbCurSel 3004) != -1});
			((findDisplay 3000) displayCtrl 3005) ctrlEnable _enable;
			false spawn MRTM_fnc_openDevMenu;
            sleep 0.5;
        };
    };
};
disableSerialization;

lbClear 3004;

{
	private _index = lbAdd [3004, (_x call MRTM_fnc_getLBText)];
	lbSetData [3004, _index, (getPlayerUID _x)];
} forEach allPlayers;