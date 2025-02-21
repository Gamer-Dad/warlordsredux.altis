(findDisplay 46) displayAddEventHandler ["KeyDown", {
	if (inputAction "TacticalPing" > 0) then {
		["TaskMapPing"] call WLT_fnc_taskComplete;
		0 spawn {
			private _existingPing = uiNamespace getVariable ["WL2_isPinging", -1];
			if (serverTime < (_existingPing + 3)) exitWith {};
			uiNamespace setVariable ["WL2_isPinging", serverTime];

			private _distance = viewDistance;
			private _origin = AGLToASL positionCameraToWorld [0, 0, 0];
			private _target = AGLToASL positionCameraToWorld [0, 0, _distance];

			private _default = _origin vectorAdd (_origin vectorFromTo _target vectorMultiply _distance);
			private _pos = lineIntersectsSurfaces [_origin, _target, cameraOn] param [0, [_default]] select 0;
			private _posAGL = ASLToAGL _pos;

			private _targets = allPlayers select { side _x == side player && _x != player };
			if (count _targets > 0  && { isRemoteControlling player }) then {
				[_posAGL] remoteExec ["WL2_fnc_pingFix", _targets, true];
			};

			// find enemies near ping
			private _enemiesNear = (_posAGL nearEntities 20) select {
				([_x] call WL2_fnc_getAssetSide) != (side group player) && alive _x && lifeState _x != "INCAPACITATED"
			};
			private _sortedEnemies = [_enemiesNear, [], { _posAGL distance _x }, "ASCEND"] call BIS_fnc_sortBy;
			if (count _sortedEnemies > 0) then {
				private _closestEnemy = _sortedEnemies # 0;
				_closestEnemy setVariable ["WL_lastSpotted", player, 2];
			};

			sleep 9;
			uiNamespace setVariable ["WL2_isPinging", -1];
		};
	};
}];