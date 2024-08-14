(findDisplay 46) displayAddEventHandler ["KeyDown", {
	if (inputAction "TacticalPing" > 0 && { isRemoteControlling player }) then {
		private _distance = viewDistance;
		private _origin = AGLToASL positionCameraToWorld [0, 0, 0];
		private _target = AGLToASL positionCameraToWorld [0, 0, _distance];

		private _default = _origin vectorAdd (_origin vectorFromTo _target vectorMultiply _distance);
		private _pos = lineIntersectsSurfaces [_origin, _target, cameraOn] param [0, [_default]] select 0;

		private _targets = allPlayers select { side _x == side player && _x != player };
        if (count _targets > 0) then {
            [ASLToAGL _pos] remoteExec ["BIS_fnc_WL2_pingFix", _targets, true];
        };
	};
}];