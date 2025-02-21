#include "..\..\warlords_constants.inc"
params ["_asset"];

private _claimActionID = _asset addAction [
	"",
	{
        _this params ["_asset", "_caller", "_actionId"];

		private _displayName = [_asset] call WL2_fnc_getAssetTypeName;
		systemChat format ["%1 has been claimed.", _displayName];

        _asset setVariable ["BIS_WL_ownerAsset", getPlayerUID _caller, true];
        _asset setVariable ["BIS_WL_ownerAssetSide", side group _caller, true];

        private _ownedVehicleVar = format ["BIS_WL_ownedVehicles_%1", getPlayerUID _caller];
        private _vehicles = missionNamespace getVariable [format ["BIS_WL_ownedVehicles_%1", getPlayerUID _caller], []];
        _vehicles pushBack _asset;
        missionNamespace setVariable [_ownedVehicleVar, _vehicles, [2, owner _caller]];
		[_asset] remoteExec ["WL2_fnc_removeAction", 0, true];

		0 spawn {
			sleep 10;
        	0 remoteExec ["WL2_fnc_updateVehicleList", 2];
		};
	},
	[],
	-98,
	false,
	true,
	"",
	"[_target, _this] call WL2_fnc_claimEligibility",
    30,
	false
];

_asset setUserActionText [_claimActionID, "<t color = '#ff4b4b'>Claim Vehicle</t>", "<img size='2' color='#ff4b4b' image='\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_cancel_ca'/>"];