import RscText;
import RscPicture;
import RscCombo;
import RscControlsGroup;
import RscButton;

class WLM_PylonUI {
    idd = 5300;
    movingEnable = true;
    class controls {
        class WLM_Draggable: IGUIBackMRTM {
            idc = 5301;
            x = 0;
            y = -0.05;
            w = 0.95;
            h = 0.05;
            colorBackground[] = {0.2, 0.4, 1, 1};
            moving = 1;
        };
		class WLM_TitleBar: RscText {
            idc = -1;
            x = 0;
            y = -0.05;
            w = 0.95;
            h = 0.05;
			text = $STR_WLM_TITLE;
			style = ST_LEFT;
        };
        class WLM_Background: IGUIBackMRTM {
            idc = 5302;
            x = 0;
            y = 0;
            w = 0.95;
            h = 1;
            colorBackground[] = {0.4, 0.6, 1, 0.95};
        };
        class WLM_AircraftPicture: RscPicture {
            idc = 5303;
            x = 0;
            y = 0;
            w = 0.75;
            h = 1;
            style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
			colorText[] = {0, 0, 0, 1};
			text = "\A3\ui_f\data\map\markers\handdrawn\unknown_CA.paa";
        };
		class WLM_AircraftName: RscText {
			idc = 5310;
			x = 0;
            y = 0;
            w = 0.8;
            h = 0.04 * safeZoneH;
			sizeEx = 0.08;
			text = $STR_WLM_AIRCRAFT_NAME;
			colorText[] = {0, 0, 0, 0.8};
			font = "PuristaMedium";
			shadow = 0;
		};
        class WLM_ApplyButton: RscButtonMRTM {
			idc = 5304;
			text = $STR_WLM_APPLY_PYLONS;
			tooltip = $STR_WLM_APPLY_PYLONS_DESC;
			sizeEx = 0.035;
			colorBackground[] = {0, 0, 0, 0.9};
			x = 0.8;
			y = 0.05;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
			font = "PuristaMedium";
			style = ST_LEFT;
		};

        class WLM_SaveButton: RscButtonMRTM {
			idc = 5305;
			text = $STR_WLM_SAVE;
			tooltip = $STR_WLM_SAVE_DESC;
			sizeEx = 0.035;
			colorBackground[] = {0, 0, 0, 0.9};
			x = 0.8;
			y = 0.28;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
			font = "PuristaMedium";
			style = ST_LEFT;
		};

        class WLM_LoadSelect: RscCombo {
			idc = 5306;
			text = $STR_WLM_LOADOUT;
			tooltip = $STR_WLM_SELECT_LOADOUT;
			sizeEx = 0.035;
			colorBackground[] = {0, 0, 0, 0.9};
			x = 0.8;
			y = 0.20;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
			font = "PuristaMedium";
			style = ST_BACKGROUND;
			arrowFull = "";
		};

		class WLM_WipeButton: RscButtonMRTM {
			idc = 5307;
			text = $STR_WLM_WIPE_ALL;
			tooltip = $STR_WLM_WIPE_ALL_DESC;
			sizeEx = 0.035;
			colorBackground[] = {0, 0, 0, 0.9};
			x = 0.8;
			y = 0.36;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
			font = "PuristaMedium";
			style = ST_LEFT;
		};

		class WLM_RearmButton: RscButtonMRTM {
			idc = 5308;
			text = $STR_WLM_REARM;
			tooltip = $STR_WLM_REARM_DESC;
			sizeEx = 0.035;
			colorBackground[] = {0, 0, 0, 0.9};
			x = 0.8;
			y = 0.8;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
			font = "PuristaMedium";
			style = ST_LEFT;
		};
		class WLM_CamoSelect: RscCombo {
			idc = 5311;
			text = "Camo";
			tooltip = $STR_WLM_SELECT_TEXTURE;
			sizeEx = 0.035;
			colorBackground[] = {0, 0, 0, 0.9};
			x = 0.8;
			y = 0.51;
			w = 0.06 * safezoneW;
			h = 0.03 * safezoneH;
			font = "PuristaMedium";
			style = ST_BACKGROUND;
			arrowFull = "";
		};
        class WLM_CloseButton: RscCheckboxMRTM {
			idc = 5309;
			sizeEx = "0.021 / (getResolution select 5)";
			x = 0.95 - 0.0375;
			y = -0.05;
			w = 0.0375;
			h = 0.05;
			colorBackgroundHover[] = {1, 1, 1, 0.3};
			font = "PuristaMedium";
			action = "(findDisplay 5300) closeDisplay 1;";
			textureUnChecked = "\A3\ui_f\data\map\groupicons\waypoint.paa";
			textureChecked = "\A3\ui_f\data\map\groupicons\waypoint.paa";
			textureFocusedChecked = "\A3\ui_f\data\map\groupicons\waypoint.paa";
			textureFocusedUnchecked = "\A3\ui_f\data\map\groupicons\waypoint.paa";
			textureHoverChecked = "\A3\ui_f\data\map\groupicons\waypoint.paa";
			textureHoverUnchecked = "\A3\ui_f\data\map\groupicons\waypoint.paa";
			texturePressedChecked = "\A3\ui_f\data\map\groupicons\waypoint.paa";
			texturePressedUnchecked = "\A3\ui_f\data\map\groupicons\waypoint.paa";
			textureDisabledChecked = "\A3\ui_f\data\map\groupicons\waypoint.paa";
			textureDisabledUnchecked = "\A3\ui_f\data\map\groupicons\waypoint.paa";
		};
    };
};

