player addAction [
	format["<t color='#E5E500' shadow='2'>&#160;%1</t>", "Unflip"],
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		cursorObject call KS_fnc_unflipVehicle;
	},
	nil, 
	12, 
	true, 
	false, 
	"", 
	"((isNull objectParent player) && {(alive cursorObject) && {(!isNull cursorObject) && {(cursorObject call KS_fnc_isFlipped) && {(cursorObject isKindOf 'LandVehicle') && {({alive _x} count crew cursorObject isEqualTo 0) && {(player distance cursorObject) < 10}}}}}})", 
	10
];