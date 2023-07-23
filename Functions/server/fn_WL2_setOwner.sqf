#include "..\warlords_constants.inc"

params ["_asset", "_sender", ["_isStatic", FALSE]];

if (_asset isKindOf "Man") exitWith {};

if (isServer) then {
	if !(_isStatic) then {
		waitUntil {sleep WL_TIMEOUT_SHORT; {uniform _x == "U_VirtualMan_F"} count crew _asset == 0};
	};
	if (_isStatic && count crew _asset > 0) then {
		// hide from all players/AI/JIP, takes no damage
		_asset hideObjectGlobal true;
		_asset setAutonomous false;

		_grp = (createGroup (side _sender));
		waitUntil {!alive _asset || (!isNull _asset && !isNull _grp)};

		_waitMessage = [
			"Still working...",
			"Resolving chip shortage...",
			"Conducting last minute checks...",
			"Fixing AI issues...",
			"Please hold..."
		];

		"Ordering your asset. Please wait..." remoteExec ["systemChat", (owner _sender)];

		waitUntil {
			(selectRandom _waitMessage) remoteExec ["systemChat", (owner _sender)];
			_grp setGroupOwner (owner _sender);
			(crew _asset) joinSilent _grp;
			// can't be too frequent or it will never complete if server lags, ~1s is generally safe
			sleep 1;
			!alive _asset || (groupOwner _grp == owner _sender && side (crew _asset # 0) == side _sender)};
		
		_asset hideObjectGlobal false;
		_asset setAutonomous true;
		"Asset arrived!" remoteExec ["systemChat", (owner _sender)];

		_grp deleteGroupWhenEmpty true;

		// this must happen last
		_asset setOwner (owner _sender);
	};
};