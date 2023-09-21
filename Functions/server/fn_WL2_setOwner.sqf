#include "..\warlords_constants.inc"

params ["_asset", "_sender", ["_isStatic", FALSE]];

if (_asset isKindOf "Man") exitWith {};

_assetGrp = group effectiveCommander _asset;
_asset setOwner (owner _sender);