private _v = _this;
private _isSAM = false;
private _ammo = "";
private _mags = magazinesAllTurrets _v;
private _parents = [];

if (_v isKindOf "LandVehicle") then {
	{
		_ammo = getText (configfile >> "CfgMagazines" >> (_x select 0) >> "ammo");
		_parents = [(configfile>> "CfgAmmo" >> _ammo), true]call BIS_fnc_returnParents;
		if (("MissileBase" in _parents) || ("MissileCore" in _parents)) then {
			if ((getNumber (configfile>> "CfgAmmo" >> _ammo >> "airLock")) == 2) exitWith {_isSAM = true};
		};
	} forEach _mags;
};

_isSAM;