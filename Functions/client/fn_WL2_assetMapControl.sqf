#include "..\warlords_constants.inc"

BIS_WL_assetMapClickHandler = addMissionEventHandler ["MapSingleClick", {
	params ["_units", "_pos", "_alt", "_shift"];
	if (_alt && _shift) then {
		if !(isNull BIS_WL_mapAssetTarget) then {
			if ((BIS_WL_mapAssetTarget in WL_PLAYER_VEHS) && count crew BIS_WL_mapAssetTarget > 0) then {
				if (getNumber (configFile >> "CfgVehicles" >> (typeOf BIS_WL_mapAssetTarget) >> "isUav") == 1) then {
					[BIS_WL_mapAssetTarget] spawn {
						params ["_target"];
						_displayName = getText (configFile >> "CfgVehicles" >> (typeOf _target) >> "displayName");
						_result = [format ["Are you sure you would like to delete: %1", _displayName], "Delete asset", true, true] call BIS_fnc_guiMessage;

						if (_result) then {
							playSound "AddItemOK";
							[format [toUpper localize "STR_A3_WL_popup_asset_deleted", toUpper (_target getVariable "BIS_WL_iconText")], 2] spawn BIS_fnc_WL2_smoothText;
							_ownedVehiclesVarName = format ["BIS_WL_%1_ownedVehicles", getPlayerUID player];
							missionNamespace setVariable [_ownedVehiclesVarName, WL_PLAYER_VEHS - [_target]];
							publicVariableServer _ownedVehiclesVarName;
							_target call BIS_fnc_WL2_sub_deleteAsset;
							((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlShow false;
							((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlEnable true;
						} else {
							playSound "AddItemFailed";
						};
					};
				} else {
					if ((crew BIS_WL_mapAssetTarget) findIf {alive _x} != -1) then {
						playSound "AddItemFailed";
						[toUpper localize "STR_A3_WL_popup_asset_not_empty"] spawn BIS_fnc_WL2_smoothText;				
					} else {
						[BIS_WL_mapAssetTarget] spawn {
							params ["_target"];
							_displayName = getText (configFile >> "CfgVehicles" >> (typeOf _target) >> "displayName");
							_result = [format ["Are you sure you would like to delete: %1", _displayName], "Delete asset", true, true] call BIS_fnc_guiMessage;

							if (_result) then {
								playSound "AddItemOK";
								[format [toUpper localize "STR_A3_WL_popup_asset_deleted", toUpper (_target getVariable "BIS_WL_iconText")], 2] spawn BIS_fnc_WL2_smoothText;
								_ownedVehiclesVarName = format ["BIS_WL_%1_ownedVehicles", getPlayerUID player];
								missionNamespace setVariable [_ownedVehiclesVarName, WL_PLAYER_VEHS - [_target]];
								publicVariableServer _ownedVehiclesVarName;
								_target call BIS_fnc_WL2_sub_deleteAsset;
								((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlShow false;
								((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlEnable true;
							} else {
								playSound "AddItemFailed";
							};
						};
					};
				};
			} else {
				[BIS_WL_mapAssetTarget] spawn {
					params ["_target"];
					_displayName = getText (configFile >> "CfgVehicles" >> (typeOf _target) >> "displayName");
					_result = [format ["Are you sure you would like to delete: %1", _displayName], "Delete asset", true, true] call BIS_fnc_guiMessage;

					if (_result) then {
						playSound "AddItemOK";
						[format [toUpper localize "STR_A3_WL_popup_asset_deleted", toUpper (_target getVariable "BIS_WL_iconText")], 2] spawn BIS_fnc_WL2_smoothText;
						_ownedVehiclesVarName = format ["BIS_WL_%1_ownedVehicles", getPlayerUID player];
						missionNamespace setVariable [_ownedVehiclesVarName, WL_PLAYER_VEHS - [_target]];
						publicVariableServer _ownedVehiclesVarName;
						_target call BIS_fnc_WL2_sub_deleteAsset;
						((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlShow false;
						((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlEnable true;
					} else {
						playSound "AddItemFailed";
					};
				};
			};
		};
	};
}];

BIS_WL_assetInfoActive = false;

BIS_WL_assetMapHandler = addMissionEventHandler ["EachFrame", {
	_shown = false;
	
	if (visibleMap) then {
		_nearbyAssets = ((WL_CONTROL_MAP ctrlMapScreenToWorld getMousePosition) nearObjects ["All", (((ctrlMapScale WL_CONTROL_MAP) * 500) min 50) max 2]) select {(group player) == (_x getVariable ["BIS_WL_ownerAsset", grpNull])};
		
		if (count _nearbyAssets > 0) then {
			BIS_WL_mapAssetTarget = _nearbyAssets # 0;
			BIS_WL_assetInfoActive = true;
			_shown = true;
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
			((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlShow true;
			((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlEnable true;
		};
	};
	
	if (!_shown && BIS_WL_assetInfoActive) then {
		BIS_WL_mapAssetTarget = objNull;
		BIS_WL_assetInfoActive = false;
		((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlShow false;
		((ctrlParent WL_CONTROL_MAP) getVariable "BIS_sectorInfoBox") ctrlEnable false;
	};
}];