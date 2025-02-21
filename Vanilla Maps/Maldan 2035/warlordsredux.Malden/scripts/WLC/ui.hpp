#include "constants.inc"

import RscListBox;

class WLCListBox: RscListBox {
    deletable = 0;
    canDrag = 0;
    color[] = {0, 1, 0, 1};
    colorBackground[] = {0, 0, 0, 1};
    colorSelect[] = {0, 0, 0, 1};
    colorSelectBackground[] = {1, 1, 1, 0.9};
    colorSelectBackground2[] = {1, 1, 1, 0.9};
    period = -1;
    type = CT_LISTBOX;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
    class ListScrollBar{
        color[] = {1,1,1,1};
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
        border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
    };
    style = LB_TEXTURES;
};

class WLCItemListBox: WLCListBox {
    x = 0.015;
    y = 0.075;
    w = 0.5;
    h = 0.9;
    rowHeight = 0.1;
};

class WLCComboBox: RscCombo {

};

class WLCSelectButton: RscButton {
    y = 0.01;
    h = 0.05;
    style = ST_CENTER;
    sizeEx = 0.035;
    colorBackgroundActive[] = {0, 0.5, 0.5, 0.9};
};

class WLCAttachmentPic: RscPicture {
    style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
};
class WLCAttachmentPicBg: RscText {
    colorBackground[] = {0, 0, 0, 0.8};
};

class WLC_MenuUI {
    idd = WLC_DISPLAY;
    movingEnable = true;
    class controls {
        class WLC_Draggable: IGUIBackMRTM {
            idc = WLC_DRAGGABLE;
            x = 0;
            y = -0.05;
            w = 1;
            h = 0.05;
            colorBackground[] = {0, 0, 0, 1};
            moving = 1;
        };
        class WLC_TitleBar: RscText {
            idc = -1;
            x = 0.05;
            y = -0.05;
            w = 0.9;
            h = 0.05;
            text = "Redux Customization Menu";
            style = ST_LEFT;
        };
        class WLC_Background: IGUIBackMRTM {
            idc = WLC_BACKGROUND;
            x = 0;
            y = 0;
            w = 1;
            h = 1;
            colorBackground[] = {0.2, 0.2, 0.2, 1};
        };
        class WLC_Frame: RscPicture {
            idc = -1;
            x = 0;
            y = -0.05;
            w = 1;
            h = 1.05;
            style = ST_PICTURE;
            colorText[] = {1, 1, 1, 1};
            text = "a3\ui_f\data\igui\rsctitles\interlacing\interlacing_ca.paa";
        };
        class WLC_CloseButton: RscCheckboxMRTM {
            idc = WLC_CLOSE_BUTTON;
            sizeEx = "0.021 / (getResolution select 5)";
            x = 1 - 0.0375;
            y = -0.05;
            w = 0.0375;
            h = 0.05;
            colorBackgroundHover[] = {1, 1, 1, 0.3};
            font = "PuristaMedium";
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
        class WLC_Frame_T: RscPicture {
            idc = -1;
            x = 0;
            y = -0.1;
            w = 1;
            h = 0.08;
            style = ST_PICTURE;
            text = "A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\GPS_T_ca.paa";
            moving = 1;
        };
        class WLC_Frame_B: RscPicture {
            idc = -1;
            x = 0;
            y = 0.97;
            w = 1;
            h = 0.08;
            style = ST_PICTURE;
            text = "A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\GPS_B_ca.paa";
            moving = 1;
        };
        class WLC_Frame_L: RscPicture {
            idc = -1;
            x = -0.05;
            y = -0.05;
            w = 0.08;
            h = 1.05;
            style = ST_PICTURE;
            text = "A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\GPS_L_ca.paa";
            moving = 1;
        };
        class WLC_Frame_R: RscPicture {
            idc = -1;
            x = 0.975;
            y = -0.05;
            w = 0.08;
            h = 1.05;
            style = ST_PICTURE;
            text = "A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\GPS_R_ca.paa";
            moving = 1;
        };
        class WLC_Frame_TL: RscPicture {
            idc = -1;
            x = -0.05;
            y = -0.1;
            w = 0.08;
            h = 0.08;
            style = ST_PICTURE;
            text = "A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\GPS_TL_ca.paa";
            moving = 1;
        };
        class WLC_Frame_TR: RscPicture {
            idc = -1;
            x = 0.975;
            y = -0.1;
            w = 0.08;
            h = 0.08;
            style = ST_PICTURE;
            text = "A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\GPS_TR_ca.paa";
            moving = 1;
        };
        class WLC_Frame_BL: RscPicture {
            idc = -1;
            x = -0.05;
            y = 0.97;
            w = 0.08;
            h = 0.08;
            style = ST_PICTURE;
            text = "A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\GPS_BL_ca.paa";
            moving = 1;
        };
        class WLC_Frame_BR: RscPicture {
            idc = -1;
            x = 0.975;
            y = 0.97;
            w = 0.08;
            h = 0.08;
            style = ST_PICTURE;
            text = "A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\GPS_BR_ca.paa";
            moving = 1;
        };

