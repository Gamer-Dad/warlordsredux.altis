#include "..\warlords_constants.inc"

/* 
* This function is used to inform the side of the recipient about a donation. It must be remote executed to ensure that everybody sees it.
*/
params ["_from", "_to", "_amount"];

if (true) exitwith {
	[side _to, "Base"] commandChat format [ localize "STR_A3_WL_donate_cp", name _from, name _to, _amount];
};