class WLM_PylonSelect: RscCombo {
    idc = 5401;
    font = "PuristaMedium";
    sizeEx = 0.035;
    x = 0;
    y = 0;
    w = 0.17;
    h = 0.035;
    style = ST_BACKGROUND;
};
class WLM_PylonSelectUser: RscButton {
	idc = 5402;
	text = "a3\ui_f\data\IGUI\Cfg\CommandBar\imageDriver_ca.paa";
	sizeEx = 0.035;
	x = 0;
	y = 0;
	w = 0.035;
	h = 0.035;
	font = "PuristaMedium";
	style = ST_CENTER + ST_PICTURE + ST_KEEP_ASPECT_RATIO;
};

class WLM_ConfirmationDialog {
    idd = 5700;
    movingEnable = true;
    class controls {
        class WLM_Draggable: IGUIBackMRTM {
            idc = 5701;
            x = 0.3 * safeZoneW + safeZoneX;
            y = 0.4 * safeZoneH - 0.05 + safeZoneY - 0.005;
            w = 0.4 * safeZoneW;
            h = 0.05;
            colorBackground[] = {1, 0.5, 0, 1};
            moving = 1;
        };
		class WLM_Title : RscTextMRTM {
			idc = 5702;
			text = $STR_WLM_PYLON_MISMATCH_WARNING;
			sizeEx = 0.04;
			x = 0.3 * safeZoneW + safeZoneX;
            y = 0.4 * safeZoneH - 0.05 + safeZoneY - 0.005;
			w = 0.4 * safeZoneW;
			h = 0.05;
			font = "PuristaMedium";
			colorText[] = {1, 1, 1, 1};
			shadow = 0;
			style = ST_LEFT;
		};
        class WLM_Background: IGUIBackMRTM {
            idc = 5703;
            x = 0.3 * safeZoneW + safeZoneX;
            y = 0.4 * safeZoneH + safeZoneY;
            w = 0.4 * safeZoneW;
            h = 0.08 * safeZoneH;
            colorBackground[] = {0, 0, 0, 1};
        };
		class WLM_ConfirmButton: RscButtonMRTM {
			idc = 5704;
			text = $STR_WLM_REARM;
			tooltip = $STR_WLM_PYLON_OLD_SETTINGS;
			sizeEx = 0.035;
			colorBackground[] = {0, 0, 0, 0.9};
			x = 0.3 * safeZoneW + safeZoneX;
			y = 0.48 * safeZoneH + safeZoneY + 0.005;
			w = 0.06 * safeZoneW;
			h = 0.03 * safeZoneH;
			font = "PuristaMedium";
		};
		class WLM_ExitButton: RscButtonMRTM {
			idc = 5705;
			text = $STR_WLM_GO_BACK;
			tooltip = $STR_WLM_PYLON_SELECTION_SCREEN;
			sizeEx = 0.035;
			colorBackground[] = {0, 0, 0, 0.9};
			x = 0.7 * safeZoneW - 0.06 * safezoneW + safeZoneX;
			y = 0.48 * safeZoneH + safeZoneY + 0.005;
			w = 0.06 * safeZoneW;
			h = 0.03 * safeZoneH;
			font = "PuristaMedium";
		};
		class WLM_ConfirmText: RscTextMRTM {
			idc = 5706;
			text = $STR_WLM_PYLON_MISMATCH_MESSAGE;
			sizeEx = 0.035;
			x = 0.3 * safeZoneW + safeZoneX + 0.005;
			y = 0.4 * safeZoneH + safeZoneY + 0.01;
			w = 0.4 * safeZoneW - 0.01;
			h = 0.08 * safeZoneH;
			font = "PuristaMedium";
			colorText[] = {1, 1, 1, 1};
			shadow = 0;
			style = ST_MULTI;
		};
		class WLM_MiddleBar: IGUIBackMRTM {
			idc = 5707;
			x = 0.36 * safeZoneW + safeZoneX + 0.005;
			y = 0.48 * safeZoneH + safeZoneY + 0.005;
			w = 0.276 * safeZoneW;
			h = 0.03 * safeZoneH;
			colorBackground[] = {0, 0, 0, 1};
		};
    };
};