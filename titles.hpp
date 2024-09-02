import RscStructuredText;

class RscTitles
{
	#include "scripts\GF_Earplugs\GF_Earplugs_HPP.hpp"

	class RscJammingIndicator {
		idd = -1;
		movingEnable = 0;
		duration = 1e+011;
		name = "RscJammingIndicator";
		onLoad = "uiNamespace setVariable ['RscJammingIndicator', _this select 0];";
		class controls {
			class RscJammingIndicatorText {
				idc = 7001;
				type = CT_STATIC;
				style = ST_CENTER;
				x = 1;
				y = 0;
				w = 0.35;
				h = 0.1;
				sizeEx = 0.04;
				colorBackground[] = {0, 0, 0, 0};
				colorText[] = {1, 1, 1, 1};
				font = "PuristaMedium";
				text = "";
			};
		};
	};

	class RscWLVoteDisplay {
		idd = -1;
		movingEnable = 0;
		duration = 1e+011;
		name = "RscWLVoteDisplay";
		onLoad = "uiNamespace setVariable ['RscWLVoteDisplay', _this select 0];";
		class controls {
			class Background: RscText {
				idc = 7003;
				style = 128;
				x = 1 - safeZoneX - 0.3;
				y = 0;
				w = 0.28;
				h = 0.3;
				text = "";
				colorBackground[] = { 0, 0, 0, 0.7 };
				shadow=1;
			};
			class RscWLVoteDisplayText: RscStructuredText {
				idc = 7002;
				x = 1 - safeZoneX - 0.3;
				y = 0.015;
				w = 0.28;
				h = 0.3;
				text = "";
				style = ST_MULTI;
				shadow = 1;
				size = 0.032;
				class Attributes {
					font = "RobotoCondensed";
					color = "#ffffff";
					align = "center";
				};
			};
		};
	};

	class RscWLCaptureDisplay {
		idd = -1;
		movingEnable = 0;
		duration = 1e+011;
		name = "RscWLCaptureDisplay";
		onLoad = "uiNamespace setVariable ['RscWLCaptureDisplay', _this select 0];";
		class controls {
			class Background: RscText {
				idc = 7004;
				style = 128;
				x = 1 - safeZoneX - 0.3;
				y = 0.3;
				w = 0.28;
				h = 0.35;
				text = "";
				colorBackground[] = { 0, 0, 0, 0.7 };
				shadow=1;
			};
			class RscWLCaptureDisplayText: RscStructuredText {
				idc = 7005;
				x = 1 - safeZoneX - 0.3;
				y = 0.315;
				w = 0.28;
				h = 0.35;
				text = "";
				style = ST_MULTI;
				shadow = 1;
				size = 0.032;
				class Attributes {
					font = "RobotoCondensed";
					color = "#ffffff";
					align = "center";
				};
			};
		};
	};

	class RscWLAPSDisplay {
		idd = -1;
		movingEnable = 0;
		duration = 1e+011;
		name = "RscWLAPSDisplay";
		onLoad = "uiNamespace setVariable ['RscWLAPSDisplay', _this select 0];";
		class controls {
			class Background: RscText {
				idc = 7006;
				style = 128;
				x = 1 - safeZoneX - 0.32;
				y = 0;
				w = 0.3;
				h = 0.3 * 4 / 3 + 0.1;
				text = "";
				colorBackground[] = { 0, 0, 0, 0.7 };
				shadow=1;
			};
			class RscWLAPSDisplayIndicator: RscPicture {
				idc = 7007;
				x = 1 - safeZoneX - 0.3;
				y = 0.02;
				w = 0.26;
				h = 0.26 * 4 / 3;
				text = "\a3\ui_f\data\IGUI\Cfg\Radar\danger_ca.paa";
				style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
				shadow = 1;
				colorText[] = {1, 0, 0, 1};
				size = 0.032;
			};
			class RscWLAPSDisplayRadar: RscPicture {
				idc = 7008;
				x = 1 - safeZoneX - 0.3;
				y = 0.02;
				w = 0.26;
				h = 0.26 * 4 / 3;
				text = "\a3\ui_f\data\IGUI\Cfg\Radar\radar_ca.paa";
				style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
				shadow = 1;
				size = 0.032;
			};
			class RscWLAPSDisplayText: RscText {
				idc = 7100;
				x = 1 - safeZoneX - 0.32;
				y = 0.3 * 4 / 3;
				w = 0.3;
				h = 0.1;
				text = "";
				style = ST_CENTER;
				shadow = 1;
				size = 0.032;
				class Attributes {
					font = "RobotoCondensed";
					color = "#ffffff";
					align = "center";
				};
			};
		};
	};

