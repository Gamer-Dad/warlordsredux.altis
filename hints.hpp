class CfgHints
{
	class common
	{
		displayName = "Common Controls";

		class warlordsMenu
		{
			displayName = $STR_A3_WL_Menu_Hint_Name;
			displayNameShort = "";
			description = $STR_A3_WL_Menu_Hint;
			tip = $STR_A3_WL_Menu_Hint_01;
			arguments[] =
			{
				{{"Gear"}},
				"format [localize 'STR_A3_WL_tip_menu', (actionKeysNamesArray 'Gear') # 0]"
			};
			image = "img\wl_logo_ca.paa";
			noImage = false;
		};
		class friendlyFire
		{
			displayName = $STR_A3_WL_FF_Hint_Name;
			displayNameShort = "";
			description = $STR_A3_WL_FF_Hint;
			tip = $STR_A3_WL_FF_Hint_01;
			arguments[] =
			{
				{{"TacticalPing"}},
				"name player",
				"format ['%1', (3 - (count (player getVariable ['BIS_WL_friendlyKillTimestamps', []])))]"
			};
			image = ;
			noImage = true;
		};
	};

	class voiceWarningSystem
	{
		displayName = "Rita Controls";

		class rita
		{
			displayName = "Rita voice warning system";
			displayNameShort = "";
			description = "In your scoll wheel options you can enable the %3voice warning system: Rita.%4%1%2 It'll give you %3terrain info%4, getting to low to the terrain or diving to fast will trigger alerts.%1%2 It'll also %3warn you%4 when you are %3visible on enemy sensors.%4%1";
			tip = "";
			image = "A3\ui_f\data\gui\cfg\hints\voice_ca.paa";
			noImage = false;
		};
		class betty
		{
			displayName = "Betty voice warning system";
			displayNameShort = "";
			description = "In your scoll wheel options you can enable the %3voice warning system: Betty.%4%1%2 It'll give you %3information about new enemies%4 on your sensor or when you lose sight of an enemy.%1%2 It'll also give you %3terrain info%4, getting to low to the terrain or diving to fast will trigger alerts.%1%2 Last but not least the system also %3warns you%4 when you are %3visible on enemy sensors.%4%1";
			tip = "";
			image = "A3\ui_f\data\gui\cfg\hints\voice_ca.paa";
			noImage = false;
		};
	};
};