_this addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	WAS_fired = true;
	if ((_muzzle == "autocannon_35mm") && (typeOf _unit == "B_APC_Tracked_01_AA_F" || typeOf _unit == "O_APC_Tracked_02_AA_F")) then {
		private _WL2_airburstCount = (_unit getVariable ["WL2_airburstRounds", 0]) + 1;
		if (_WL2_airburstCount >= 5) then {
			private _rounds = _unit getVariable ["WL2_airburstMunitions", []];
			_rounds pushback _projectile;
			_unit setVariable ["WL2_airburstMunitions", _rounds];
			_unit setVariable ["WL2_airburstRounds", 0];
		} else {
			_unit setVariable ["WL2_airburstRounds", _WL2_airburstCount];
		};
	};
	if !((typeOf _projectile) in apsEligibleProjectiles) exitWith { true };

	_this spawn APS_fnc_FiredProjectile;
}];