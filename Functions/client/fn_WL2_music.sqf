#include "..\warlords_constants.inc"

if (BIS_WL_musicEnabled) then {
	_musicPool = "getText (_x >> 'name') != '' && getNumber (_x >> 'duration') > 20" configClasses (configFile >> "CfgMusic");
	_poolSize = count _musicPool;
	sleep 5;
	0 fadeMusic WL_MUSIC_VOLUME;
	BIS_WL_musicStopped = FALSE;
	addMusicEventHandler ["MusicStop", {BIS_WL_musicStopped = TRUE}];
	while {!BIS_WL_missionEnd} do {
		_trackClass = _musicPool # floor random _poolSize;
		playMusic configName _trackClass;
		waitUntil {sleep WL_TIMEOUT_STANDARD; BIS_WL_musicStopped};
		BIS_WL_musicStopped = FALSE;
		sleep WL_TIMEOUT_STANDARD;
	};
};