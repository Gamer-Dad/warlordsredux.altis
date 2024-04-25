params ["_asset"];

{
	_x params ["_className", "_turretPath", "_ammoCount", "_id", "_creator"];

	_asset removeMagazineTurret [_className, _turretPath];
	_asset addMagazineTurret [_className, _turretPath, _ammoCount];
} forEach (_asset getVariable "BIS_WL_defaultMagazines");


_rearmTime = ((missionNamespace getVariable "BIS_WL2_rearmTimers") getOrDefault [(typeOf _asset), 600]);

_asset spawn APS_fnc_RearmAPS;
_asset setVariable ["BIS_WL_nextRearm", serverTime + _rearmTime]; 
playSound3D ["A3\Sounds_F\sfx\UI\vehicles\Vehicle_Rearm.wss", _asset, false, getPosASL _asset, 2, 1, 75];
[toUpper localize "STR_A3_WL_popup_asset_rearmed"] spawn BIS_fnc_WL2_smoothText;
((findDisplay 1000) displayCtrl 1500) ctrlRemoveAllEventHandlers "LBSelChanged";
((findDisplay 1000) displayCtrl 1501) ctrlRemoveAllEventHandlers "LBSelChanged";
((findDisplay 1000) displayCtrl 1503) ctrlRemoveAllEventHandlers "LBSelChanged";