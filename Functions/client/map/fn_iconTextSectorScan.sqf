params ["_unit"];

if !(vehicle _unit isKindOf "CAManBase") then {
	getText (configFile >> 'CfgVehicles' >> (typeOf _unit) >> 'displayName');
} else {
	"";
};