params ["_amount"];

if ((["(EU) #11", serverName] call BIS_fnc_inString) || {serverName == "WarSimVets Warlords https://discord.gg/grmzsZE4ua"}) then {
	_totalCP = profileNamespace getVariable ["WL2_TotalEarnedCP", 0];
	profileNamespace setVariable ["WL2_TotalEarnedCP", (_totalCP + _amount)];
	saveProfileNamespace;
};