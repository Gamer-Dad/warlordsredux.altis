#include "..\warlords_constants.inc"

BIS_WL_assetMapClickHandler = addMissionEventHandler ["MapSingleClick", {
	params ["_units", "_pos", "_alt", "_shift"];
	if (_alt && _shift) then {
		if !(isNull BIS_WL_mapAssetTarget) then {
			if ((BIS_WL_mapAssetTarget in WL_PLAYER_VEHS) && count crew BIS_WL_mapAssetTarget > 0) then {
				playSound "AddItemFailed";
				[toUpper localize "STR_A3_WL_popup_asset_not_empty"] spawn BIS_fnc_WL2_smoothText;
			} else {
				playSound "AddItemOK";
				[format [toUpper localize "STR_A3_WL_popup_asset_deleted", toUpper (BIS_WL_mapAssetTarget getVariable "BIS_WL_iconText")], 2] spawn BIS_fnc_WL2_smoothText;
				_ownedVehiclesVarName = format ["BIS_WL_%1_ownedVehicles", getPlayerUID player];
				missionNamespace setVariable [_ownedVehiclesVarName, WL_PLAYER_VEHS - [BIS_WL_mapAssetTarget]];
				publicVariableServer _ownedVehiclesVarName;
				BIS_WL_mapAssetTarget call BIS_fnc_WL2_sub_deleteAsset;
				((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlShow FALSE;
				((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlEnable FALSE;
			};
		};
	};
}];

BIS_WL_assetInfoActive = FALSE;

BIS_WL_assetMapHandler = addMissionEventHandler ["EachFrame", {
	_shown = FALSE;
	
	if (visibleMap) then {
		_nearbyAssets = ((WL_CONTROL_MAP ctrlMapScreenToWorld getMousePosition) nearObjects ["All", (((ctrlMapScale WL_CONTROL_MAP) * 500) min 50) max 2]) select {!isNull (_x getVariable ["BIS_WL_ownerGrp", grpNull])};
		
		if (count _nearbyAssets > 0) then {
			BIS_WL_mapAssetTarget = _nearbyAssets # 0;
			BIS_WL_assetInfoActive = TRUE;
			_shown = TRUE;
			((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlSetPosition [(getMousePosition # 0) + safeZoneW / 100, (getMousePosition # 1) + safeZoneH / 50, safeZoneW, safeZoneH];
			((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlCommit 0;
			((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlSetStructuredText parseText format [
				"<t shadow = '2' size = '%1'>%2</t>",
				(1 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale),
				format [
					localize "STR_A3_WL_info_asset_map_deletion",
					"<t color = '#ff4b4b'>",
					"</t>",
					"<br/>",
					BIS_WL_mapAssetTarget getVariable "BIS_WL_iconText"
				]
			];
			((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlShow TRUE;
			((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlEnable TRUE;
		};
	};
	
	if (!_shown && BIS_WL_assetInfoActive) then {
		BIS_WL_mapAssetTarget = objNull;
		BIS_WL_assetInfoActive = FALSE;
		((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlShow FALSE;
		((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlEnable FALSE;
	};
}];