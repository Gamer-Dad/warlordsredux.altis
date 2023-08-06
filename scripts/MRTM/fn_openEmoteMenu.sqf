/*
	Author: MrThomasM

	Description: Opens the emote menu.
*/

if (isNull (findDisplay 5000)) then {
	createDialog "MRTM_emotesMenu";

	((findDisplay 5000) displayCtrl 5004) ctrlAddEventHandler ["LBSelChanged", {
		_this spawn MRTM_fnc_emote;
	}];
};
disableSerialization;

lbClear 5004;

private _names = ["Facepalm 1", "Facepalm 2", "Yawn", "Push ups", "Namaste", "Knee bend A", "Knee bend B"];
private _emotes = ["Acts_Ambient_Facepalm_1", "Acts_Ambient_Facepalm_1", "Acts_Ambient_Gestures_Yawn", "AmovPercMstpSnonWnonDnon_exercisePushup", "AmovPercMstpSnonWnonDnon_exerciseKata", "AmovPercMstpSnonWnonDnon_exercisekneeBendA", "AmovPercMstpSnonWnonDnon_exercisekneeBendB"];

{
	_index = lbAdd [5004, _x];
	lbSetData [5004, _index, (_emotes # _forEachIndex)];
} forEach _names;
