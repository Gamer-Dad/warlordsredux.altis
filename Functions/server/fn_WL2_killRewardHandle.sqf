#include "..\warlords_constants.inc"

params ["_unit", "_killer", "_instigator"];

_killReward = 0;
if (isNull _instigator) then {_instigator = (UAVControl vehicle _killer # 0)};
if (isNull _instigator) then {_instigator = _killer};
if !(isNull _instigator) then {
	_responsibleLeader = leader _instigator;
	if (!isPlayer _responsibleLeader && unitIsUAV _killer) then {
        _responsibleLeader = leader (_killer getVariable "BIS_WL_ownerAsset");
    };
	if (_responsibleLeader in BIS_WL_allWarlords) then {
		_killerSide = side group _responsibleLeader;
		_id = owner _responsibleLeader;
		_unitSide = if (_unit isKindOf "Man") then {
			side group _unit;
		} else {
			switch (true) do {
				case ((side (_unit getVariable "BIS_WL_ownerAsset")) == east): {east};
				case ((side (_unit getVariable "BIS_WL_ownerAsset")) == west): {west};
				case ((getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "side")) == 0): {east};
				case ((getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "side")) == 1): {west};
				case ((getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "side")) == 2): {Independent};
				default {Civilian};
			};
		};
		if (_killerSide != _unitSide && _unitSide in BIS_WL_sidesArray) then {
			if (_unit isKindOf "Man") then {
				if (isPlayer _unit) then {
					_killReward = 75;
				} else {
					_killReward = 50;
				};
			} else {
				_killReward = (serverNamespace getVariable "killRewards") getOrDefault [typeOf _unit, 69];
			};
			[_unit, _killReward, false] remoteExec ["BIS_fnc_WL2_killRewardClient", _id];
			_unit setVariable ["BIS_WL_killer", _responsibleLeader, true];
			private _uid = getPlayerUID _responsibleLeader;
			[_uid, _killReward] spawn BIS_fnc_WL2_fundsDatabaseWrite;
		};
	};
};

_cond = (count ((_unit getVariable ["assistList", []]) select {_x != _unit getVariable ["BIS_WL_killer", objNull]}));
if (_cond > 0) then {
	_assistList = ((_unit getVariable ["assistList", []]) select {_x != _unit getVariable ["BIS_WL_killer", objNull]});
	_killReward = if (_unit isKindOf "Man") then {
		if (isPlayer _unit) then {
			75;
		} else {
			50;
		};		
	} else {
		(serverNamespace getVariable "killRewards") getOrDefault [typeOf _unit, 69];
	};
	_killReward = (round ((_killReward / 100) * 30));
	{
		_uid = getPlayerUID _x;
		_id = owner _x;
		[_uid, _killReward] spawn BIS_fnc_WL2_fundsDatabaseWrite;
		[_unit, _killReward, true] remoteExec ["BIS_fnc_WL2_killRewardClient", _id];
	} forEach _assistList;
	_unit setVariable ["assistList", [], true];
	_unit setVariable ["BIS_WL_killer", nil, true];
};