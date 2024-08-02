BIS_WL_assetInfoActive = false;

addMissionEventHandler ["Map", {
	params ["_mapIsOpened", "_mapIsForced"];
	if (_mapIsOpened) then {
		MAP_CONTROL = addMissionEventHandler ["EachFrame", {
			_shown = false;
			_map = (uiNamespace getVariable ["BIS_WL_mapControl", controlNull]);
			
			if (visibleMap) then {
				_radius = (((ctrlMapScale _map) * 500) min 30);
				_pos = (_map ctrlMapScreenToWorld getMousePosition);
				_nearbyAssets = (_pos nearObjects _radius) select {(getPlayerUID player) == (_x getVariable ["BIS_WL_ownerAsset", "123"]) && {_x != player && {alive _x}}};
				_nearbyAssets append (allUnitsUAV select {(getPlayerUID player) == (_x getVariable ["BIS_WL_ownerAsset", "123"]) && {alive _x && {(_x distance2D _pos) < _radius && {!(_x in _nearbyAssets)}}}});

				if (count _nearbyAssets > 0) then {
					BIS_WL_mapAssetTarget = _nearbyAssets # 0;
					BIS_WL_assetInfoActive = true;
					_shown = true;
					((ctrlParent _map) getVariable "BIS_sectorInfoBox") ctrlSetPosition [(getMousePosition # 0) + safeZoneW / 100, (getMousePosition # 1) + safeZoneH / 50, safeZoneW, safeZoneH];
					((ctrlParent _map) getVariable "BIS_sectorInfoBox") ctrlCommit 0;
					((ctrlParent _map) getVariable "BIS_sectorInfoBox") ctrlSetStructuredText parseText format [
						"<t shadow = '2' size = '%1'>%2</t>",
						(1 call BIS_fnc_WL2_sub_purchaseMenuGetUIScale),
						format [
							localize "STR_A3_WL_info_asset_map_deletion",
							"<t color = '#ff4b4b'>",
							"</t>",
							"<br/>",
							getText (configFile >> "CfgVehicles" >> typeOf BIS_WL_mapAssetTarget >> "displayName")
						]
					];
					((ctrlParent _map) getVariable "BIS_sectorInfoBox") ctrlShow true;
					((ctrlParent _map) getVariable "BIS_sectorInfoBox") ctrlEnable true;
				};
			};
			
			if (!_shown && BIS_WL_assetInfoActive) then {
				BIS_WL_mapAssetTarget = objNull;
				BIS_WL_assetInfoActive = false;
				((ctrlParent _map) getVariable "BIS_sectorInfoBox") ctrlShow false;
				((ctrlParent _map) getVariable "BIS_sectorInfoBox") ctrlEnable false;
			};
		}];

		MAP_CONTROL_CLICK = addMissionEventHandler ["MapSingleClick", {
			params ["_units", "_pos", "_alt", "_shift"];
			_asset = BIS_WL_mapAssetTarget;
			if (_alt && _shift) then {
				if !(isNull _asset) then {
					_vehicles = (missionNamespace getVariable [format ["BIS_WL_ownedVehicles_%1", getPlayerUID player], []]);
					if ((_asset in _vehicles) && count crew _asset > 0) then {
						if (unitIsUAV _asset) then {
							_asset spawn BIS_fnc_WL2_deleteAssetFromMap;
						} else {
							if ((crew _asset) findIf {alive _x} != -1) then {
								playSound "AddItemFailed";
								[toUpper localize "STR_A3_WL_popup_asset_not_empty"] spawn BIS_fnc_WL2_smoothText;				
							} else {
								_asset spawn BIS_fnc_WL2_deleteAssetFromMap;
							};
						};
					} else {
						_asset spawn BIS_fnc_WL2_deleteAssetFromMap;
					};
				};
			};
		}];
	} else {
		removeMissionEventHandler ["EachFrame", MAP_CONTROL];
		removeMissionEventHandler ["MapSingleClick", MAP_CONTROL_CLICK];
	};
}];