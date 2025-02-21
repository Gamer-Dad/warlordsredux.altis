import RscText;
import RscPicture;
import RscCombo;
import RscControlsGroup;
import RscButton;
import ScrollBar;

class WLM_PylonUI {
    idd = 5300;
    movingEnable = true;
    class controls {
        class WLM_Draggable: IGUIBackMRTM {
            idc = 5301;
            x = 0;
            y = -0.05;
            w = 1;
            h = 0.05;
            colorBackground[] = {0, 0, 0, 1};
            moving = 1;
        };
        class WLM_TitleBar: RscText {
            idc = -1;
            x = 0;
            y = -0.05;
            w = 1;
            h = 0.05;
            text = $STR_WLM_TITLE;
            style = ST_CENTER;
        };
        class WLM_Background: IGUIBackMRTM {
            idc = 5302;
            x = 0;
            y = 0;
            w = 1;
            h = 1;
            colorBackground[] = {0.2, 0.2, 0.2, 1};
        };
        class WLM_AircraftPicture: RscPicture {
            idc = 5303;
            x = 0;
            y = 0;
            w = 0.75;
            h = 1;
            style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
            colorText[] = {1, 1, 1, 0.8};
            text = "\A3\ui_f\data\map\markers\handdrawn\unknown_CA.paa";
        };
        class WLM_Frame: RscPicture {
            idc = -1;
            x = 0;
            y = -0.05;
            w = 1;
            h = 1.05;
            style = ST_PICTURE;
            colorText[] = {1, 1, 1, 1};
            text = "a3\ui_f\data\igui\rsctitles\interlacing\interlacing_ca.paa";
        };
        class WLM_MagazinesGroup: RscControlsGroup {
            deletable = 0;
            fade = 0;
            class VScrollbar : ScrollBar
            {
                color[] = {1,1,1,1};
                width = 0.021;
                autoScrollEnabled = 1;
            };
            class HScrollbar : ScrollBar
            {
                height = 0;
            };
            class Controls {
                class WLM_VehicleName: RscText {
                    idc = 5313;
                    x = 0;
                    y = 0;
                    w = 0.8;
                    h = 0.073;
                    sizeEx = 0.08;
                    text = "";
                    colorText[] = {1, 1, 1, 0.8};
                    font = "PuristaMedium";
                    shadow = 0;
                };
            };
            type = CT_CONTROLS_GROUP;
            idc = 5312;
            x = 0;
            y = 0;
            w = 0.8;
            h = 1;
            shadow = 0;
            style = ST_MULTI;
        };
        class WLM_AircraftName: RscText {
            idc = 5310;
            x = 0;
            y = 0;
            w = 0.8;
            h = 0.073;
            sizeEx = 0.08;
            text = "";
            colorText[] = {1, 1, 1, 0.8};
            font = "PuristaMedium";
            shadow = 0;
        };
        class WLM_ApplyButton: RscButtonMRTM {
            idc = 5304;
            text = $STR_WLM_APPLY;
            tooltip = $STR_WLM_APPLY_DESC;
            sizeEx = 0.035;
            colorBackground[] = {1, 1, 1, 0.1};
            x = 0.8;
            y = 0.05;
            w = 0.194;
            h = 0.055;
            font = "PuristaMedium";
            style = ST_LEFT;
        };
        class WLM_LoadoutText: RscText {
            idc = -1;
            x = 0.8;
            y = 0.12;
            w = 0.194;
            h = 0.055;
            sizeEx = 0.05;
            text = $STR_WLM_LOADOUT;
            colorText[] = {1, 1, 1, 1};
            font = "PuristaMedium";
            shadow = 0;
        };
        class WLM_SaveButton: RscButtonMRTM {
            idc = 5305;
            text = $STR_WLM_SAVE;
            tooltip = $STR_WLM_SAVE_DESC;
            sizeEx = 0.035;
            colorBackground[] = {1, 1, 1, 0.1};
            x = 0.8;
            y = 0.28;
            w = 0.194;
            h = 0.055;
            font = "PuristaMedium";
            style = ST_LEFT;
        };

