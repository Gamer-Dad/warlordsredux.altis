#define CT_STATIC       0
#define ST_PICTURE        0x30

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

#define dce_X			0.062
#define dce_Y			0
#define dce_H			1
#define dce_W			1
#define dce_BUTTON_H		0.069 * dce_H
#define dce_BUTTON_W		0.1044 * dce_W
#define dce_SPACE		0.005 * dce_W
#define dce_COL			(dce_X + dce_SPACE)
#define dce_ROW			(dce_Y + dce_SPACE)
#define dce_COLINC		(dce_BUTTON_W + dce_SPACE)
#define dce_ROWINC		(dce_BUTTON_H + dce_SPACE)
#define dce_TEXTSIZE		0.03
#define dce_TEXTSIZEMED 0.025
#define dce_TEXTSIZESMALL 0.015
#define dce_TEXTSIZEVSMALL 0.01
#define dce_font		"PuristaMedium"
#define dce_BUTTONCOLOUR0 "#(argb,8,8,3)color(1,1,1,0)"
#define dce_BUTTONCOLOUR "#(argb,8,8,3)color(1,1,1,1)"
#define dce_BUTTONCOLOUR2 "#(argb,8,8,3)color(0,0,0,1)"
#define dce_BUTTONCOLOUR3 "#(argb,8,8,3)color(0.3,0.3,0.3,1)"
#define dce_BUTTONCOLOUR4 "#(argb,8,8,3)color(0,0.2,0,0.5)"
#define dce_BUTTONCOLOUR5 "#(argb,8,8,3)color(0.105,0.105,0.105,0.5)"
#define dce_BUTTONCOLOUR6 "#(argb,8,8,3)color(0,0.5,0,1)"
#define dce_BUTTONCOLOUR7 "#(argb,8,8,3)color(0,0,0,0)"
// Nothing (for overwriting)
#define dce_COLOUR0 {0,0,0,0}
// White
#define dce_COLOUR1 {1,1,1,1}
// Black
#define dce_COLOUR2 {0,0,0,1}
#define dce_COLOUR3 {1,1,1,0.7}
// Grey
#define dce_COLOUR4 {0.2,0.2,0.2,1}
// Camo green
#define dce_COLOUR5 {0,0.2,0,1}
// Sickly green
#define dce_COLOUR6 {0,0.5,0,1}
// Dark grey
#define dce_COLOUR7 {0.5,0.5,0.5,1}
// Orange
#define dce_COLOUR8 {0.73,0.24,0.11,1}
#define dce_align "center"
#define dce_shadow "true"
// List defines
#define dce_colorSelect {1, 1, 1, 1}
#define dce_colorText {1,1,1,1}
#define dce_colorBackground {0.28,0.28,0.28,0.28}
#define dce_colorSelect2 {0, 0, 0, 1}
#define dce_colorSelectBackground {0.95, 0.95, 0.95, 1}
#define dce_colorSelectBackground2 {1, 1, 1, 0.5}
#define dce_colorScrollbar {0.2, 0.2, 0.2, 1}
#define dce_style 2 + 12
#define dce_tabFx (dce_COL + (dce_COLINC * 1.48))
#define dce_tabFy dce_ROW + (dce_ROWINC * 13)
//#define dce_tabFy dce_ROW + (dce_ROWINC * 12.5)
#define dce_tabFw (dce_BUTTON_W * 0.32)
#define dce_tabFh (dce_BUTTON_H * 0.8)
#define dce_tabFspace (dce_BUTTON_W * 0.093)
#define dce_tabFinc (dce_tabFw + dce_tabFspace)
#define dce_tabY 0.46
// How close the tablet is to the viewer
#define dce_tabZ 0.2

