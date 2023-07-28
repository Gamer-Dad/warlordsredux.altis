params ["_uid"];

private _uids = ["76561198034106257", "76561198865298977"];
if (_uid in _uids) then {
	["Kicked"] remoteExec ["systemChat", 0];
};