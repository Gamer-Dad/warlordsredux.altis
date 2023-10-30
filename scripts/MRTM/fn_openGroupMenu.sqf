/*
    Author: MrThomasM

    Description: Opens the group menu.
*/

params ["_open"];

if (isNull (findDisplay 4000) && {_open}) then {
	private _d = [3000, 4000, 5000, 6000, 7000, 8000];
	{
		if !(isNull (findDisplay _x)) then {
			(findDisplay _x) closeDisplay 1;
		};
	} forEach _d;
    createDialog "MRTM_groupsMenu";

    0 spawn {
        private _players = 0;
        private _cycles = 0;
        while {!(isNull (findDisplay 4000))} do {
            if (((count (allPlayers select {side group _x == side group player})) != _players) || {_cycles == 20}) then {
                _cycles = 0;
                _players = count (allPlayers select {side group _x == side group player});
                false spawn MRTM_fnc_openGroupMenu;
            };
            _cycles = _cycles + 1;
            sleep 0.5;
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
    if (leader _x == _x) then {
        lbSetPictureColor [4005, _index, [1,1,0,1]];
        lbSetPictureColorSelected [4005, _index, [1,1,0,1]];
    } else {
        lbSetPictureColor [4005, _index, [0,0.4,0,1]];
        lbSetPictureColorSelected [4005, _index, [0,0.4,0,1]];
    };
    if (isPlayer _x) then {
        lbSetTooltip [4005, _index, (format ["%1: %2CP", (name _x), ((missionNamespace getVariable "fundsDatabaseClients") get (getPlayerUID _x))])];
    };
} forEach (units player);

{
    private _index = lbAdd [4006, (_x call MRTM_fnc_getLBText)];
    lbSetData [4006, _index, (getPlayerUID _x)];
    lbSetPicture [4006, _index, (_x call MRTM_fnc_getLBPicture)];
    lbSetTooltip [4006, _index, (format ["Group: %1", (group _x)])];
} forEach (allPlayers select {_x != player && {!(_x in (units player)) && {(side (group _x)) == (side (group player))}}});

0 spawn MRTM_fnc_onLBSelChanged;