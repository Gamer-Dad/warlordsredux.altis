#include "..\..\warlords_constants.inc"
params ["_asset"];

private _actionID = _asset addAction [
	"",
	{
        params ["_asset"];
        if ((_asset getVariable "BIS_WL_nextRepair") <= serverTime) then {
            [player, "repair", _asset getVariable "BIS_WL_nextRepair", 0, _asset] remoteExec ["WL2_fnc_handleClientRequest", 2];
            playSound3D ["A3\Sounds_F\sfx\UI\vehicles\Vehicle_Repair.wss", _asset, FALSE, getPosASL _asset, 2, 1, 75];
            [toUpper localize "STR_A3_WL_popup_asset_repaired"] spawn WL2_fnc_smoothText;
            _asset setVariable ["BIS_WL_nextRepair", serverTime + WL_MAINTENANCE_COOLDOWN_REPAIR, true];

            ["TaskRepairVehicle"] call WLT_fnc_taskComplete;
        } else {
            playSound "AddItemFailed";
        };
	},
	[],
	5,
	true,
	false,
	"",
	"[_target, _this] call WL2_fnc_repairActionEligibility",
	WL_MAINTENANCE_RADIUS,
	false
];

[_asset, _actionID] spawn {
    params ["_asset", "_actionID"];
    private _assetTypeName = [_asset] call WL2_fnc_getAssetTypeName;
    while { alive _asset } do {
        private _repairCooldown = ((_asset getVariable ["BIS_WL_nextRepair", 0]) - serverTime) max 0;
        private _actionText = if (_repairCooldown == 0) then {
            format ["<t color = '#4bff58'>%1 %2</t>", localize "STR_repair", _assetTypeName];
        } else {
            private _cooldownText = [_repairCooldown, "MM:SS"] call BIS_fnc_secondsToString;
            format ["<t color = '#7e7e7e'><t align = 'left'>%1 %2</t><t align = 'right'>%3     </t></t>", localize "STR_repair", _assetTypeName, _cooldownText];
        };
        private _actionImage = format ["<img size='2' color = '%1' image='\A3\ui_f\data\IGUI\Cfg\Actions\repair_ca.paa'/>", if (_repairCooldown == 0) then {"#ffffff"} else {"#7e7e7e"}];
        _asset setUserActionText [_actionID, _actionText, _actionImage];
        sleep 1;
    };
};