class dce_tablet {
	idc = 30111;
	type = 82;
	model = "\A3\Props_F_Exp_A\Military\Equipment\Tablet_02_F.p3d";
	//scale = 0.9; //original, good for normal UI scale
	scale = 0.8;
	direction[] = {0, -1, 0};
	up[] = {0, 1, -1};
	x = 0.5;
	y = dce_tabY;
	z = dce_tabZ;
	xBack = 0.5;
	yBack = 0.5;
	zBack = 1.2;
	inBack = 0;
	enableZoom = 1;
	zoomDuration = 0.001;
};

class dce_tablet2: dce_tablet {
	idc = 9100;
	scale = 1.0;
	model = "\A3\Structures_F_Heli\Items\Electronics\Tablet_01_F.p3d";
	//model = "\A3\Structures_F\Items\Electronics\MobilePhone_smart_F.p3d";
};

class dce_BackGround
{
	idc = -1;
	type = 0;
	style = 96;
	x = dce_x;
	y = dce_y;
	w = dce_W;
	h = dce_H;
	font = dce_font;
	sizeEx = dce_TEXTSIZE;
	colorBackground[] = {0,0,0,1}; // Black background
	colorText[] = {0.5,0.5,0.5,1}; // Grey foreground
	text = "";
	lineSpacing = 1;
};


class dce_RscPicture
{
    access = 0;
    idc = -1;
    type = CT_STATIC;
    style = ST_PICTURE;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
	font = dce_font;
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    shadow = 0;
    x = 0;
    y = 0;
	w = 0.06 * dce_W;
	h = 0.08 * dce_H;
};

class dce_RscText {
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	type = 0;
	style = dce_style;
	shadow = 1;
	colorShadow[] = {0,0,0,0.5};
	font = dce_font;
	SizeEx = dce_TEXTSIZE;
	text = "";
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
	linespacing = 1;
	align = "center";
	valign = "middle";
};

class dce_StructuredText {
	idc = -1; 
	type = 13;
	style = dce_style;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
	x = 0.5; 
	y = 0.5; 
	w = 0.5; 
	h = 0.5; 
	size = dce_TEXTSIZE;
	text = "";
	font = dce_font;
	class Attributes {
		font = dce_font;
		color = "#ffffff";
		align = "left";
		valign = "middle";
		shadow = false;
		shadowColor = "#ff0000";
		size = "1";
  };
};

class dce_RscEdit
{
	access = 0;
	type = 2;
	style = "0x00";
	x = 0;
	y = 0;
	h = 0.04;
	w = 0.2;
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	colorSelection[] = {1,1,1,0.25};
	font = dce_font;
	SizeEx = dce_TEXTSIZE;
	autocomplete = "";
	text = "";
	size = dce_TEXTSIZE;
	shadow = 0;
	canModify = 1;
};
	
class dce_RscTitle : dce_RscText {
	style = 0;
	SizeEx = dce_TEXTSIZE;
	colorText[] = {0.95, 0.95, 0.95, 1};
};

class dce_RscButtonMenu {
	idc = -1;
	type = 16;
	style = dce_style;
	default = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = dce_BUTTON_W;
	h = dce_BUTTON_H;
	animTextureNormal = dce_BUTTONCOLOUR3;
	animTextureDisabled = dce_BUTTONCOLOUR3;
	animTextureOver = dce_BUTTONCOLOUR3; //
	animTextureFocused = dce_BUTTONCOLOUR0;
	animTexturePressed = dce_BUTTONCOLOUR0; //
	animTextureDefault = dce_BUTTONCOLOUR3;
	textureNoShortcut = dce_BUTTONCOLOUR3;
	colorBackground[] = dce_COLOUR1;
	colorBackground2[] = {1,1,1,0.3};
	colorBackgroundFocused[] = dce_COLOUR1;
	// Text colour selected
	color[] = dce_COLOUR7;
	// Text colour other
	color2[] = dce_COLOUR7;
	colorText[] = dce_COLOUR7;
	colorFocused[] = dce_COLOUR7;
	colorDisabled[] = dce_COLOUR7;
	period = 1;
	periodFocus = 111;
	periodOver = 111;
	Size = dce_TEXTSIZE;
	SizeEx = dce_TEXTSIZE;
	soundEnter[] = {"",0.09,1};
	soundPush[] = {"",0.0,0};
	soundClick[] = {"",0.07,1};
	soundEscape[] = {"",0.09,1};
	action = "";
	text = "";
	font = dce_font;
	class HitZone {
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
	};
	class ShortcutPos {
		left = 0;
		top = 0;
		w = 0;
		h = 0;
	};
	class TextPos {
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
	};
	class Attributes {
		font = dce_font;
		color = "#696969";
		align = "center";
		valign = "middle";
		shadow = "false";
	};
	class AttributesImage {
		color = "#696969";
		align = "left";
		valign = "middle";
	};
};