        class WLM_LoadSelect: RscCombo {
            idc = 5306;
            text = $STR_WLM_LOADOUT;
            tooltip = $STR_WLM_SELECT_LOADOUT;
            sizeEx = 0.035;
            colorBackground[] = {0, 0, 0, 1};
            x = 0.8;
            y = 0.20;
            w = 0.194;
            h = 0.055;
            font = "PuristaMedium";
            style = ST_BACKGROUND;
            arrowFull = "";
        };

        class WLM_WipeButton: RscButtonMRTM {
            idc = 5307;
            text = $STR_WLM_WIPE_ALL;
            tooltip = $STR_WLM_WIPE_ALL_DESC;
            sizeEx = 0.035;
            colorBackground[] = {1, 1, 1, 0.1};
            x = 0.8;
            y = 0.36;
            w = 0.194;
            h = 0.055;
            font = "PuristaMedium";
            style = ST_LEFT;
        };
        class WLM_RearmButton: RscButtonMRTM {
            idc = 5308;
            text = $STR_WLM_REARM;
            tooltip = $STR_WLM_REARM_DESC;
            sizeEx = 0.035;
            colorBackground[] = {1, 1, 1, 0.1};
            x = 0.8;
            y = 0.8;
            w = 0.194;
            h = 0.055;
            font = "PuristaMedium";
            style = ST_LEFT;
        };
        class WLM_AppearanceText: RscText {
            idc = -1;
            x = 0.8;
            y = 0.44;
            w = 0.194;
            h = 0.055;
            sizeEx = 0.05;
            text = $STR_WLM_APPEARANCE;
            colorText[] = {1, 1, 1, 1};
            font = "PuristaMedium";
            shadow = 0;
        };
        class WLM_CamoSelect: RscCombo {
            idc = 5311;
            text = "Camo";
            tooltip = $STR_WLM_SELECT_TEXTURE;
            sizeEx = 0.035;
            colorBackground[] = {0, 0, 0, 1};
            x = 0.8;
            y = 0.51;
            w = 0.194;
            h = 0.055;
            font = "PuristaMedium";
            style = ST_BACKGROUND;
            arrowFull = "";
        };
        class WLM_CustomizationSelect: RscCombo {
            idc = 5314;
            text = $STR_WLM_CUSTOMIZATION;
            tooltip = $STR_WLM_CUSTOMIZATION_TOOLTIP;
            sizeEx = 0.035;
            colorBackground[] = {0, 0, 0, 1};
            x = 0.8;
            y = 0.59;
            w = 0.194;
            h = 0.055;
            font = "PuristaMedium";
            style = ST_BACKGROUND;
            arrowFull = "";
        };
        class WLM_CloseButton: RscCheckboxMRTM {
            idc = 5309;
            sizeEx = "0.021 / (getResolution select 5)";
            x = 1 - 0.0375;
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

