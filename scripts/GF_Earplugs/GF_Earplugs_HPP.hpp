//________________	Author : GEORGE FLOROS [GR]	___________	29.03.19	___________


/*
________________	GF Earplugs Script - Mod	________________
https://forums.bohemia.net/forums/topic/215844-gf-earplugs-script-mod/
*/

class Rsc_GF_Earplugs { 
idd = -1; 
duration = 1000000000;
fadein = 0;
fadeout = 0;
	class controls { 
		class Rsc_GF_Earplugs_Control { 
			idc = -1; 
			type = 0; 
			style = ST_PICTURE;
			tileH = 1;
			tileW = 1;
			x = 0.93 * safezoneW + safezoneX;
			y = 0.17  * safezoneH + safezoneY;
			w = 0.05 * safezoneW;	
			h = 0.05 * safezoneH;
			font = "EtelkaNarrowMediumPro"; 
			sizeEx = 1; 
			colorBackground[] = {0,0,0,0}; 
			colorText[] = {1,1,1,1};
			text = "scripts\GF_Earplugs\images\Earmuffs_3.paa"; 
			lineSpacing = 0; 
		}; 
	}; 
};