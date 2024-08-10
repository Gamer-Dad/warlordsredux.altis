class welcomeScreen
{
	idd = 9000;

	class controls
	{
		class welcomeFrame: IGUIBackMRTM
		{
			idc = 9001;
			deletable = 0;
			x = 0.250656 * safezoneW + safezoneX;
			y = 0.171 * safezoneH + safezoneY;
			w = 0.499688 * safezoneW;
			h = 0.671 * safezoneH;
			colorText[] = {1,1,1,1};
		};

		class welcomeMain: IGUIBackMRTM
		{
			idc = -1;
			deletable = 0;
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.484688 * safezoneW;
			h = 0.649 * safezoneH;
			colorText[] = {1,1,1,1};
			colorActive[] = {1,1,1,1};
		};

		class welcomeMainImg: RscPictureMRTM
		{
			idc = -1;
			text = "a3\map_altis\data\picturemap_ca.paa";
			style = ST_MULTI + ST_TITLE_BAR;
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.484688 * safezoneW;
			h = 0.649 * safezoneH;
		};

		class welcomeText: RscStructuredTextMRTM
		{
			idc = 9005;
			deletable = 0;
			text = "Warlords Redux v2.5";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class welcomeTextToRead: RscStructuredTextMRTM
		{
			idc = 9006;
			deletable = 0;
			text = "";
			font = "puristaMedium";
			x = 0.508594 * safezoneW + safezoneX;
			y = 0.801 * safezoneH + safezoneY;
			w = 0.189531 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class welcomeSlidePic: RscPictureMRTM
		{
			idc = 9007;
			style = ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.209 * safezoneH;
		};

		class welcomeListFrame: RscFrameMRTM
		{
			type = CT_STATIC;
			idc = -1;
			deletable = 0;
			style = ST_FRAME;
			colorBackground[] = {0,0,0,0};
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.286 * safezoneH;
		};

		class welcomeTextBlockFrame: RscFrameMRTM
		{
			type = CT_STATIC;
			sizeEx = "0.021 / (getResolution select 5)";
			idc = -1;
			deletable = 0;
			style = ST_FRAME;
			colorBackground[] = {0,0,0,0};
			x = 0.485469 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.245937 * safezoneW;
			h = 0.528 * safezoneH;
		};

		class welcomeControlGroup: RscControlsGroupMRTM
		{
			deletable = 0;
			fade = 0;
			class VScrollbar: ScrollBar
			{
				color[] = {1,1,1,1};
				height = 0.528;
				width = 0.021;
				autoScrollEnabled = 1;
			};

			class HScrollbar: ScrollBar
			{
				color[] = {1,1,1,1};
				height = 0;
				width = 0;
			};

			class Controls
			{
				class welcomeTextBlock: RscStructuredTextMRTM
				{
					idc = 9010;
					deletable = 0;
					type = CT_STRUCTURED_TEXT;
					style = ST_LEFT;
					w = 0.245937 * safezoneW;
					h = 4.6 * safezoneH;
				};
			};

			type = CT_CONTROLS_GROUP;
			idc = -1;
			x = 0.485469 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.255937 * safezoneW;
			h = 0.528 * safezoneH;
			shadow = 0;
			style = ST_MULTI;
		};

		class welcomeList: RscListboxMRTM
		{
			idc = 9011;
			deletable = 0;
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.286 * safezoneH;
		};
		class welcomeCloseButton: RscButtonMRTM
		{
			idc = 1;
			access = 0;
			type = CT_BUTTON;
			text = "Close";
			sizeEx = "0.021 / (getResolution select 5)";
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {1,1,1,0};
			soundEnter[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundEnter", 0.09, 1};
			soundPush[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundPush", 0.0, 0};
			soundClick[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundClick", 0.07, 1};
			soundEscape[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundEscape", 0.09, 1};
			style = 2;
			x = 0.678594 * safezoneW + safezoneX;
			y = 0.794 * safezoneH + safezoneY;
			w = 0.059531 * safezoneW;
			h = 0.033 * safezoneH;
			shadow = 0;
			offsetX = 0.000;
			offsetY = 0.000;
			offsetPressedX = 0.002;
			offsetPressedY = 0.002;
			borderSize = 0;
			onLoad =  "(_this # 0) ctrlEnable false;";
			action = "[] call MRTM_fnc_updateViewDistance;";
		};
	};
};

class rearmMenu
{
	idd = 1000;

	class controls
	{
		class MRTMRearmBack: IGUIBackMRTM
		{
			idc = 1001;
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.515625 * safezoneW;
			h = 0.495 * safezoneH;
		};
		class MRTMRearmOk: RscButtonMRTM
		{
			idc = 1;
			type = CT_BUTTON;
			text = "Rearm";
			sizeEx = "0.021 / (getResolution select 5)";
			x = 0.68975 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
			onLoad =  "(_this # 0) ctrlEnable true;";
		};
		class MRTMRearmCamoText: RscStructuredTextMRTM
		{
			idc = 1100;
			text = "Camo Netting:";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class MRTMRearmHullList: RscListboxMRTM
		{
			idc = 1500;
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.187 * safezoneH;
		};
		class MRTMRearmHullText: RscStructuredTextMRTM
		{
			idc = 1101;
			text = "SLAT armor:";
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class MRTMRearmCamoList: RscListboxMRTM
		{
			idc = 1501;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.187 * safezoneH;
		};
		class MRTMRearmOtherText: RscStructuredTextMRTM
		{
			idc = 1103;
			text = "Other customizations:";
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class MRTMRearmOtherList: RscListboxMRTM
		{
			idc = 1503;
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.143 * safezoneH;
		};
		class MRTMRearmCustomAmmoText: RscStructuredTextMRTM
		{
			idc = 1104;
			text = "Custom ammo: Soon™";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class MRTMRearmLiveryText: RscStructuredTextMRTM
		{
			idc = 1102;
			text = "Liveries:";
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class MRTMRearmLiveryList: RscListboxMRTM
		{
			idc = 1502;
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.187 * safezoneH;
		};
		class RscFrame_1800: RscFrameMRTM
		{
			idc = 1800;
			x = 0.265905 * safezoneW + safezoneX;
			y = 0.5066 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.198 * safezoneH;
		};
		class RscFrame_1801: RscFrameMRTM
		{
			idc = 1801;
			x = 0.265907 * safezoneW + safezoneX;
			y = 0.2536 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.242 * safezoneH;
		};
		class RscFrame_1802: RscFrameMRTM
		{
			idc = 1802;
			x = 0.420594 * safezoneW + safezoneX;
			y = 0.2536 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.242 * safezoneH;
		};
		class RscFrame_1803: RscFrameMRTM
		{
			idc = 1803;
			x = 0.576313 * safezoneW + safezoneX;
			y = 0.2536 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.242 * safezoneH;
		};
		class RscFrame_1804: RscFrameMRTM
		{
			idc = 1804;
			x = 0.420593 * safezoneW + safezoneX;
			y = 0.5066 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.198 * safezoneH;
		};
		class MRTMRearmCustomAmmoClassified: RscPictureMRTM
		{
			idc = 69691;
			text = "img\classified_ca.paa";
			sizeEx = "0.021 / (getResolution select 5)";
			style = ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.530 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.187 * safezoneH;
		};
		/*class MRTMRearmLiveryClassified: RscPictureMRTM
		{
			idc = 69691;
			text = "img\classified_ca.paa";
			sizeEx = "0.021 / (getResolution select 5)";
			style = ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.187 * safezoneH;
		};*/
	};
};

class MRTM_settingsMenu
{
	idd = 8000;

	class controls
	{
		class MRTMBackground: IGUIBackMRTM
		{
			idc = -1;
			colorBackground[] = {0,0,0,0.9};
			x = 0.26836 * safezoneW + safezoneX;
			y = 0.2646 * safezoneH + safezoneY;
			w = 0.45375 * safezoneW;
			h = 0.517 * safezoneH;
		};
		class MRTMHeaderBackground: IGUIBackMRTM
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.235 * safezoneH + safezoneY;
			w = 0.45375 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class MRTMHeaderTextLeft: RscStructuredTextMRTM
		{
			idc = -1;
			text = "Option menu";
			colorBackground[] = {0,0,0,0};
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.235 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.033 * safezoneH;
			class Attributes
			{
				font = "PuristaMedium";
				color = "#ffffff";
				colorLink = "#D09B43";
				align = "left";
				shadow = 1;
			};
		};
		class MRTMHeaderTextRight: RscStructuredTextMRTM
		{
			idc = 8001;
			colorBackground[] = {0,0,0,0};
			x = 0.502344 * safezoneW + safezoneX;
			y = 0.235 * safezoneH + safezoneY;
			w = 0.219 * safezoneW;
			h = 0.025 * safezoneH;
			class Attributes
			{
				font = "PuristaMedium";
				color = "#ffffff";
				colorLink = "#D09B43";
				align = "left";
				shadow = 1;
			};
		};
		class MRTMdiscordImg: RscPictureMRTM
		{
			idc = -1;
			text = "img\discord_ca.paa";
			style = ST_MULTI + ST_TITLE_BAR;
			x = 0.493344 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.014244 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class MRTMMainCtrlsGroup: RscControlsGroupMRTM
		{
			deletable = 0;
			fade = 0;
			class VScrollbar: ScrollBar
			{
				color[] = {1,1,1,1};
				height = 0.5;
				width = 0.021;
				autoScrollEnabled = 1;
			};

			class HScrollbar: ScrollBar
			{
				color[] = {1,1,1,1};
				height = 0;
				width = 0;
			};

			class Controls
			{
				class MRTMViewHeaderText: RscStructuredTextMRTM
				{
					idc = -1;
					text = "View Distance:";
					colorBackground[] = {0.3,0.3,0.3,0.7};
					x = 0.327969 * safezoneW + safezoneX;
					y = 0;
					w = 0.451 * safezoneW;
					h = 0.026 * safezoneH;
					class Attributes {
						shadow = 0;
					};
				};
				class RscLine: RscTextMRTM
				{
					idc = -1;
					style = ST_MULTI + ST_TITLE_BAR + ST_HUD_BACKGROUND;
					x = 0.0842;
					y = 0.047;
					w = 1.093;
					h = 0;
					text = "";
					colorBackground[] = {0,0,0,0};
					colorText[] = {1,1,1,1};
				};
				class MRTMViewInfText: RscStructuredTextMRTM
				{
					idc = -1;
					text = "While on foot:";
					x = 0.327969 * safezoneW + safezoneX;
					y = 0.259 * safezoneH + safezoneY;
					w = 0.23 * safezoneW;
					h = 0.033 * safezoneH;
					class Attributes
					{
						align = "right";
						shadow = 0;
					};
				};
				class MRTMViewInfSlider: RscXSliderHMRTM
				{
					idc = 8003;
					text = "";
					onSliderPosChanged = "[0, _this select 1] call MRTM_fnc_onSliderChanged;";
					x = 0.562969 * safezoneW + safezoneX;
					y = 0.258 * safezoneH + safezoneY;
					w = 0.1 * safezoneW;
					h = 0.026 * safezoneH;
				};
				class MRTMViewInfEdit: RscEditMRTM
				{
					idc = 8004;
					onKeyUp = "[_this select 0, 'inf'] call MRTM_fnc_onChar;";
					x = 0.667969 * safezoneW + safezoneX;
					y = 0.258 * safezoneH + safezoneY;
					w = 0.03525 * safezoneW;
					h = 0.025 * safezoneH;
				};
				class MRTMViewGroundText: RscStructuredTextMRTM
				{
					idc = -1;
					text = "While in a ground vehicle:";
					x = 0.327969 * safezoneW + safezoneX;
					y = 0.294 * safezoneH + safezoneY;
					w = 0.23 * safezoneW;
					h = 0.033 * safezoneH;
					class Attributes
					{
						align = "right";
						shadow = 0;
					};
				};
				class MRTMViewGroundlider: RscXSliderHMRTM
				{
					idc = 8005;
					text = "";
					onSliderPosChanged = "[1, _this select 1] call MRTM_fnc_onSliderChanged;";
					x = 0.562969 * safezoneW + safezoneX;
					y = 0.293 * safezoneH + safezoneY;
					w = 0.1 * safezoneW;
					h = 0.026 * safezoneH;
				};
				class MRTMViewVehiclesEdit: RscEditMRTM
				{
					idc = 8006;
					onKeyUp = "[_this select 0, 'ground'] call MRTM_fnc_onChar;";
					x = 0.667969 * safezoneW + safezoneX;
					y = 0.293 * safezoneH + safezoneY;
					w = 0.03525 * safezoneW;
					h = 0.025 * safezoneH;
				};
				class MRTMViewAirText: RscStructuredTextMRTM
				{
					idc = -1;
					text = "While in an aircraft:";
					x = 0.327969 * safezoneW + safezoneX;
					y = 0.329 * safezoneH + safezoneY;
					w = 0.23 * safezoneW;
					h = 0.033 * safezoneH;
					class Attributes
					{
						align = "right";
						shadow = 0;
					};
				};
				class MRTMViewAirSlider: RscXSliderHMRTM
				{
					idc = 8007;
					text = "";
					onSliderPosChanged = "[2, _this select 1] call MRTM_fnc_onSliderChanged;";
					x = 0.562969 * safezoneW + safezoneX;
					y = 0.328 * safezoneH + safezoneY;
					w = 0.1 * safezoneW;
					h = 0.026 * safezoneH;
				};
				class MRTMViewAirEdit: RscEditMRTM
				{
					idc = 8008;
					onKeyUp = "[_this select 0, 'air'] call MRTM_fnc_onChar;";
					x = 0.667969 * safezoneW + safezoneX;
					y = 0.328 * safezoneH + safezoneY;
					w = 0.03525 * safezoneW;
					h = 0.025 * safezoneH;
				};
				class MRTMViewDronesText: RscStructuredTextMRTM
				{
					idc = -1;
					text = "While operating a UAV/UGV:";
					x = 0.327969 * safezoneW + safezoneX;
					y = 0.364 * safezoneH + safezoneY;
					w = 0.23 * safezoneW;
					h = 0.033 * safezoneH;
					class Attributes
					{
						align = "right";
						shadow = 0;
					};
				};
				class MRTMViewDronesSlider: RscXSliderHMRTM
				{
					idc = 8009;
					text = "";
					onSliderPosChanged = "[4, _this select 1] call MRTM_fnc_onSliderChanged;";
					x = 0.562969 * safezoneW + safezoneX;
					y = 0.363 * safezoneH + safezoneY;
					w = 0.1 * safezoneW;
					h = 0.026 * safezoneH;
				};
				class MRTMViewDronesEdit: RscEditMRTM
				{
					idc = 8010;
					onKeyUp = "[_this select 0, 'drones'] call MRTM_fnc_onChar;";
					x = 0.667969 * safezoneW + safezoneX;
					y = 0.363 * safezoneH + safezoneY;
					w = 0.03525 * safezoneW;
					h = 0.025 * safezoneH;
				};
				class MRTMObjectsButtonText: RscStructuredTextMRTM
				{
					idc = 8011;
					text = "Sync object rendering with view distance:";
					x = 0.327969 * safezoneW + safezoneX;
					y = 0.399 * safezoneH + safezoneY;
					w = 0.23 * safezoneW;
					h = 0.033 * safezoneH;
					class Attributes
					{
						align = "right";
						shadow = 0;
					};
				};
				class MRTMObjectsButton: RscCheckboxMRTM
				{
					idc = 8013;
					action = "profileNamespace setVariable ['MRTM_syncObjects', !(profileNamespace getVariable 'MRTM_syncObjects')]; 0 spawn MRTM_fnc_openMenu;";
					x = 0.560969 * safezoneW + safezoneX;
					y = 0.398 * safezoneH + safezoneY;
					w = 0.0204688 * safezoneW;
					h = 0.028 * safezoneH;
				};
				class MRTMViewObjectsText: RscStructuredTextMRTM
				{
					idc = -1;
					text = "Objects rendering distance:";
					x = 0.327969 * safezoneW + safezoneX;
					y = 0.434 * safezoneH + safezoneY;
					w = 0.23 * safezoneW;
					h = 0.033 * safezoneH;
					class Attributes
					{
						align = "right";
						shadow = 0;
					};
				};
				class MRTMViewObjectsSlider: RscXSliderHMRTM
				{
					idc = 8012;
					text = "";
					onSliderPosChanged = "[3, _this select 1] call MRTM_fnc_onSliderChanged;";
					x = 0.562969 * safezoneW + safezoneX;
					y = 0.433 * safezoneH + safezoneY;
					w = 0.1 * safezoneW;
					h = 0.026 * safezoneH;
				};
				class MRTMViewObjectsEdit: RscEditMRTM
				{
					idc = 8014;
					onKeyUp = "[_this select 0, 'objects'] call MRTM_fnc_onChar;";
					x = 0.667969 * safezoneW + safezoneX;
					y = 0.433 * safezoneH + safezoneY;
					w = 0.03525 * safezoneW;
					h = 0.025 * safezoneH;
				};
				class MRTMRWRHeaderText: RscStructuredTextMRTM
				{
					idc = -1;
					text = "Radar Warning Reciever:";
					colorBackground[] = {0.3,0.3,0.3,0.7};
					x = 0.327969 * safezoneW + safezoneX;
					y = 0.44;
					w = 0.451 * safezoneW;
					h = 0.026 * safezoneH;
					class Attributes {
						shadow = 0;
					};
				};
				class RscLine2: RscTextMRTM
				{
					idc = -1;
					style = ST_MULTI + ST_TITLE_BAR + ST_HUD_BACKGROUND;
					x = 0.0842;
					y = 0.488;
					w = 1.093;
					h = 0;
					text = "";
					colorBackground[] = {0,0,0,0};
					colorText[] = {1,1,1,1};
				};
				class MRTMRWRSettingText: RscStructuredTextMRTM
				{
					idc = -1;
					text = "Enable the voice warning system on aircraft:";
					x = 0.327969 * safezoneW + safezoneX;
					y = 0.499 * safezoneH + safezoneY;
					w = 0.23 * safezoneW;
					h = 0.033 * safezoneH;
					class Attributes
					{
						align = "right";
						shadow = 0;
					};
				};
				class MRTMRWRButton: RscCheckboxMRTM
				{
					idc = 8023;
					action = "profileNamespace setVariable ['MRTM_EnableRWR', !(profileNamespace getVariable ['MRTM_EnableRWR', true])];";
					x = 0.560969 * safezoneW + safezoneX;
					y = 0.498 * safezoneH + safezoneY;
					w = 0.0204688 * safezoneW;
					h = 0.028 * safezoneH;
				};
				class MRTMRWRText1: RscStructuredTextMRTM
				{
					idc = -1;
					text = "Pull up volume:";
					x = 0.327969 * safezoneW + safezoneX;
					y = 0.534 * safezoneH + safezoneY;
					w = 0.23 * safezoneW;
					h = 0.033 * safezoneH;
					class Attributes
					{
						align = "right";
						shadow = 0;
					};
				};
				class MRTMRWRPullUpSlider: RscXSliderHMRTM
				{
					idc = 8015;
					text = "";
					onSliderPosChanged = "[5, _this select 1] call MRTM_fnc_onSliderChanged;";
					x = 0.562969 * safezoneW + safezoneX;
					y = 0.533 * safezoneH + safezoneY;
					w = 0.1 * safezoneW;
					h = 0.026 * safezoneH;
				};
				class MRTMRWREdit1: RscEditMRTM
				{
					idc = 8016;
					onKeyUp = "[_this select 0, 'RWR1'] call MRTM_fnc_onChar;";
					x = 0.667969 * safezoneW + safezoneX;
					y = 0.533 * safezoneH + safezoneY;
					w = 0.03525 * safezoneW;
					h = 0.025 * safezoneH;
				};
				class MRTMRWRText2: RscStructuredTextMRTM
				{
					idc = -1;
					text = "Altitude volume:";
					x = 0.327969 * safezoneW + safezoneX;
					y = 0.569 * safezoneH + safezoneY;
					w = 0.23 * safezoneW;
					h = 0.033 * safezoneH;
					class Attributes
					{
						align = "right";
						shadow = 0;
					};
				};
				class MRTMRWRAltSlider: RscXSliderHMRTM
				{
					idc = 8017;
					text = "";
					onSliderPosChanged = "[6, _this select 1] call MRTM_fnc_onSliderChanged;";
					x = 0.562969 * safezoneW + safezoneX;
					y = 0.568 * safezoneH + safezoneY;
					w = 0.1 * safezoneW;
					h = 0.026 * safezoneH;
				};
				class MRTMRWREdit2: RscEditMRTM
				{
					idc = 8018;
					onKeyUp = "[_this select 0, 'RWR2'] call MRTM_fnc_onChar;";
					x = 0.667969 * safezoneW + safezoneX;
					y = 0.568 * safezoneH + safezoneY;
					w = 0.03525 * safezoneW;
					h = 0.025 * safezoneH;
				};
				class MRTMRWRText3: RscStructuredTextMRTM
				{
					idc = -1;
					text = "Warning volume:";
					x = 0.327969 * safezoneW + safezoneX;
					y = 0.604 * safezoneH + safezoneY;
					w = 0.23 * safezoneW;
					h = 0.033 * safezoneH;
					class Attributes
					{
						align = "right";
						shadow = 0;
					};
				};
				class MRTMRWRWarningSlider: RscXSliderHMRTM
				{
					idc = 8019;
					text = "";
					onSliderPosChanged = "[7, _this select 1] call MRTM_fnc_onSliderChanged;";
					toolTip = "This option is disabled";
					onLoad =  "(_this # 0) ctrlEnable false;";
					x = 0.562969 * safezoneW + safezoneX;
					y = 0.603 * safezoneH + safezoneY;
					w = 0.1 * safezoneW;
					h = 0.026 * safezoneH;
				};
				class MRTMRWREdit3: RscEditMRTM
				{
					idc = 8020;
					onKeyUp = "[_this select 0, 'RWR3'] call MRTM_fnc_onChar;";
					onLoad =  "(_this # 0) ctrlEnable false;";
					x = 0.667969 * safezoneW + safezoneX;
					y = 0.603 * safezoneH + safezoneY;
					w = 0.03525 * safezoneW;
					h = 0.025 * safezoneH;
				};
				class MRTMRWRText4: RscStructuredTextMRTM
				{
					idc = -1;
					text = "Other:";
					x = 0.327969 * safezoneW + safezoneX;
					y = 0.639 * safezoneH + safezoneY;
					w = 0.23 * safezoneW;
					h = 0.033 * safezoneH;
					class Attributes
					{
						align = "right";
						shadow = 0;
					};
				};
				class MRTMRWROtherSlider: RscXSliderHMRTM
				{
					idc = 8021;
					text = "";
					onSliderPosChanged = "[8, _this select 1] call MRTM_fnc_onSliderChanged;";
					x = 0.562969 * safezoneW + safezoneX;
					y = 0.638 * safezoneH + safezoneY;
					w = 0.1 * safezoneW;
					h = 0.026 * safezoneH;
				};
				class MRTMRWREdit4: RscEditMRTM
				{
					idc = 8022;
					onKeyUp = "[_this select 0, 'RWR4'] call MRTM_fnc_onChar;";
					x = 0.667969 * safezoneW + safezoneX;
					y = 0.638 * safezoneH + safezoneY;
					w = 0.03525 * safezoneW;
					h = 0.025 * safezoneH;
				};
				class MRTMGeneralSettingsHeaderText: RscStructuredTextMRTM
				{
					idc = -1;
					text = "General Settings:";
					colorBackground[] = {0.3,0.3,0.3,0.7};
					x = 0.327969 * safezoneW + safezoneX;
					y = 0.805;
					w = 0.451 * safezoneW;
					h = 0.026 * safezoneH;
					class Attributes {
						shadow = 0;
					};
				};
				class RscLine3: RscTextMRTM
				{
					idc = -1;
					style = ST_MULTI + ST_TITLE_BAR + ST_HUD_BACKGROUND;
					x = 0.0842;
					y = 0.854;
					w = 1.093;
					h = 0;
					text = "";
					colorBackground[] = {0,0,0,0};
					colorText[] = {1,1,1,1};
				};
				class MRTMOtherText1: RscStructuredTextMRTM
				{
					idc = -1;
					text = "Disable 3rd person view (x2 CP):";
					x = 0.327969 * safezoneW + safezoneX;
					y = 0.702 * safezoneH + safezoneY;
					w = 0.23 * safezoneW;
					h = 0.033 * safezoneH;
					class Attributes
					{
						align = "right";
						shadow = 0;
					};
				};
				class MRTMOtherText2: RscStructuredTextMRTM
				{
					idc = -1;
					text = "Mute the warlords voice informer:";
					x = 0.327969 * safezoneW + safezoneX;
					y = 0.735 * safezoneH + safezoneY;
					w = 0.23 * safezoneW;
					h = 0.033 * safezoneH;
					class Attributes
					{
						align = "right";
						shadow = 0;
					};
				};
				class MRTMOtherText3: RscStructuredTextMRTM
				{
					idc = -1;
					text = "Play sound for kill reward:";
					x = 0.327969 * safezoneW + safezoneX;
					y = 0.77 * safezoneH + safezoneY;
					w = 0.23 * safezoneW;
					h = 0.033 * safezoneH;
					class Attributes
					{
						align = "right";
						shadow = 0;
					};
				};
				class MRTMOtherText4: RscStructuredTextMRTM
				{
					idc = -1;
					text = "Autonomous mode off by default:";
					x = 0.327969 * safezoneW + safezoneX;
					y = 0.803 * safezoneH + safezoneY;
					w = 0.23 * safezoneW;
					h = 0.033 * safezoneH;
					class Attributes
					{
						align = "right";
						shadow = 0;
					};
				};
				class MRTMOtherText5: RscStructuredTextMRTM
				{
					idc = -1;
					text = "Small announcer font:";
					x = 0.327969 * safezoneW + safezoneX;
					y = 0.838 * safezoneH + safezoneY;
					w = 0.23 * safezoneW;
					h = 0.033 * safezoneH;
					class Attributes
					{
						align = "right";
						shadow = 0;
					};
				};
				class MRTMOtherText6: RscStructuredTextMRTM
				{
					idc = -1;
					text = "Spawn vehicles with empty inventory:";
					x = 0.327969 * safezoneW + safezoneX;
					y = 0.873 * safezoneH + safezoneY;
					w = 0.23 * safezoneW;
					h = 0.033 * safezoneH;
					class Attributes
					{
						align = "right";
						shadow = 0;
					};
				};
				class MRTMOtherText7: RscStructuredTextMRTM
				{
					idc = -1;
					text = "Disable missile cameras:";
					x = 0.327969 * safezoneW + safezoneX;
					y = 0.908 * safezoneH + safezoneY;
					w = 0.23 * safezoneW;
					h = 0.033 * safezoneH;
					class Attributes
					{
						align = "right";
						shadow = 0;
					};
				};
				class MRTMOtherText8: RscStructuredTextMRTM
				{
					idc = -1;
					text = "Show user-defined markers:";
					x = 0.327969 * safezoneW + safezoneX;
					y = 0.943 * safezoneH + safezoneY;
					w = 0.23 * safezoneW;
					h = 0.033 * safezoneH;
					class Attributes
					{
						align = "right";
						shadow = 0;
					};
				};
				class MRTMOtherButton1: RscCheckboxMRTM
				{
					idc = 8024;
					action = "player setVariable ['MRTM_3rdPersonDisabled', !(profileNamespace getVariable ['MRTM_3rdPersonDisabled', false]), [2, clientOwner]]; profileNamespace setVariable ['MRTM_3rdPersonDisabled', !(profileNamespace getVariable ['MRTM_3rdPersonDisabled', false])];";
					x = 0.560969 * safezoneW + safezoneX;
					y = 0.701 * safezoneH + safezoneY;
					w = 0.0204688 * safezoneW;
					h = 0.028 * safezoneH;
				};
				class MRTMOtherButton2: RscCheckboxMRTM
				{
					idc = 8025;
					action = "profileNamespace setVariable ['MRTM_muteVoiceInformer', !(profileNamespace getVariable ['MRTM_muteVoiceInformer', false])];";
					x = 0.560969 * safezoneW + safezoneX;
					y = 0.734 * safezoneH + safezoneY;
					w = 0.0204688 * safezoneW;
					h = 0.028 * safezoneH;
				};
				class MRTMOtherButton3: RscCheckboxMRTM
				{
					idc = 8026;
					action = "profileNamespace setVariable ['MRTM_playKillSound', !(profileNamespace getVariable ['MRTM_playKillSound', true])];";
					x = 0.560969 * safezoneW + safezoneX;
					y = 0.769 * safezoneH + safezoneY;
					w = 0.0204688 * safezoneW;
					h = 0.028 * safezoneH;
				};
				class MRTMOtherButton4: RscCheckboxMRTM
				{
					idc = 8027;
					action = "profileNamespace setVariable ['MRTM_enableAuto', !(profileNamespace getVariable ['MRTM_enableAuto', true])]";
					x = 0.560969 * safezoneW + safezoneX;
					y = 0.802 * safezoneH + safezoneY;
					w = 0.0204688 * safezoneW;
					h = 0.028 * safezoneH;
				};
				class MRTMOtherButton5: RscCheckboxMRTM
				{
					idc = 8028;
					action = "profileNamespace setVariable ['MRTM_smallAnnouncerText', !(profileNamespace getVariable ['MRTM_smallAnnouncerText', false])];";
					x = 0.560969 * safezoneW + safezoneX;
					y = 0.837 * safezoneH + safezoneY;
					w = 0.0204688 * safezoneW;
					h = 0.028 * safezoneH;
				};
				class MRTMOtherButton6: RscCheckboxMRTM
				{
					idc = 8029;
					action = "profileNamespace setVariable ['MRTM_spawnEmpty', !(profileNamespace getVariable ['MRTM_spawnEmpty', false])];";
					x = 0.560969 * safezoneW + safezoneX;
					y = 0.872 * safezoneH + safezoneY;
					w = 0.0204688 * safezoneW;
					h = 0.028 * safezoneH;
				};
				class MRTMOtherButton7: RscCheckboxMRTM
				{
					idc = 8030;
					action = "profileNamespace setVariable ['MRTM_disableMissileCameras', !(profileNamespace getVariable ['MRTM_disableMissileCameras', false])];";
					x = 0.560969 * safezoneW + safezoneX;
					y = 0.907 * safezoneH + safezoneY;
					w = 0.0204688 * safezoneW;
					h = 0.028 * safezoneH;
				};
				class MRTMOtherButton8: RscCheckboxMRTM
				{
					idc = 8031;
					action = "profileNamespace setVariable ['MRTM_showMarkers', !(profileNamespace getVariable ['MRTM_showMarkers', true])];";
					x = 0.560969 * safezoneW + safezoneX;
					y = 0.942 * safezoneH + safezoneY;
					w = 0.0204688 * safezoneW;
					h = 0.028 * safezoneH;
				};
			};

			type = CT_CONTROLS_GROUP;
			idc = 8999;
			x = 0.2355 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.486 * safezoneW;
			h = 0.5 * safezoneH;
			style = ST_MULTI;
		};
		class MRTMCloseButton: RscButtonMRTM
		{
			idc = 1604;
			text = "CLOSE";
			sizeEx = "0.021 / (getResolution select 5)";
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			font = "PuristaMedium";
			action =  "(findDisplay 8000) closeDisplay 1;";
		};		
		class MRTMGroupsButton: RscButtonMRTM
		{
			idc = 1605;
			text = "SQUADS";
			sizeEx = "0.021 / (getResolution select 5)";
			x = 0.327969 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			font = "PuristaMedium";
			action =  "(findDisplay 8000) closeDisplay 1; [true] call SQD_fnc_menu;";
		};
		class MRTMDebugButton: RscButtonMRTM
		{
			idc = 1609;
			text = "Debug";
			onLoad = "(_this # 0) ctrlEnable (getPlayerUID player == '76561198034106257');";
			sizeEx = "0.021 / (getResolution select 5)";
			x = 0.664969 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			font = "PuristaMedium";
			action =  "(findDisplay 8000) closeDisplay 1; 0 spawn MRTM_fnc_openDebugMenu;";
		};
		class MRTMReportButton: RscButtonMRTM
		{
			idc = 1609;
			text = "REPORT";
			sizeEx = "0.021 / (getResolution select 5)";
			x = 0.6 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			font = "PuristaMedium";
			action =  "(findDisplay 8000) closeDisplay 1; 0 spawn Fxr_fnc_openReportMenu;";
		};
	};
};

class MRTM_groupsMenu
{
	idd = 4000;

	class controls
	{
		class MRTMGroupsBackground: IGUIBackMRTM
		{
			idc = 4001;
			colorBackground[] = {0,0,0,0.75};
			x = 0.26836 * safezoneW + safezoneX;
			y = 0.2646 * safezoneH + safezoneY;
			w = 0.45375 * safezoneW;
			h = 0.517 * safezoneH;
		};
		class MRTMGroupsHeaderBackground: IGUIBackMRTM
		{
			idc = 4002;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.235 * safezoneH + safezoneY;
			w = 0.45375 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class MRTMGroupsHeaderTextLeft: RscStructuredTextMRTM
		{
			idc = 4003;
			text = "Group menu";
			colorBackground[] = {0,0,0,0};
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.235 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.033 * safezoneH;
			class Attributes
			{
				font = "PuristaMedium";
				color = "#ffffff";
				colorLink = "#D09B43";
				align = "left";
				shadow = 1;
			};
		};
		class MRTMGroupsInfoText: RscStructuredTextMRTM
		{
			idc = 4004;
			text = "Welcome to the group system! Invite your friends to join your group here.";
			colorBackground[] = {0,0,0,0};
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.2646 * safezoneH + safezoneY;
			w = 0.214687 * safezoneW;
			h = 0.073 * safezoneH;
			class Attributes
			{
				font = "PuristaMedium";
				color = "#ffffff";
				colorLink = "#D09B43";
				align = "left";
				shadow = 1;
				size = 0.88;
			};
		};
		class MRTMPlayersText: RscStructuredTextMRTM
		{
			idc = 4007;
			text = "All players:";
			colorBackground[] = {0,0,0,0};
			x = 0.487969 * safezoneW + safezoneX;
			y = 0.2646 * safezoneH + safezoneY;
			w = 0.223981 * safezoneW;
			h = 0.033 * safezoneH;
			class Attributes
			{
				font = "PuristaMedium";
				color = "#ffffff";
				colorLink = "#D09B43";
				align = "left";
				shadow = 1;
				size = 0.88;
			};
		};
		class MRTMRefreshButton: RscCheckboxMRTM
		{
			idc = 4008;
			action = "false spawn MRTM_fnc_openGroupMenu;";
			x = 0.698969 * safezoneW + safezoneX;
			y = 0.27 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
			textureUnChecked = "a3\missions_f_exp\data\img\lobby\ui_campaign_lobby_icon_player_connecting_ca.paa";
			textureChecked = "a3\missions_f_exp\data\img\lobby\ui_campaign_lobby_icon_player_connecting_ca.paa";
			textureFocusedChecked = "a3\missions_f_exp\data\img\lobby\ui_campaign_lobby_icon_player_connecting_ca.paa";
			textureFocusedUnchecked = "a3\missions_f_exp\data\img\lobby\ui_campaign_lobby_icon_player_connecting_ca.paa";
			textureHoverChecked = "a3\missions_f_exp\data\img\lobby\ui_campaign_lobby_icon_player_connecting_ca.paa";
			textureHoverUnchecked = "a3\missions_f_exp\data\img\lobby\ui_campaign_lobby_icon_player_connecting_ca.paa";
			texturePressedChecked = "a3\missions_f_exp\data\img\lobby\ui_campaign_lobby_icon_player_connecting_ca.paa";
			texturePressedUnchecked = "a3\missions_f_exp\data\img\lobby\ui_campaign_lobby_icon_player_connecting_ca.paa";
			textureDisabledChecked = "a3\missions_f_exp\data\img\lobby\ui_campaign_lobby_icon_player_connecting_ca.paa";
			textureDisabledUnchecked = "a3\missions_f_exp\data\img\lobby\ui_campaign_lobby_icon_player_connecting_ca.paa";
		};
		class MRTMGroupsGroupList: RscListboxMRTM
		{
			idc = 4005;
			deletable = 0;
			canDrag = 0;
			color[] = {1,0,0,1};
			type = CT_LISTBOX;
			x = 0.2695 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.214687 * safezoneW;
			h = 0.426 * safezoneH;
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
		class MRTMGroupsPlayersList: RscListboxMRTM
		{
			idc = 4006;
			deletable = 0;
			canDrag = 0;
			color[] = {0,1,0,1};
			type = CT_LISTBOX;
			x = 0.487969 * safezoneW + safezoneX;
			y = 0.30 * safezoneH + safezoneY;
			w = 0.223981 * safezoneW;
			h = 0.466 * safezoneH;
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
		class MRTMGroupsCloseButton: RscButtonMRTM
		{
			idc = 4100;
			text = "CLOSE";
			sizeEx = "0.021 / (getResolution select 5)";
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			font = "PuristaMedium";
			action = "(findDisplay 4000) closeDisplay 1; 0 spawn MRTM_fnc_openMenu;";
		};
		class MRTMGroupsInviteButton: RscButtonMRTM
		{
			idc = 4101;
			text = "INVITE";
			sizeEx = "0.021 / (getResolution select 5)";
			onLoad = "(_this # 0) ctrlEnable false;";
			action = "['Invite'] spawn MRTM_fnc_onButtonClick;";
			x = 0.652969 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			font = "PuristaMedium";
		};
		class MRTMGroupsDeclineButton: RscButtonMRTM
		{
			idc = 4102;
			text = "DECLINE";
			sizeEx = "0.021 / (getResolution select 5)";
			onLoad = "(_this # 0) ctrlShow false;";
			action = "['Decline'] spawn MRTM_fnc_onButtonClick;";
			x = 0.487969 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			font = "PuristaMedium";
		};
		class MRTMGroupsLeaveButton: RscButtonMRTM
		{
			idc = 4103;
			text = "LEAVE";
			sizeEx = "0.021 / (getResolution select 5)";
			onLoad = "(_this # 0) ctrlShow false;";
			action = "['Leave'] spawn MRTM_fnc_onButtonClick;";
			x = 0.427969 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			font = "PuristaMedium";
		};
		class MRTMGroupsPromoteButton: RscButtonMRTM
		{
			idc = 4104;
			text = "PROMOTE";
			sizeEx = "0.021 / (getResolution select 5)";
			onLoad = "(_this # 0) ctrlShow false;";
			action = "['Promote'] spawn MRTM_fnc_onButtonClick;";
			x = 0.327969 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			font = "PuristaMedium";
		};
		class MRTMGroupsAcceptButton: RscButtonMRTM
		{
			idc = 4105;
			text = "ACCEPT";
			sizeEx = "0.021 / (getResolution select 5)";
			onLoad = "(_this # 0) ctrlShow false;";
			action = "['Accept'] spawn MRTM_fnc_onButtonClick;";
			x = 0.550969 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			font = "PuristaMedium";
		};
		class MRTMGroupsKickButton: RscButtonMRTM
		{
			idc = 4106;
			text = "KICK";
			sizeEx = "0.021 / (getResolution select 5)";
			onLoad = "(_this # 0) ctrlShow false;";
			action = "['Kick'] spawn MRTM_fnc_onButtonClick;";
			x = 0.427969 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			font = "PuristaMedium";
		};
	};
};

class MRTM_debugMenu
{
	idd = 2000;

	class controls
	{
		class MRTMBackground: IGUIBackMRTM
		{
			idc = -1;
			colorBackground[] = {0,0,0,0.9};
			x = 0.26836 * safezoneW + safezoneX;
			y = 0.2646 * safezoneH + safezoneY;
			w = 0.45375 * safezoneW;
			h = 0.517 * safezoneH;
		};
		class MRTMHeaderBackground: IGUIBackMRTM
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.235 * safezoneH + safezoneY;
			w = 0.45375 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class MRTMHeaderTextLeft: RscStructuredTextMRTM
		{
			idc = -1;
			text = "Debug console";
			colorBackground[] = {0,0,0,0};
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.235 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.033 * safezoneH;
			class Attributes
			{
				font = "PuristaMedium";
			};
		};
		class MRTMCloseButton: RscButtonMRTM
		{
			idc = 2001;
			text = "CLOSE";
			sizeEx = "0.021 / (getResolution select 5)";
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			font = "PuristaMedium";
			action =  "(findDisplay 2000) closeDisplay 1; 0 spawn MRTM_fnc_openMenu;";
		};
		class MRTMExec: RscStructuredTextMRTM
		{
			idc = -1;
			text = "Execute";
			colorBackground[] = {0,0,0,0};
			x = 0.268969 * safezoneW + safezoneX;
			y = 0.2646 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.033 * safezoneH;
			class Attributes
			{
				font = "PuristaMedium";
			};
		};
		class MRTMExecEdit: RscEditMRTM
		{
			idc = 2002;
			font = "PuristaMedium";
			colorBackground[] = {0,0,0,0};
			autocomplete = "scripting";
			type = CT_EDIT;
			style = ST_MULTI;
			canModify = 1;
			x = 0.268969 * safezoneW + safezoneX;
			y = 0.2876 * safezoneH + safezoneY;
			w = 0.274687 * safezoneW;
			h = 0.15 * safezoneH;
		};
		class MRTMReturn: RscStructuredTextMRTM
		{
			idc = -1;
			text = "Return value";
			colorBackground[] = {0,0,0,0};
			x = 0.268969 * safezoneW + safezoneX;
			y = 0.4416 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.033 * safezoneH;
			class Attributes
			{
				font = "PuristaMedium";
			};
		};
		class MRTMReturnReadOnly: RscEditMRTM
		{
			idc = 2003;
			font = "PuristaMedium";
			canModify = 0;
			colorBackground[] = {0,0,0,0};
			autocomplete = "";
			type = CT_EDIT;
			style = ST_MULTI;
			x = 0.268969 * safezoneW + safezoneX;
			y = 0.4646 * safezoneH + safezoneY;
			w = 0.274687 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class MRTMServerExec: RscButtonMRTM
		{
			idc = -1;
			text = "Server Exec";
			sizeEx = "0.021 / (getResolution select 5)";
			colorBackground[] = {1,0,0,1};
			x = 0.268969 * safezoneW + safezoneX;
			y = 0.5196 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			font = "PuristaMedium";
			action = "[player, (ctrlText 2002)] remoteExec ['MRTM_fnc_execCode', 2];";
		};
		class MRTMLocalExec: RscButtonMRTM
		{
			idc = -1;
			text = "Local Exec";
			sizeEx = "0.021 / (getResolution select 5)";
			colorBackground[] = {0,1,0,1};
			x = 0.485969 * safezoneW + safezoneX;
			y = 0.5196 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			font = "PuristaMedium";
			action = "[player, (ctrlText 2002)] spawn MRTM_fnc_execCode;";
		};
	};
};
class Fxr_ReportDialog
{
	idd = 73000;//Idd & idc's should be replaced, temporary only until proper range is assigned.

	class Controls
	{
		class MRTMReportBackground: IGUIBackMRTM
		{
			idc = 73001;
			colorBackground[] = {0,0,0,0.75};
			x = 0.38836 * safezoneW + safezoneX;
			y = 0.2646 * safezoneH + safezoneY;
			w = 0.20375 * safezoneW;
			h = 0.517 * safezoneH;
		};
		class MRTMReportHeaderBackground: IGUIBackMRTM
		{
			idc = 73002;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.38836 * safezoneW + safezoneX;
			y = 0.235 * safezoneH + safezoneY;
			w = 0.20375 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class MRTMReportHeaderTextLeft: RscStructuredTextMRTM
		{
			idc = 73003;
			text = "Report menu";
			colorBackground[] = {0,0,0,0};
			x = 0.38836 * safezoneW + safezoneX;
			y = 0.235 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.033 * safezoneH;
			class Attributes
			{
				font = "PuristaMedium";
				color = "#ffffff";
				colorLink = "#D09B43";
				align = "left";
				shadow = 1;
			};
		};
		class MRTMReportList: RscListBoxMRTM
		{
			idc = 73004;
			deletable = 0;
			canDrag = 0;
			color[] = {0,1,0,1};
			type = CT_LISTBOX;
			x = 0.38836 * safezoneW + safezoneX;
			y = 0.265 * safezoneH + safezoneY;
			w = 0.203981 * safezoneW;
			h = 0.496 * safezoneH;
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
		class MRTMReportCloseButton: RscButtonMRTM
		{
			idc = 73005;
			text = "CLOSE";
			sizeEx = "0.021 / (getResolution select 5)";
			x = 0.38836 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			font = "PuristaMedium";
			action = "0 spawn Fxr_fnc_closeReportMenu;0 spawn MRTM_fnc_openMenu;";
		};
	};
};