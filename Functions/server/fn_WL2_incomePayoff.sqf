#include "..\warlords_constants.inc"

private _cpMultiplier = createHashMap;
private _cpIncome = createHashMap;
missionNamespace setVariable ["balanceMultiplier", _cpMultiplier, true];
while {true} do {
	sleep (WL_SECTOR_PAYOFF_PERIOD - 5); // -5 Seconds here to get to the full period with the additional 5 seconds sleep further down.

	private _countFaction0 = playersNumber (BIS_WL_competingSides # 0);
    _fac0Percentage = (1.6 * _countFaction0 / count allPlayers) + 0.2; // We multiply by 1.6 and add 0.2 to get a range of [0.2..1.8] (20% income to 180% income)
	_cpMultiplier set [ BIS_WL_competingSides # 0, 2 - _fac0Percentage]; // if side # 0 has e.g. 40% of the players, _fac0Percentage is 0.8, which substracted by 2 leaves 1.2 = 120% payout for that faction.
	_cpMultiplier set [ BIS_WL_competingSides # 1, _fac0Percentage]; // the other side just gets the complementary of this. both entries added together will always end up being 2.
	
	sleep 5;

	{
		_incomeStandard = _x call BIS_fnc_WL2_income;
		_actualIncome = round (_incomeStandard * (_cpMultiplier get _x));
		_cpIncome set [ _x, _actualIncome];
	} forEach BIS_WL_competingSides; // we calculate the actual income for each faction and store it in the income hashmap. That allows us to keep the loop for all players trivial.
	{
		_side = side group _x;
		_actualIncome = _cpIncome get _side;
		// prevent players with odd sides for whatever reason		
		if(!isNil "_actualIncome") then {
			[_x, _actualIncome] call BIS_fnc_WL2_fundsControl;
		}
	} forEach allPlayers; // The allPlayers Loop simply fetches the player's side, uses the side to get the appropriate value from the hashmap and applies it.
};