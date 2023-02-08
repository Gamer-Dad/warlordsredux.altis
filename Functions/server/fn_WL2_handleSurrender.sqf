#include "..\warlords_constants.inc"

params ["_side", "_uid"];

private _bluSurrenders = [];
private _opfSurrenders = [];

private _sideSurrendee = _side;
private _uidSurrendee = _uid;

if (_sideSurrendee == west) exitWith {
	if !(_uidSurrendee in _bluSurrenders) then {
		_bluSurrenders pushBack _uidSurrendee;
		private _bluSurrendersCount = count _bluSurrenders;
		missionNamespace setVariable ["bluSurrenders", _bluSurrendersCount, true];
		if (playersNumber west >= 5) then {
			if (missionNamespace getVariable "bluSurrenders" >= round (playersNumber west / 2)) then {
				["forceEnd"] remoteExec ["BIS_fnc_WL2_missionEndHandle", -2];
			};
		};
	};
}; 

if (_sideSurrendee == east) exitWith {
	if !(_uidSurrendee in _opfSurrenders) then {
		_opfSurrenders pushBack _uidSurrendee;
		private _opfSurrendersCount = count _opfSurrenders;
		missionNamespace setVariable ["opfSurrenders", _opfSurrendersCount, true];
		if (playersNumber east >= 5) then {
			if (missionNamespace getVariable "opfSurrenders" >=  round (playersNumber east / 2)) then {
				["forceEnd"] remoteExec ["BIS_fnc_WL2_missionEndHandle", -2];
			};
		};
	};	
};
