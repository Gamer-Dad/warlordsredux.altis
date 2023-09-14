params ["_p"];

private _vt = typeOf (vehicle _p);
_i = getText (configFile >> 'CfgVehicles' >> _vt >> 'icon');
if ((getPlayerChannel _p) in [1,2]) then {
	_i = "a3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa";
};
if (((getPlayerChannel _p) == 5) && {((player distance2D _p) < 100)}) then {
	_i = "a3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa";
};
_i;