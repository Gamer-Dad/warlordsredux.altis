#include "..\..\warlords_constants.inc"

private _tentActions = (actionIDs player) select {
    (player actionParams _x) # 2 isEqualTo "tent";
};
if (count _tentActions > 0 && typeof (unitBackpack player) in ['B_RadioBag_01_mtp_F', 'B_RadioBag_01_ghex_F']) then {
    [false, "You already have a tent on you."];
} else {
    [true, ""];
};