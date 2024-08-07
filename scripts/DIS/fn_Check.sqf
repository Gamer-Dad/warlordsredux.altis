params ["_asset"];

private _isSAM = false;
private _mags = magazinesAllTurrets _asset;

scopeName "main";
if (_asset isKindOf "StaticWeapon") then {
	{
		private _ammo = getText (configfile >> "CfgMagazines" >> (_x select 0) >> "ammo");		
		if (_ammo isKindOf "MissileBase") then {
			private _airlock = getNumber (configfile >> "CfgAmmo" >> _ammo >> "airLock");
			if (_airlock == 2) then {
				_isSAM = true;
				breakTo "main";
			};
		};
	} forEach _mags;
};

_isSAM;