private _vt = typeOf (vehicle _x);
_i = getText (configFile >> 'CfgVehicles' >> _vt >> 'icon');
if ((getPlayerChannel _x) in [1,2]) then {
	_i = "a3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa";
};
if (((getPlayerChannel _x) == 5) && {((player distance2D _x) < 100)}) then {
	_i = "a3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa";
};
_i;