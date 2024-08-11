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
				h = 0.35;
				text = "";
				colorBackground[] = { 0, 0, 0, 0.7 };
				shadow=1;
			};
			class RscWLVoteDisplayText: RscStructuredText {
				idc = 7002;
				x = 1 - safeZoneX - 0.3;
				y = 0.015;
				w = 0.28;
				h = 0.35;
				text = "";
				style = ST_MULTI;
				shadow = 1;
				size = 0.032;
				class Attributes: Attributes {};
			};
		};
	};
};