	class RscWLMineDisplay {
		idd = -1;
		movingEnable = 0;
		duration = 1e+011;
		name = "RscWLMineDisplay";
		onLoad = "uiNamespace setVariable ['RscWLMineDisplay', _this select 0];";
		class controls {
			class Background: RscText {
				idc = 7009;
				style = 128;
				x = 1 - safeZoneX - 0.3125;
				y = 0.45;
				w = 0.30;
				h = 0.5;
				text = "";
				colorBackground[] = { 0, 0, 0, 0.7 };
				shadow=1;
			};
			class RscWLMineDisplayText: RscStructuredText {
				idc = 7010;
				x = 1 - safeZoneX - 0.3125;
				y = 0.465;
				w = 0.30;
				h = 0.5;
				text = "";
				style = ST_MULTI;
				shadow = 1;
				size = 0.032;
				class Attributes {
					font = "RobotoCondensed";
					color = "#ffffff";
					align = "center";
				};
			};
		};
	};

	class RscWLVoiceDisplay {
		idd = -1;
		movingEnable = 0;
		duration = 1e+011;
		name = "RscWLVoiceDisplay";
		onLoad = "uiNamespace setVariable ['RscWLVoiceDisplay', _this select 0];";
		class controls {
			class Background: RscText {
				idc = 7200;
				style = 128;
				x="(profilenamespace getvariable [""IGUI_GRID_CHAT_X"",	(safezoneX + 1 * (((safezoneW / safezoneH) min 1.2) / 40))])";
				y="(profilenamespace getvariable [""IGUI_GRID_CHAT_Y"",	(safezoneY + safezoneH - 10.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))]) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
				w="(profilenamespace getvariable [""IGUI_GRID_CHAT_W"",	(20 * (((safezoneW / safezoneH) min 1.2) / 40))])";
				h="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
				text = "";
				colorBackground[] = { 0, 0, 0, 0.8 };
				shadow=1;
			};
			class RscWLVoiceDisplayText: RscStructuredText {
				idc = 7201;
				x="(profilenamespace getvariable [""IGUI_GRID_CHAT_X"",	(safezoneX + 1 * (((safezoneW / safezoneH) min 1.2) / 40))])";
				y="(profilenamespace getvariable [""IGUI_GRID_CHAT_Y"",	(safezoneY + safezoneH - 10.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))]) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
				w="(profilenamespace getvariable [""IGUI_GRID_CHAT_W"",	(20 * (((safezoneW / safezoneH) min 1.2) / 40))])";
				h="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
				text = "";
				style = ST_MULTI;
				shadow = 1;
				size = 0.032;
				class Attributes {
					font = "RobotoCondensed";
					color = "#8fed8f";
					align = "left";
				};
			};
		};
	};

