"RequestMenu_close" call WL2_fnc_setupUI;

private _confirm_text = composeText [parseText "<img image='\a3\data_f\flags\flag_white_dmg_co.paa' size='8' align='center' />", lineBreak, parseText format [localize "STR_A3_WL_Confirm_Teamwide_Action_text", parseText format [localize "STR_A3_WL_feature_OrderForfeit", "Order forfeit"]]];
private _confirm_title = format [localize "STR_A3_WL_Confirm_Teamwide_Action", parseText format [localize "STR_A3_WL_feature_OrderForfeit", "Order forfeit"]];
private _result = [
    _confirm_text,      // confirmation text
    _confirm_title,     // title
    true,
    true
] call BIS_fnc_guiMessage;
if (_result) then {
    private _side = BIS_WL_playerSide;

    missionNamespace setVariable [format ["BIS_WL_forfeitVotingSince_%1", _side], serverTime, true];
    missionNamespace setVariable [format ["BIS_WL_forfeitOrderedBy_%1", _side], name player, true];
    player setVariable ["BIS_WL_forfeitVote", 1, [2, clientOwner]];

    [_side] remoteExec ["WL2_fnc_forfeitHandle", 0];
    [_side] remoteExec ["WL2_fnc_forfeitHandleServer", 2];
} else {
    playSound "AddItemFailed";
};

WL_GEAR_BUY_MENU = false;
(uiNamespace getVariable ["BIS_WL_mapControl", controlNull]) ctrlEnable true;