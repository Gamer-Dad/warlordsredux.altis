#include "..\warlords_constants.inc"

params ["_injured", "_healer"];

_damage = damage _injured;
if (_injured != _healer) then {
	// end timer when injured health changes or when timer runs out
	_startTime = time;
	waitUntil {
		sleep 1;
		damage _injured != _damage || (time - _startTime > 8);	// healing should take no longer than 8s
	};
	
	_rewardee = leader _healer;

	_lastTimeHeal = _rewardee getVariable "lastTimeHealPoints";
	if (isNil "_lastTimeHeal") then { 
		_lastTimeHeal = 0;
	};
	
	// should the player get points for their own AI healing them?
	_allowedTargetForPoints = WL_HEAL_SCORE_AISELFHEAL || _rewardee != _injured;
	
	// throttle healing reward frequency
	if (damage _injured < _damage && time - _lastTimeHeal > WL_HEAL_SCORE_FREQUENCY && _allowedTargetForPoints) then {
		_uid = getPlayerUID _rewardee;
		[_uid, WL_HEAL_SCORE] call BIS_fnc_WL2_fundsDatabaseWrite;		
		[0, WL_HEAL_SCORE, "heal"] remoteExecCall ["BIS_fnc_WL2_killRewardClient", (owner _rewardee)];
		
		_rewardee setVariable ["lastTimeHealPoints", time];
	};
};