params ["_uid"];

private _uids = getArray (missionConfigFile >> "adminIDs");
if (_uid in _uids) then {
	["Kicked"] remoteExec ["systemChat", 0];
};