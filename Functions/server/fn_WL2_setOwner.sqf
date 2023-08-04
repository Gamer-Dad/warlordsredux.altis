#include "..\warlords_constants.inc"

params ["_asset", "_sender", ["_isStatic", FALSE]];

if (_asset isKindOf "Man") exitWith {};

if (isServer) then {
	if !(_isStatic) then {
		waitUntil {sleep WL_TIMEOUT_SHORT; {uniform _x == "U_VirtualMan_F"} count crew _asset == 0};
	};
	if (count crew _asset > 0 && {_isStatic}) then {
		_assetGrp = group effectiveCommander _asset;
		while { ((groupOwner _assetGrp) != (owner _sender)) && {(alive _asset)}} do {
			_assetGrp setGroupOwner (owner _sender);
			sleep WL_TIMEOUT_SHORT;
		};
	};
	while { (owner _asset) != (owner _sender) && {(alive _asset)}} do {
		_asset setOwner (owner _sender);
		sleep WL_TIMEOUT_SHORT;
	};
};