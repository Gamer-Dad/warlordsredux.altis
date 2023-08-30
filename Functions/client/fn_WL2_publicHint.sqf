params ["_uid"];

private _uids = getArray (missionConfigFile >> "adminIDs");
if (_uid in _uids) then {
	["PublicHint"] remoteExec ["systemChat", 0];
};