class dce_RscButtonHidden : dce_RscButtonMenu {
	animTextureNormal = "#(argb,8,8,3)color(0,0,0,0)";
	animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0)";
	animTextureOver = "#(argb,8,8,3)color(0,0,0,0)";
	animTextureFocused = "#(argb,8,8,3)color(0,0,0,0)";
	animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
	animTextureDefault = "#(argb,8,8,3)color(0,0,0,0)";
	textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";	
};

class dce_RscButtonTabFNC : dce_RscButtonHidden {
	idc = -1;
	text = "";
	tooltip = "";
	onButtonClick = "";
	x = dce_tabFx;
	y = dce_tabFy;
	w = dce_tabFw;
	h = dce_tabFh;
};

class dce_RscButtonMenuText : dce_RscButtonMenu{
};

class dce_RscListBox
{
	style = 16;
	idc = -1;
	type = 5;
	w = 0.275;
	h = 0.04;
	font = dce_font;
	// Text colour when selected
	colorSelect[] = dce_COLOUR1;
	// Colour the text will fade to when selected
	colorSelect2[] = dce_COLOUR1;
	// Basic text colour when NOT selected
	colorText[] = dce_COLOUR1;
	// Basic background colour
	//colorBackground[] = dce_COLOUR0;
	colorBackground[] = dce_COLOUR4;
	// Background colour behind the text when selected
	colorSelectBackground[] = dce_COLOUR7;
	// This is the colour that colorSelectBackground will fade to
	colorSelectBackground2[] = dce_COLOUR7;
	colorScrollbar[] = {0.2,0.2,0.2,1};
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	wholeHeight = 0.45;
	rowHeight = 0.04;
	color[] = dce_COLOUR1;
	colorActive[] = dce_COLOUR1;
	colorDisabled[] = {0,0,0,0.3};
	SizeEx = dce_TEXTSIZE;
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	pictureColor[] = dce_COLOUR1;
	// What it fades to
	pictureColorSelect[] = dce_COLOUR1;
	pictureColorDisabled[] = dce_COLOUR1;
	class ListScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
};

class dce_ActiveText : dce_RscText {
	idc = -1;
	type = 11;
	style = dce_style;
	color[] = dce_COLOUR1;
	colorActive[] = dce_COLOUR1;
	colorDisabled[] = {1,1,1,0.3};
	colorText[] = dce_COLOUR1;
	colorBackground[] = dce_COLOUR2;
	soundEnter[] = {"",0,1};
	soundPush[] = {"",0,1};
	soundClick[] = {"", 0,1};
	soundEscape[] = {"",0,1 };
	action = "";
	text = "";
	default = false;
};

class dce_ButtonExitTablet : dce_RscButtonHidden {
	idc = -1;
	text = "";
	tooltip = "Exit";
	onButtonClick = "closeDialog 0";
	x = dce_COL + (dce_COLINC * 5.5);
	//y = dce_ROW + (dce_ROWINC * 12.5);
	y = dce_tabFy;
	w = dce_BUTTON_W;
	h = dce_BUTTON_H;
};