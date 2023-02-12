class dapsDialog
{
	idd=10000;
	name="dapsDialog";
	movingEnable=false;
	enableSimulation=true;
	onLoad="";
	class controls
	{
		class daps_Frame: dce_RscText
		{
			//colorBackground[]={0, 0, 0, 0.7};
			colorBackground[]={0.2,0.2,0.2,.7};
			idc=-1;
			x=dce_COL+(dce_COLINC*2.5);
			y=dce_ROW+(dce_ROWINC*0);
			w=dce_BUTTON_W+(dce_COLINC*1.5);
			h=dce_BUTTON_H+(dce_ROWINC*3);
		};
		
		//class daps_TextAPSInfo : dce_StructuredText
		class daps_ActiveTextAPSInfo : dce_ActiveText
		{
			idc=10001;
			text="";
			align = "center";
			valign = "middle";
			action="execVM'scripts\DAPS\Scripts\Management\ToggleEngine.sqf'";
			x=dce_COL+(dce_COLINC*2.5);
			y=dce_ROW+(dce_ROWINC*0);
			w=dce_BUTTON_W+(dce_COLINC*3);
			h=dce_BUTTON_H;
		};
		
		class daps_TextCharges1 : dce_StructuredText
		{
			idc=10002;
			text="";
			align = "center";
			valign = "middle";
			x=dce_COL+(dce_COLINC*2.5);
			y=dce_ROW+(dce_ROWINC*2);
			w=dce_BUTTON_W+(dce_COLINC*3);
			h=dce_BUTTON_H;
		};
		
/*		class daps_TextCharges2 : dce_StructuredText
		{
			idc=10003;
			text="";
			x=dce_COL+(dce_COLINC*2.5);
			y=dce_ROW+(dce_ROWINC*3);
			w=dce_BUTTON_W+(dce_COLINC*3);
			h=dce_BUTTON_H;
		};
		
		class daps_TextCharges3 : dce_StructuredText
		{
			idc=10004;
			text="";
			x=dce_COL+(dce_COLINC*2.5);
			y=dce_ROW+(dce_ROWINC*4);
			w=dce_BUTTON_W+(dce_COLINC*3);
			h=dce_BUTTON_H;
		};*/
	};
};