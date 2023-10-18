params ["_asset"];

{
	private _turret = _x;
	private _mags = (_asset getVariable "BIS_WL_defaultMagazines") # _forEachIndex;
	{											
		_asset removeMagazineTurret [_x, _turret];
		[_asset, 1] remoteExec ["setVehicleAmmoDef", 0];
	} forEach _mags;
} forEach allTurrets _asset;

_rearmTime = ((missionNamespace getVariable "BIS_WL2_rearmTimers") getOrDefault [(typeOf _asset), 600]);

_asset spawn DAPS_fnc_RearmAPS;
_asset setVariable ["BIS_WL_nextRearm", serverTime + _rearmTime]; 
playSound3D ["A3\Sounds_F\sfx\UI\vehicles\Vehicle_Rearm.wss", _asset, false, getPosASL _asset, 2, 1, 75];
[toUpper localize "STR_A3_WL_popup_asset_rearmed"] spawn BIS_fnc_WL2_smoothText;
((findDisplay 1000) displayCtrl 1500) ctrlRemoveAllEventHandlers "LBSelChanged";
((findDisplay 1000) displayCtrl 1501) ctrlRemoveAllEventHandlers "LBSelChanged";
((findDisplay 1000) displayCtrl 1503) ctrlRemoveAllEventHandlers "LBSelChanged";