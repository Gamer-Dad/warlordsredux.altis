


//________________	Author : GEORGE FLOROS [GR]	___________	29.03.19	___________


/*
________________	GF Earplugs Script - Mod	________________

https://forums.bohemia.net/forums/topic/215844-gf-earplugs-script-mod/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

ArmA 3 | Notepad ++ SQF tutorial
https://www.youtube.com/watch?v=aI5P7gp3x90

and also use the extra pluggins
(this way will be better , it will give also some certain colors to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/

BI Forum Ravage Club Owner :
https://forums.bohemia.net/clubs/73-bi-forum-ravage-club/
*/


/*
COPY this in the desrcription.ext :

//__________________________ ***  C O P Y   T H I S  *** __________________________
class RscTitles
{
	#include "GF_Earplugs\GF_Earplugs_HPP.hpp"		
};
//__________________________ ***  C O P Y   E N D  *** __________________________

*/


//	https://community.bistudio.com/wiki/Dialog_Control


// Control types
#define CT_STATIC 0

// Static styles

#define ST_LEFT           0x00

#define ST_LEFT		0
#define ST_RIGHT	1
#define ST_CENTER	2
#define ST_UP		3
#define ST_DOWN		4
#define ST_VCENTER	5

#define ST_SINGLE	0
#define ST_MULTI	16
#define ST_PICTURE	48
#define ST_FRAME	64

#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE 144
#define ST_WITH_RECT 160
#define ST_LINE	176

#define ST_SHADOW	256
#define ST_NO_RECT	512

#define FontM "Bitstream"
#define ST_LEFT      0
#define ST_RIGHT     1
#define ST_CENTER    2
#define CT_STATIC    0


//	https://community.bistudio.com/wiki/Dialog_Control

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
	
			//	Axis
			x = 0.93 * safezoneW + safezoneX;	//	horizontal
			y = 0.17  * safezoneH + safezoneY;	//	vertical
			
			//	Size
			w = 0.05 * safezoneW;	
			h = 0.05 * safezoneH;
	
			font = "EtelkaNarrowMediumPro"; 
			sizeEx = 1; 
			colorBackground[] = {0,0,0,0}; 
			colorText[] = {1,1,1,1};
			
			//	Image
			text = "GF_Earplugs\images\Earmuffs_3.paa"; 
			lineSpacing = 0; 
		}; 
	}; 
};