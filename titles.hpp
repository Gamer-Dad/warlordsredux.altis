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
				h = 0.3 * 4 / 3;
				text = "";
				colorBackground[] = { 0, 0, 0, 0.7 };
				shadow=1;
			};
			class RscWLAPSDisplayText: RscPicture {
				idc = 7007;
				x = 1 - safeZoneX - 0.32;
				y = 0;
				w = 0.3;
				h = 0.3 * 4 / 3;
				text = "\a3\ui_f\data\IGUI\Cfg\Radar\danger_ca.paa";
				style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
				shadow = 1;
				colorText[] = {1, 0, 0, 1};
				size = 0.032;
			};
			class RscWLAPSDisplayRadar: RscPicture {
				idc = 7008;
				x = 1 - safeZoneX - 0.32;
				y = 0;
				w = 0.3;
				h = 0.3 * 4 / 3;
				text = "\a3\ui_f\data\IGUI\Cfg\Radar\radar_ca.paa";
				style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
				shadow = 1;
				size = 0.032;
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
};