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
	private _multiplier = switch (_x) do {
		case (west): {
			missionNamespace getVariable "blanceMultilplierBlu"
		};
		case (east): {
			missionNamespace getVariable "blanceMultilplierOpf"
		};
	};

	private _incomeStandard = _x call WL2_fnc_income;
	private _actualIncome = round (_incomeStandard * _multiplier);
	switch (_x) do {
		case (west): {
			serverNamespace setVariable ["actualIncomeBlu", _actualIncome]
		};
		case (east): {
			serverNamespace setVariable ["actualIncomeOpf", _actualIncome]
		};
	};
} forEach BIS_WL_competingSides;