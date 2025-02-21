params ["_munition"];
private _allowedMunitionsMap = [
    "ShellCore",
    "MissileCore",
    "SubmunitionCore",
    "RocketCore"
];
_allowedMunitionsMap findIf { _munition isKindOf _x } >= 0