        class WLC_PrimarySelectButton: WLCSelectButton {
            idc = WLC_PRIMARY_SELECT_BUTTON;
            text = "Primary";
            x = 0.015;
            w = 0.15 - 0.015;
        };
        class WLC_PrimarySelect: WLCItemListBox {
            idc = WLC_PRIMARY_SELECT;
        };

        class WLC_SecondarySelectButton: WLCSelectButton {
            idc = WLC_SECONDARY_SELECT_BUTTON;
            text = "Secondary";
            x = 0.15 + 0.015;
            w = 0.15 - 0.015;
        };
        class WLC_SecondarySelect: WLCItemListBox {
            idc = WLC_SECONDARY_SELECT;
        };

        class WLC_LauncherSelectButton: WLCSelectButton {
            idc = WLC_LAUNCHER_SELECT_BUTTON;
            text = "Launcher";
            x = 0.3 + 0.015;
            w = 0.15 - 0.015;
        };
        class WLC_LauncherSelect: WLCItemListBox {
            idc = WLC_LAUNCHER_SELECT;
        };

        class WLC_UniformSelectButton: WLCSelectButton {
            idc = WLC_UNIFORM_SELECT_BUTTON;
            text = "Uniform";
            x = 0.45 + 0.015;
            w = 0.15 - 0.015;
        };
        class WLC_UniformSelect: WLCItemListBox {
            idc = WLC_UNIFORM_SELECT;
        };

        class WLC_VestSelectButton: WLCSelectButton {
            idc = WLC_VEST_SELECT_BUTTON;
            text = "Vest";
            x = 0.6 + 0.015;
            w = 0.15 - 0.015;
        };
        class WLC_VestSelect: WLCItemListBox {
            idc = WLC_VEST_SELECT;
        };

        class WLC_HelmetSelectButton: WLCSelectButton {
            idc = WLC_HELMET_SELECT_BUTTON;
            text = "Helmet";
            x = 0.75 + 0.015;
            w = 0.15 - 0.015;
        };
        class WLC_HelmetSelect: WLCItemListBox {
            idc = WLC_HELMET_SELECT;
        };

        class WLC_FullPictureDisplayBg: RscText {
            idc = WLC_FULL_DISPLAY_BG;
            x = 0.55;
            y = 0.1;
            w = 0.4;
            h = 0.4 * 4 / 3 + 0.04;
            colorBackground[] = {0, 0, 0, 0.8};
        };
        class WLC_FullPictureDisplay: RscPicture {
            idc = WLC_FULL_DISPLAY;
            x = 0.55;
            y = 0.1;
            w = 0.4;
            h = 0.4 * 4 / 3;
            style = ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
        };
        class WLC_ItemMassDisplay: RscStructuredText {
            idc = WLC_MASS_DISPLAY;
            x = 0.55;
            y = 0.68;
            w = 0.4;
            h = 0.1;
        };

        class WLC_WeaponPictureDisplayBg: RscText {
            idc = WLC_WEAPON_DISPLAY_BG;
            x = 0.55;
            y = 0.1;
            w = 0.39;
            h = 0.2;
            colorBackground[] = {0, 0, 0, 0.8};
        };
        class WLC_WeaponPictureDisplay: RscPicture {
            idc = WLC_WEAPON_DISPLAY;
            x = 0.57;
            y = -0.05;
            w = 0.35;
            h = 0.35 * 4 / 3;
            style = ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
        };
        class WLC_WeaponPictureDisplayTooltipHelper: RscText {
            idc = WLC_WEAPON_DISPLAY_TOOLTIP_HELPER;
            text = "";
            x = 0.55;
            y = 0.1;
            w = 0.39;
            h = 0.2;
        };

        class WLC_WeaponAttachmentsSelector: WLCComboBox {
            idc = WLC_WEAPON_ATTACHMENT_SELECT;
            x = 0.55;
            y = 0.31;
            w = 0.3;
            h = 0.045;
        };
        class WLC_WeaponAttachmentsDisplay: RscControlsGroup {
            idc = WLC_ATTACHMENT_DISPLAY;
            x = 0.55;
            y = 0.37;
            w = 0.45;
            h = 0.1;
        };

        class WLC_MagazinesSelector: WLCComboBox {
            idc = WLC_MAGAZINE_SELECT;
            x = 0.55;
            y = 0.48;
            w = 0.3;
            h = 0.05;
            rowHeight = 0.04;
        };
        class WLC_MagazinesDisplay: RscControlsGroup {
            idc = WLC_MAGAZINE_DISPLAY;
            x = 0.55;
            y = 0.54;
            w = 0.45;
            h = 0.25;
        };

        class WLC_ItemCostDisplay: RscStructuredText {
            idc = WLC_COST_DISPLAY;
            x = 0.55;
            y = 0.78;
            w = 0.45;
            h = 0.1;
        };

        class WLC_LevelDisplay: RscText {
            idc = WLC_LEVEL_TEXT;
            x = 0;
            y = -0.05;
            w = 1;
            h = 0.05;
            style = ST_CENTER;
        };
        class WLC_CostDisplay: RscStructuredText {
            idc = WLC_COST_TEXT;
            x = 0;
            y = -0.045;
            w = 0.95;
            h = 0.05;
        };
    };
};