/*
    Author: MrThomasM

    Description: Opens the group menu.
*/

if (isNull (findDisplay 4000)) then {
    createDialog "MRTM_groupsMenu";

	0 spawn {
		while {!(isNull (findDisplay 4000))} do {
			["Players"] spawn MRTM_fnc_onLBSelChanged;
			[""] spawn MRTM_fnc_onLBSelChanged;
			sleep 0.2;
		};
	};
};
disableSerialization;

lbClear 4005;
lbClear 4006;

{
    private _index = lbAdd [4005, ([_x] call MRTM_fnc_getLBText)];
    lbSetData [4005, _index, (getPlayerUID _x)];
    lbSetPicture [4005, _index, ([_x] call MRTM_fnc_getLBPicture)];
} forEach (units player);

{
    private _index = lbAdd [4006, ([_x] call MRTM_fnc_getLBText)];
    lbSetData [4006, _index, (getPlayerUID _x)];
    lbSetPicture [4006, _index, ([_x] call MRTM_fnc_getLBPicture)];
} forEach (allPlayers select {_x != player && {!(_x in (units player)) && {(side (group _x)) == (side (group player))}}});
