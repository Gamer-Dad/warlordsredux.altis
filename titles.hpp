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
			class RscWLVoteDisplayText {
				idc = 7002;
				type = CT_STRUCTURED_TEXT;
				style = ST_CENTER;
				x = 1;
				y = 0.3;
				w = 0.35;
				h = 0.1;
				size = 0.025;
				colorBackground[] = {0, 0, 0, 0};
				colorText[] = {1, 1, 1, 1};
				font = "PuristaSemibold";
				text = "";
				class Attributes{
					font = "PuristaSemibold";
					color = "#ffffff";
					align = "center";
					valign = "top";
					shadow = false;
					shadowColor = "#ff0000";
					size = "1";
				};
			};
		};
	};
};