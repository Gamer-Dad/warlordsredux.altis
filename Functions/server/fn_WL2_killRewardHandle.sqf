#include "..\warlords_constants.inc"

params ["_unit", "_killer", "_instigator"];

if (!(_unit isKindOf "Man") && (((serverNamespace getVariable "BIS_WL2_killRewards") getOrDefault [(typeOf _unit), 69]) == 69)) exitWith {};

if (isNull _instigator) then {_instigator = (if !(isNull ((_killer getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID)) then {((_killer getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID)} else {((UAVControl vehicle _killer) # 0)})};
if (isNull _instigator) then {_instigator = (vehicle _killer)};
if !(isNull _instigator) then {
	_responsibleLeader = leader _instigator;
	if (_responsibleLeader in BIS_WL_allWarlords) then {
		["In warlords"] remoteExec ["systemChat", 0];
		_killerSide = side group _responsibleLeader;
		_unitSide = if (_unit isKindOf "Man") then {
			side group _unit;
		} else {
			if !(isNull ((_unit getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID)) then {
				(side ((_unit getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID));
			} else {
				(switch ((getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "side"))) do {
					case 0: {east};
					case 1: {west};
					case 2: {Independent};
					default {Independent};
				});
			};
		};
		if ((_killerSide != _unitSide) && (_unitSide in [west, east, independent])) then {
			private _targets = [missionNamespace getVariable "BIS_WL_currentTarget_west", missionNamespace getVariable "BIS_WL_currentTarget_east"];
			_killReward = 0;
			if (_unit isKindOf "Man") then {
				_killReward = (if (isPlayer _unit) then {75} else {40});
			} else {
				_killReward = (serverNamespace getVariable "BIS_WL2_killRewards") getOrDefault [(typeOf _unit), 69];
			};
			if (_responsibleLeader getVariable ["MRTM_3rdPersonDisabled", false]) then {
				_killReward = _killReward * 2; //1st person bonus
			};
			if ((_targets findIf {_responsibleLeader inArea (_x getVariable "objectAreaComplete")}) != -1 || {(_targets findIf {_unit inArea (_x getVariable "objectAreaComplete")}) != -1}) then {
				_killReward = _killReward * 1.3; //Bonus for defending sector or attacking sector.
			};
			_uid = getPlayerUID _responsibleLeader;
			[_uid, (round _killReward)] call BIS_fnc_WL2_fundsDatabaseWrite;
			[_unit, (round _killReward), false] remoteExec ["BIS_fnc_WL2_killRewardClient", (owner _responsibleLeader)];
			{
				_uid = getPlayerUID _x;
				[_uid, (round _killReward)] call BIS_fnc_WL2_fundsDatabaseWrite;
				[_unit, (round _killReward), false] remoteExec ["BIS_fnc_WL2_killRewardClient", (owner _x)];
			} forEach ((crew (objectParent _responsibleLeader)) select {((_x isEqualTo (gunner (objectParent _responsibleLeader))) || {(_x isEqualTo (commander (objectParent _responsibleLeader))) || {(_x isEqualTo (driver (objectParent _responsibleLeader)))}}) && {_x != _responsibleLeader && {isPlayer _x}}});
		};
	};
};