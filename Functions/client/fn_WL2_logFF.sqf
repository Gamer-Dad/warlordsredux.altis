params ["_sideOwner", "_sideCrew", "_uid", "_crew", "_selectCrew", "_vicSideCrew", "_ff"];

diag_log str serverTime;
diag_log (format ["Side Vic Owner: %1|", _sideOwner]);
diag_log (format ["Side Vic Crew: %1|", _sideCrew]);
diag_log (format ["Vic UID: %1|", _uid]);
diag_log (format ["Vic Crew: %1|", _crew]);
diag_log (format ["Select Crew Side: %1|", _selectCrew]);
diag_log (format ["Vic Crew Side: %1|", _vicSideCrew]);
diag_log (format ["FF: %1|", _ff]);