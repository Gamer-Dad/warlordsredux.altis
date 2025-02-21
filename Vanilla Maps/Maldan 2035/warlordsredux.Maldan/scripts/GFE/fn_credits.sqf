


//________________	Author : GEORGE FLOROS [GR]	___________	29.03.19	___________


/*
________________	GF Earplugs Script - Mod	________________
https://forums.bohemia.net/forums/topic/215844-gf-earplugs-script-mod/
*/

waitUntil {!(isNull (findDisplay 46))};

_subject = player createDiarySubject ["GF Earplugs Script", "GF Earplugs Script"];
_log_briefing = player createDiaryRecord ["GF Earplugs Script", 
    ["About and Credits", "
    <br /><font size='30' color='#FF0000'>GF Earplugs Script
    <br />
    <br /><font size='25' color='#FCEF06'>Author : GEORGE FLOROS [GR]
    <br />
    <br />
    <br /><font size='15' color='#FF0000'>V e r s i o n    2 . 2
    <br />
    <br /><font size='17' color='#0059B0'>GF Earplugs Script
    <br />
    <br />
    <br /><font size='15' color='#A1D2FA'>GF Earplugs Script , mute or lower sound , with a key interaction , configurable key bindings.
    <br />Use your Earplugs with Insert key 
    <br />
    <br />You are free to do anything but 
    <br />i would like to give me Credits for this!
    <br />
    <br />Simple and easy to use and adapt .
    <br />
    <br />
    <br />Thanks to All script contributors .
    <br />Thanks to everyone who tries to do the best for this game!
    <br />Thanks to Armaholic Community and Forums .
    <br />Thanks to BIS for such a great platform.
    <br />Thanks to BIS Community and BIS Community Forums
    <br />
    <br />
    <br />Available at :
    <br />Armaholic and Bohemia Interactive Forums 
    <br />
    <br />
    <br /><font size='20' color='#FF0000'>Have Fun !
    "
]];