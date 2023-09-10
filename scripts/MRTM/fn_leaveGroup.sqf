_units = ((units player) select {(_x getVariable ["BIS_WL_ownerAsset", "123"]) == (getPlayerUID player)});
_group = createGroup (side group player);
_units joinSilent _group;