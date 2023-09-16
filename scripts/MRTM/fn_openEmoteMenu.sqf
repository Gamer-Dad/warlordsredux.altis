/*
	Author: MrThomasM

	Description: Opens the emote menu.
*/

if (isNull (findDisplay 5000)) then {
	closeDialog 1;
	createDialog "MRTM_emotesMenu";

	((findDisplay 5000) displayCtrl 5004) ctrlAddEventHandler ["LBSelChanged", {
		_this spawn MRTM_fnc_emote;
	}];
};
disableSerialization;

lbClear 5004;

private _names = getArray (missionConfigFile >> "emoteConfig" >> "emotes" >> "Names");
private _emotes = getArray (missionConfigFile >> "emoteConfig" >> "emotes" >> "Emotes");

{
	_index = lbAdd [5004, _x];
	lbSetData [5004, _index, (_emotes # _forEachIndex)];
} forEach _names;
