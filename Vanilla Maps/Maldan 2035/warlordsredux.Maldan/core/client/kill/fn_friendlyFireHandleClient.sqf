params ["_penalty"];

private _penaltyCheck = profileNameSpace getVariable ["teamkill_penalty", createHashMap];
if ((count _penaltyCheck) == 0) then {
	private _sessionID = missionNamespace getVariable ["sessionID", -1];
	if (_sessionID > 0) then {
		private _penaltyHash = createHashMapFromArray [
			["sessionID", _sessionID],
			["penaltyEndTime", _penalty]
		];
		profileNameSpace setVariable ["teamkill_penalty", _penaltyHash];
		saveProfileNamespace;
	};
};

if (_penalty <= serverTime) then {
	waitUntil {
		sleep 0.1;
		alive player
	};
	forceRespawn player;

	player setVariable ["BIS_WL_friendlyKillTimestamps", [], [2, clientOwner]];
	profileNameSpace setVariable ["teamkill_penalty", nil];
	saveProfileNamespace;
} else {
	private _timeRemaining = [(_penalty - serverTime) max 0, "MM:SS"] call BIS_fnc_secondsToString;
	private _penaltyText = format ["You are blocked from rejoining the game for %1.", _timeRemaining];

	"BlockScreen" setDebriefingText ["Punished", _penaltyText, "Friendly fire punished."];
	endMission "BlockScreen";
	forceEnd;
};