	class RscWLDeathDisplay {
		idd = -1;
		movingEnable = 0;
		duration = 1e+011;
		name = "RscWLDeathDisplay";
		onLoad = "uiNamespace setVariable ['RscWLDeathDisplay', _this select 0];";
		class controls {
			class KilledByTitle: RscStructuredText {
				idc = 7220;
				x = 0.2;
				y = safezoneY + 0.3;
				w = 0.6;
				h = 0.4;
				text = "";
				style = ST_MULTI;
				shadow = 1;
				size = 0.05;
				class Attributes {
					font = "RobotoCondensed";
					color = "#ffffff";
					align = "center";
					shadow = 1;
					shadowColor = "#000000";
					shadowOffset = -0.05;
				};
			};
			class DisplayTitle: RscStructuredText {
				idc = 7210;
				x = 0.2;
				y = safezoneY + 0.37;
				w = 0.6;
				h = 0.4;
				text = "";
				style = ST_MULTI;
				shadow = 1;
				size = 0.05;
				class Attributes {
					font = "RobotoCondensedBold";
					color = "#ff2222";
					align = "center";
					shadow = 1;
					shadowColor = "#ffffff";
					shadowOffset = -0.2;
				};
			};
			class SensorDisplayTitle: RscStructuredText {
				idc = 7221;
				x = 0.2;
				y = safezoneY + 0.45;
				w = 0.6;
				h = 0.4;
				text = "";
				style = ST_MULTI;
				shadow = 1;
				size = 0.05;
				class Attributes {
					font = "RobotoCondensed";
					color = "#ff0000";
					align = "center";
					shadow = 1;
					shadowColor = "#000000";
					shadowOffset = -0.05;
				};
			};
			class Background1: RscText {
				idc = 7211;
				style = 128;
				x = 0;
				y = safezoneY + 0.6;
				w = 0.3;
				h = 0.3 * 4 / 3;
				text = "";
				colorBackground[] = { 0, 0, 0, 0 };
				shadow=1;
			};
			class Background2: RscText {
				idc = 7212;
				style =128;
				x = 0.35;
				y = safezoneY + 0.6;
				w = 0.3;
				h = 0.3 * 4 / 3;
				text = "";
				colorBackground[] = { 0, 0, 0, 0 };
				shadow=1;
			};
			class Background3: RscText {
				idc = 7213;
				style = 128;
				x = 0.7;
				y = safezoneY + 0.6;
				w = 0.3;
				h = 0.3 * 4 / 3;
				text = "";
				colorBackground[] = { 0, 0, 0, 0 };
				shadow=1;
			};
			class CenterDisplayIcon: RscPicture {
				idc = 7214;
				x = 0.35 + 0.03;
				y = safezoneY + 0.6 + 0.05;
				w = 0.3 - 0.03 * 2;
				h = 0.3 * 4 / 3 - 0.05;
				text = "\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa";
				style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
				colorShadow[] = { 1, 1, 1, 1 };
				shadow = 1;
				size = 0.032;
			};
			class CenterDisplayText: RscStructuredText {
				idc = 7215;
				x = 0.35 + 0.01;
				y = safezoneY + 0.6 + 0.01;
				w = 0.3 - 0.01 * 2;
				h = 0.3 * 4 / 3 - 0.01 * 2;
				text = "DEATH";
				style = ST_MULTI;
				shadow = 1;
				size = 0.05;
				class Attributes {
					font = "RobotoCondensed";
					color = "#ffffff";
					align = "center";
				};
			};
			class LeftDisplayIcon: RscPicture {
				idc = 7216;
				x = 0 + 0.05;
				y = safezoneY + 0.6 + 0.05;
				w = 0.3 - 0.05 * 2;
				h = 0.3 * 4 / 3 - 0.05;
				text = "\A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\icon_cross_ca.paa";
				style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
				shadow = 1;
				size = 0.032;
			};
			class LeftDisplayText: RscStructuredText {
				idc = 7217;
				x = 0 + 0.01;
				y = safezoneY + 0.6 + 0.01;
				w = 0.3 - 0.01 * 2;
				h = 0.3 * 4 / 3 - 0.01 * 2;
				text = "Death";
				style = ST_MULTI;
				shadow = 1;
				size = 0.05;
				class Attributes {
					font = "RobotoCondensed";
					color = "#ffffff";
					align = "center";
				};
			};
			class RightDisplayText: RscStructuredText {
				idc = 7218;
				x = 0.7 + 0.01;
				y = safezoneY + 0.6 + 0.03;
				w = 0.3 - 0.01 * 2;
				h = 0.15 * 4 / 3;
				text = "DISTANCE";
				style = ST_MULTI;
				shadow = 1;
				size = 0.05;
				class Attributes {
					font = "RobotoCondensed";
					color = "#ffffff";
					align = "center";
				};
			};
			class RightDisplayText2: RscStructuredText {
				idc = 7219;
				x = 0.7 + 0.01;
				y = safezoneY + 0.6 + 0.23;
				w = 0.3 - 0.01 * 2;
				h = 0.15 * 4 / 3;
				text = "SCORE SINCE LAST";
				style = ST_MULTI;
				shadow = 1;
				size = 0.05;
				class Attributes {
					font = "RobotoCondensed";
					color = "#ffffff";
					align = "center";
				};
			};
		};
	};
};