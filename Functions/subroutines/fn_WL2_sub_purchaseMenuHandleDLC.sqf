#include "..\warlords_constants.inc"

private ["_class", "_ret"];

_class = _this # 0;
_ret = -1;

_parentDLC = getText (configFile >> "CfgVehicles" >> _class >> "DLC");

switch (_this # 1) do {
	case "IsOwned": {
		if (_parentDLC == "") then {
			_ret = TRUE;
		} else {
			_DLCID = getNumber (configFile >> "CfgMods" >> _parentDLC >> "appId");
			_ownedDLCs = getDLCs 1;
			_ret = _DLCID in _ownedDLCs;
		};
	};
	case "GetTooltip": {
		_ret = getText (configFile >> "CfgMods" >> _parentDLC >> "vehPrevMsgText");
	};
};

_ret