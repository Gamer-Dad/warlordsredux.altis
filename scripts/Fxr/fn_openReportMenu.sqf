/*
	Author: Fixer

	Description: Opens the Report menu.
*/

if (isNull (findDisplay 73000)) then {	
	_display = createDialog "Fxr_ReportDialog";
	_playerList = ((findDisplay 73000) displayCtrl 73004);
	disableSerialization;	
	private _players = allPlayers - entities "HeadlessClient_F"; 
	{
		_playerList lbAdd name _x;
	} forEach _players;	

	waituntil {!isNull ((findDisplay 73000) displayCtrl 73004) };
	((findDisplay 73000) displayCtrl 73004) ctrlAddEventHandler ["LBSelChanged", {

		_playerList = ((findDisplay 73000) displayCtrl 73004);
		_name = _playerList lbText (lbCurSel _playerList);
		localNamespace setVariable ["_REPORT_NAME", _name];
		private _ChatEHId = missionNamespace getVariable "ChatEHId";

			if (isNil "_ChatEHId") then {
				_ChatEHId = addMissionEventHandler ["HandleChatMessage", {
					params ["_channel", "_owner", "_from", "_text", "_person", "_name", "_strID", "_forcedDisplay", "_isPlayerMessage", "_sentenceType", "_chatMessageType"];
					//private _passedname = _thisArgs select 0;
					private _passedname = localNamespace getVariable "_REPORT_NAME";

					if(_channel == 16 || _channel == 17) then {
						private _regexMatches = _text regexMatch "[\s]?.*[\d]+[\s]+([\w]{32,32})[\s]{1,1}(.*)$";
						private _hasName = [_passedname, _text] call BIS_fnc_inString;
						if(_regexMatches and _hasName) then {
							private _r = _text regexFind ["([\w]{32})[\s]{1}(.*)$",10];
							if(count _r > 0) then {
								private _beId   = _r select 0 select 1 select 0;
								private _UKTime = systemTimeUTC;
								diag_log _lsText;
								private _lsText = format["Name[%1] beId[%2] at %3 UTC", _passedname, _beId, _UKTime];
								systemChat _lsText;
								_editCtrl = ((findDisplay 73000) displayCtrl 73006);
								if (isNull _editCtrl) then {
									w = (0.20375 * safezoneW)+(pixelW * pixelGrid*30);
									h = 0.025 * safezoneH;
									x = (0.38836 * safezoneW + safezoneX)-(pixelW * pixelGrid*15);
									y = (0.235 * safezoneH + safezoneY) - h;
									_editCtrl = (findDisplay 73000) ctrlCreate ["RscEditReadOnly",73006];
									_editCtrl ctrlSetPosition [x,y,w,h]; 							
								};
								_editCtrl ctrlSetText _lsText;
								_editCtrl ctrlSetBackgroundColor [1, 1, 1, 0.8];
								_editCtrl ctrlSetTextColor		 [.9, 0, 0.0353, 1];
								_editCtrl ctrlCommit 0;
							};
						};
					};
					false; // /let message results show up in chat
				}, 
				[]//[_name]
				];
				missionNamespace setVariable ["ChatEHId", _ChatEHId];
			}; // /_ChatEHId
		diag_log "serverCommand #beclient players";
		serverCommand "#beclient players";
	}];	// /LBSelChanged

};