private _eligibleSectors = (BIS_WL_sectorsArray # 2) select {
    !isNull (_x getVariable ["WL_sectorHQ", objNull])
};
if (count _eligibleSectors == 0) then {
    [false, "No Sector Strongholds available."];
} else {
    [true, ""];
};