#include "..\warlords_constants.inc"

params ["_action", ["_params", []]];

private _var = format ["BIS_WL_%1", getPlayerUID player];
private _assetVar = "";
private _actionFormat = "";
private _asset = objNull;

switch (_action) do {
	case "requestAsset": {
		_params params ["_className", "_targetPos", ["_isStatic", FALSE], ["_disable", FALSE]];
		if (typeName _targetPos != typeName []) then {_targetPos = position _targetPos};
		_assetVar = call BIS_fnc_WL2_generateVariableName;
		_actionFormat = format ["%1|%2|%3|%4|%5|%6", _action, _assetVar, _className, _targetPos, _isStatic, _disable];
	};
	case "requestAssetArray": {
		_params params ["_infoArray", "_targetPos"];
		if (typeName _targetPos != typeName []) then {_targetPos = position _targetPos};
		_assetVar = call BIS_fnc_WL2_generateVariableName;
		_actionFormat = format ["%1|%2|%3|%4", _action, _assetVar, _infoArray, _targetPos];
	};
	case "deleteAsset": {
		_params params ["_asset"];
		_assetVar = vehicleVarName _asset;
		_actionFormat = format ["%1|%2", _action, _assetVar];
	};
	case "repairAsset": {
		_params params ["_asset"];
		_assetVar = vehicleVarName _asset;
		_actionFormat = format ["%1|%2", _action, _assetVar];
	};
	case "fundsTransfer": {
		_params params ["_recipient", "_amount"];
		_actionFormat = format ["%1|%2|%3", _action, getPlayerUID _recipient, _amount];
	};
	case "fastTravel": {
		_params params ["_destination"];
		_actionFormat = format ["%1|%2", _action, _destination];
	};
	case "setupDefence": {
		_params params ["_className", "_offset"];
		_actionFormat = format ["%1|%2|%3", _action, _className, _offset];
	};
	case "deployDefence": {
		_params params ["_className", "_targetPos"];
		_actionFormat = format ["%1|%2|%3", _action, _className, _targetPos];
	};
	default {_actionFormat = _action};
};

missionNamespace setVariable [_var, _actionFormat];

if (isMultiplayer) then {
	publicVariableServer _var;
};

switch (_action) do {
	case "requestAsset": {
		waitUntil {sleep WL_TIMEOUT_SHORT; !isNull (missionNamespace getVariable [_assetVar, objNull])};
		_asset = missionNamespace getVariable _assetVar;
		if !(isServer) then {
			_asset setVehicleVarName _assetVar;
		};
		waitUntil {local _asset};
	};
	case "requestAssetArray": {
		waitUntil {sleep WL_TIMEOUT_SHORT; count (missionNamespace getVariable [_assetVar, []]) > 0};
		_asset = missionNamespace getVariable _assetVar;
		waitUntil {_asset findIf {!local _x} == -1};
	};
};

_asset