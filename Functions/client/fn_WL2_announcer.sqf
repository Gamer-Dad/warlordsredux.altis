#include "..\warlords_constants.inc"

if (isNil "BIS_WL_soundMsgBuffer") then {
	BIS_WL_soundMsgBuffer = [];
	0 spawn {
		while {!BIS_WL_missionEnd} do {
			waitUntil {sleep WL_TIMEOUT_SHORT; count BIS_WL_soundMsgBuffer > 0};
			_msg = BIS_WL_soundMsgBuffer # 0;
			_length = getNumber (configFile >> "CfgSounds" >> _msg >> "duration");
			if (_length == 0) then {_length = 2};
			playSound (BIS_WL_soundMsgBuffer # 0);
			BIS_WL_soundMsgBuffer deleteAt 0;
			sleep (_length + WL_ANNOUNCER_PAUSE);
		};
	};
};

if !(profileNamespace getVariable "MRTM_muteVoiceInformer") then {
	BIS_WL_soundMsgBuffer pushBack format ["BIS_WL_%1_%2", _this, BIS_WL_sidesArray # ((BIS_WL_sidesArray find BIS_WL_playerSide) min 1)];
};