        class WLM_Frame_T: RscPicture {
            idc = -1;
            x = 0;
            y = -0.1;
            w = 1;
            h = 0.08;
            style = ST_PICTURE;
            text = "A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\GPS_T_ca.paa";
            moving = 1;
        };
        class WLM_Frame_B: RscPicture {
            idc = -1;
            x = 0;
            y = 0.97;
            w = 1;
            h = 0.08;
            style = ST_PICTURE;
            text = "A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\GPS_B_ca.paa";
            moving = 1;
        };
        class WLM_Frame_L: RscPicture {
            idc = -1;
            x = -0.05;
            y = -0.05;
            w = 0.08;
            h = 1.05;
            style = ST_PICTURE;
            text = "A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\GPS_L_ca.paa";
            moving = 1;
        };
        class WLM_Frame_R: RscPicture {
            idc = -1;
            x = 0.975;
            y = -0.05;
            w = 0.08;
            h = 1.05;
            style = ST_PICTURE;
            text = "A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\GPS_R_ca.paa";
            moving = 1;
        };
        class WLM_Frame_TL: RscPicture {
            idc = -1;
            x = -0.05;
            y = -0.1;
            w = 0.08;
            h = 0.08;
            style = ST_PICTURE;
            text = "A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\GPS_TL_ca.paa";
            moving = 1;
        };
        class WLM_Frame_TR: RscPicture {
            idc = -1;
            x = 0.975;
            y = -0.1;
            w = 0.08;
            h = 0.08;
            style = ST_PICTURE;
            text = "A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\GPS_TR_ca.paa";
            moving = 1;
        };
        class WLM_Frame_BL: RscPicture {
            idc = -1;
            x = -0.05;
            y = 0.97;
            w = 0.08;
            h = 0.08;
            style = ST_PICTURE;
            text = "A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\GPS_BL_ca.paa";
            moving = 1;
        };
        class WLM_Frame_BR: RscPicture {
            idc = -1;
            x = 0.975;
            y = 0.97;
            w = 0.08;
            h = 0.08;
            style = ST_PICTURE;
            text = "A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\GPS_BR_ca.paa";
            moving = 1;
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
    colorActive[] = {1, 1, 1, 1};
    colorSelect[] = {1, 1, 1, 1};
    colorText[] = {1, 1, 1, 1};
    shadow = 0;
    colorShadow[] = {1, 1, 1, 0};
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

class WLM_Modal_Dialog {
    idd = 5700;
    movingEnable = true;
    class controls {
        class WLM_Modal_Draggable: IGUIBackMRTM {
            idc = 5701;
            x = 0.015;
            y = 0.263;
            w = 0.97;
            h = 0.05;
            colorBackground[] = {1, 0.5, 0, 1};
            moving = 1;
        };
        class WLM_Modal_Title : RscTextMRTM {
            idc = 5702;
            text = $STR_WLM_PYLON_MISMATCH_WARNING;
            sizeEx = 0.04;
            x = 0.015;
            y = 0.263;
            w = 0.97;
            h = 0.05;
            font = "PuristaMedium";
            colorText[] = {1, 1, 1, 1};
            shadow = 0;
            style = ST_LEFT;
        };
        class WLM_Modal_Background: IGUIBackMRTM {
            idc = 5703;
            x = 0.015;
            y = 0.318;
            w = 0.97;
            h = 0.145;
            colorBackground[] = {0, 0, 0, 1};
        };
        class WLM_Modal_ConfirmButton: RscButtonMRTM {
            idc = 5704;
            text = $STR_WLM_REARM;
            tooltip = $STR_WLM_PYLON_OLD_SETTINGS;
            sizeEx = 0.035;
            colorBackground[] = {0, 0, 0, 0.9};
            x = 0.015;
            y = 0.468;
            w = 0.145;
            h = 0.055;
            font = "PuristaMedium";
        };
        class WLM_Modal_ExitButton: RscButtonMRTM {
            idc = 5705;
            text = $STR_WLM_GO_BACK;
            tooltip = $STR_WLM_PYLON_SELECTION_SCREEN;
            sizeEx = 0.035;
            colorBackground[] = {0, 0, 0, 0.9};
            x = 0.839;
            y = 0.469;
            w = 0.145;
            h = 0.055;
            font = "PuristaMedium";
        };
        class WLM_Modal_Text: RscTextMRTM {
            idc = 5706;
            text = $STR_WLM_PYLON_MISMATCH_MESSAGE;
            sizeEx = 0.035;
            x = 0.020;
            y = 0.328;
            w = 0.960;
            h = 0.145;
            font = "PuristaMedium";
            colorText[] = {1, 1, 1, 1};
            shadow = 0;
            style = ST_MULTI;
        };
        class WLM_Modal_MiddleBar: IGUIBackMRTM {
            idc = 5707;
            x = 0.165;
            y = 0.469;
            w = 0.669;
            h = 0.0545;
            colorBackground[] = {0, 0, 0, 1};
        };
        class WLM_Modal_InputEdit: RscEditMRTM {
            idc = 5708;
            text = "";
            sizeEx = 0.06;
            x = 0.265;
            y = 0.328;
            w = 0.710;
            h = 0.109;
            font = "PuristaMedium";
            colorText[] = {1, 1, 1, 1};
            tooltip = "Enter new loadout name";
            onLoad = "(_this # 0) ctrlShow false;";
            maxChars = 30;
        };
    };
};