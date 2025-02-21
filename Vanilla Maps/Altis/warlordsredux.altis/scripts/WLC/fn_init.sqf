#include "constants.inc"

if (WLC_ENABLED == 0) exitWith {};

private _customizationConfig = missionConfigFile >> "CfgWLCCustomization";

{
    private _side = str _x;
    private _customizationSide = _customizationConfig >> _side;
    {
        private _type = _x;
        private _customization = createHashMap;
        private _customizationByType = configProperties [_customizationSide >> _type];
        {
            private _customizationClass = configName _x;
            private _customizationName = getText (_x >> "name");
            private _customizationItem = getText (_x >> "item");
            private _customizationLevel = getNumber (_x >> "level");
            private _customizationCost = getNumber (_x >> "cost");
            private _customizationAttachments = getArray (_x >> "attachments");

            if (_customizationName == "") then {
                _customizationName = getText (configFile >> "CfgWeapons" >> _customizationItem >> "displayName");
            };

            private _customizationVariants = createHashMap;
            private _customizationAttachmentClasses = "inheritsFrom _x == (missionConfigFile >> 'WLCAttachment')" configClasses _x;
            {
                private _variantEntry = createHashMap;
                _variantEntry set ["name", getText (_x >> "name")];
                _variantEntry set ["attachments", getArray (_x >> "attachments")];
                _customizationVariants set [configName _x, _variantEntry];
            } forEach _customizationAttachmentClasses;

            private _customizationLoadouts = createHashMap;
            private _customizationAmmoClasses = "inheritsFrom _x == (missionConfigFile >> 'WLCAmmo')" configClasses _x;
            {
                private _loadoutEntry = createHashMap;
                _loadoutEntry set ["name", getText (_x >> "name")];

                private _magazinesFinal = [];
                private _magazines = getArray (_x >> "magazines");
                {
                    private _type = _x # 0;
                    private _count = _x # 1;
                    for "_i" from 1 to _count do {
                        _magazinesFinal pushBack _type;
                    };
                } forEach _magazines;
                _loadoutEntry set ["magazines", _magazinesFinal];

                _loadoutEntry set ["cost", getNumber (_x >> "cost")];
                _loadoutEntry set ["level", getNumber (_x >> "level")];
                _customizationLoadouts set [configName _x, _loadoutEntry];
            } forEach _customizationAmmoClasses;

            private _customizationHashMap = createHashMapFromArray [
                ["name", _customizationName],
                ["item", _customizationItem],
                ["level", _customizationLevel],
                ["cost", _customizationCost],
                ["attachments", _customizationAttachments],
                ["variants", _customizationVariants],
                ["loadouts", _customizationLoadouts]
            ];

            _customization set [_customizationClass, _customizationHashMap];
        } forEach _customizationByType;
        missionNamespace setVariable [format ["WLC_%1_%2", _type, _side], _customization];
    } forEach ["Primary", "Secondary", "Launcher", "Uniform", "Vest", "Helmet"];
} forEach [west, east];

if (isServer) then {
    // Clean up last patch
    profileNamespace setVariable ["WLC_Scores", createHashMap];
};