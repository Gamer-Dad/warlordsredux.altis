_countFaction0 = playersNumber west;
_fac0Percentage = 0.1;
if ((count allPlayers) > 0) then {
	_fac0Percentage = (1.6 * _countFaction0 / count allPlayers) + 0.2;
};
_multiBlu = 2 - _fac0Percentage;
missionNamespace setVariable ["blanceMultilplierBlu", _multiBlu];
publicVariable "blanceMultilplierBlu";
_multiOpf = _fac0Percentage;
missionNamespace setVariable ["blanceMultilplierOpf", _multiOpf];
publicVariable "blanceMultilplierOpf";
{
	_incomeStandard = _x call BIS_fnc_WL2_income;
	_actualIncome = round (_incomeStandard * (if (_x == west) then [{(missionNamespace getVariable "blanceMultilplierBlu")}, {(missionNamespace getVariable "blanceMultilplierOpf")}]));
	if (_x == west) then [{serverNamespace setVariable ["actualIncomeBlu", _actualIncome]}, {serverNamespace setVariable ["actualIncomeOpf", _actualIncome]}]
} forEach BIS_WL_competingSides;