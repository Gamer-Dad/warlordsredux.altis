class SquadsMenu
{
	idd = 5000;

	class controls
	{
		class SquadsBackground: IGUIBackMRTM
		{
			idc = 5001;
			colorBackground[] = {0, 0, 0, 0.9};
			x = 0.26836 * safezoneW + safezoneX;
			y = 0.2646 * safezoneH + safezoneY;
			w = 0.45375 * safezoneW;
			h = 0.517 * safezoneH;
		};
		class SquadsHeaderBackground: IGUIBackMRTM
		{
			idc = 5002;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.235 * safezoneH + safezoneY;
			w = 0.45375 * safezoneW;
			h = 0.025 * safezoneH;
		};
		class SquadsHeaderTextLeft: RscStructuredTextMRTM
		{
			idc = 5003;
			text = $STR_SQUADS_squadMenuText;
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
		class SquadsInfoText: RscStructuredTextMRTM
		{
			idc = 5004;
			text = $STR_SQUADS_welcomeText;
			colorBackground[] = {0, 0, 0, 0};
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.2706 * safezoneH + safezoneY;
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
        class SquadsSquadList: RscTreeWL
		{
			idc = 5005;
			deletable = 0;
			canDrag = 0;
			color[] = {1, 0, 0, 1};
			colorBackground[] = {0, 0, 0, 0.9};
			type = CT_TREE;
			x = 0.275 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.209187 * safezoneW;
			h = 0.427 * safezoneH;
			autoScrollSpeed = -1;
			autoScrollDelay = 5;
			autoScrollRewind = 0;
			class ListScrollBar {
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
			};
			style = LB_TEXTURES;
		};
		class SquadsPlayersList: RscListboxMRTM
		{
			idc = 5006;
			deletable = 0;
			canDrag = 0;
			color[] = {0, 1, 0, 1};
			colorBackground[] = {0, 0, 0, 0.9};
			colorSelect[] = {1, 1, 1, 0.3};
			colorSelectBackground[] = {0, 0, 0, 0};
			type = CT_LISTBOX;
			x = 0.487969 * safezoneW + safezoneX;
			y = 0.310 * safezoneH + safezoneY;
			w = 0.223981 * safezoneW;
			h = 0.457 * safezoneH;
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
		class SquadsPlayersText: RscStructuredTextMRTM
		{
			idc = 5007;
			text = $STR_SQUADS_squadInviteMenuText;
			colorBackground[] = {0, 0, 0, 0};
			x = 0.487969 * safezoneW + safezoneX;
			y = 0.2706 * safezoneH + safezoneY;
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
		class SquadsRefreshButton: RscCheckboxMRTM
		{
			idc = 5008;
			action = "SQD_MENU_REFRESH = true;";
			colorBackgroundHover[] = {1, 1, 1, 0.3};
			x = 0.69 * safezoneW + safezoneX;
			y = 0.237 * safezoneH + safezoneY;
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
			tooltip = $STR_SQUADS_refreshSquads;
		};
		class SquadsCloseButton: RscCheckboxMRTM
		{
			idc = 5009;
			sizeEx = "0.021 / (getResolution select 5)";
			x = 0.708 * safezoneW + safezoneX;
			y = 0.237 * safezoneH + safezoneY;
			w = 0.013 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackgroundHover[] = {1, 1, 1, 0.3};
			font = "PuristaMedium";
			action = "(findDisplay 5000) closeDisplay 1;";
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
		class SquadsLeaveButton: RscButtonMRTM
		{
			idc = 5012;
			text = $STR_SQUADS_buttonsLeave;
			sizeEx = "0.021 / (getResolution select 5)";
			colorBackground[] = {0, 0, 0, 0.9};
			action = "['leave'] spawn SQD_fnc_client;";
			x = 0.33 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.03 * safezoneH;
			font = "PuristaMedium";
		};
		class SquadsPromoteButton: RscButtonMRTM
		{
			idc = 5013;
			text = $STR_SQUADS_buttonsPromote;
			sizeEx = "0.021 / (getResolution select 5)";
			colorBackground[] = {0, 0, 0, 0.9};
			onLoad = "(_this # 0) ctrlShow false;";
			action = "['promote'] spawn SQD_fnc_client;";
			x = 0.39 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.03 * safezoneH;
			font = "PuristaMedium";
		};
		class SquadsKickButton: RscButtonMRTM
		{
			idc = 5015;
			text = $STR_SQUADS_buttonsKick;
			sizeEx = "0.021 / (getResolution select 5)";
			colorBackground[] = {0, 0, 0, 0.9};
			onLoad = "(_this # 0) ctrlShow false;";
			action = "['kick'] spawn SQD_fnc_client;";
			x = 0.45 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.03 * safezoneH;
			font = "PuristaMedium";
		};
		class SquadsRenameButton: RscButtonMRTM
		{
			idc = 5011;
			text = $STR_SQUADS_buttonsRename;
			sizeEx = "0.021 / (getResolution select 5)";
			colorBackground[] = {0, 0, 0, 0.9};
			onLoad = "";
			action = "['rename'] spawn SQD_fnc_client;";
			x = 0.51 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.03 * safezoneH;
			font = "PuristaMedium";
		};
		class SquadsCreateButton: RscButtonMRTM
		{
			idc = 5014;
			text = $STR_SQUADS_buttonsCreate;
			sizeEx = "0.021 / (getResolution select 5)";
			colorBackground[] = {0, 0, 0, 0.9};
			action = "['create'] spawn SQD_fnc_client;";
			x = 0.27 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.03 * safezoneH;
			font = "PuristaMedium";
		};
		class SquadsInviteButton: RscButtonMRTM
		{
			idc = 5010;
			text = $STR_SQUADS_buttonsInvite;
			sizeEx = "0.021 / (getResolution select 5)";
			colorBackground[] = {0, 0, 0, 0.9};
			onLoad = "(_this # 0) ctrlEnable false;";
			tooltip = "Select a player to invite.";
			action = "['invite'] spawn SQD_fnc_client;";
			x = 0.662 * safezoneW + safezoneX;
			y = 0.272 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.03 * safezoneH;
			font = "PuristaMedium";
		};
	};
};


class SquadsMenu_Rename
{
	idd = 5100;

	class controls
	{
		class SquadsRenameBackground: IGUIBackMRTM
		{
			idc = 5101;
			colorBackground[] = {0.1, 0.1, 0.1, 0.9};
			x = 0.41 * safezoneW + safezoneX;
			y = 0.45 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 0.12 * safezoneH;
			class Attributes
			{
				font = "PuristaMedium";
				color = "#ffffff";
				colorLink = "#D09B43";
				align = "center";
				shadow = 1;
				size = 0.88;
			};
		};
		class SquadsHeaderTextLeft: RscStructuredTextMRTM
		{
			idc = 5102;
			text = $STR_SQUADS_newSquadName;
			colorBackground[] = {0.2, 0.2, 0.2, 0.9};
			colorText[] = {1, 1, 1, 1};
			x = 0.41 * safezoneW + safezoneX;
			y = 0.45 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 0.03 * safezoneH;
			class Attributes
			{
				align = "center";
				shadow = 1;
				size = 1.2;
			};
		};
		class SquadsRenameEditBox: RscEditMRTM
		{
			idc = 5103;
			x = 0.42 * safezoneW + safezoneX;
			y = 0.495 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.025 * safezoneH;
			font = "PuristaMedium";
			sizeEx = 0.04;
			tooltip = $STR_SQUADS_enterNewSquadName;
			maxChars = 25;
		};
		class SquadsRenameOkButton: RscButtonMRTM
		{
			idc = 5104;
			text = $STR_SQUADS_buttonsSave;
			sizeEx = 0.04;
			action = "['renamed'] spawn SQD_fnc_client;";
			x = 0.42 * safezoneW + safezoneX;
			y = 0.53 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.03 * safezoneH;
			font = "PuristaMedium";
			tooltip = $STR_SQUADS_saveNewSquadName;
		};
	};
};
