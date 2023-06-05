#include "..\warlords_constants.inc"

params ["_killer", "_event", ["_show", true]];

switch (_event) do {
	case "init": {
		{
			private _varName = format ["BIS_WL_showHint_%1", _x];
			
			if (isNil _varName) then {
				missionNamespace setVariable [_varName, false, clientOwner]
			};
		} forEach ["assembly", "maintenance", "targetResetVoting", "forfeitVoting"];
		
		private _hintText = "";
		private _lastHint = "";
		while {!BIS_WL_missionEnd} do {
			_hintText = "";
			
			if (BIS_WL_showHint_assembly) then {
				_hintText = _hintText + format [
					"<t size = '1.2' shadow = '0'><t align = 'left'>[ %1 ]</t><t align = 'right' color = '#4bff58'>%2</t><br/><t align = 'left'>[ %3 ]</t><t align = 'right' color = '#ff4b4b'>%4</t></t>",
					localize "STR_dik_space",
					localize "STR_A3_assemble",
					localize "STR_dik_back",
					localize "STR_ca_cancel"
				];
			};
			
			if (BIS_WL_showHint_targetResetVoting) then {
				private _varNameVoting = format ["BIS_WL_targetResetVotingSince_%1", BIS_WL_playerSide];
				private _warlords = BIS_WL_allWarlords select {side group _x == BIS_WL_playerSide};
				private _limit = ceil ((count _warlords) / 2);
				private _votedYes = count (_warlords select {(_x getVariable ["BIS_WL_targetResetVote", -1]) == 1});
				_hintText = _hintText + format [
					"%10<t shadow = '0'><t align = 'center' size = '1.3'>%1</t><br/><t size = '1.2'><t align = 'left'>[ %2 + %3 ]</t><t align = 'right' color = '#4bff58'>%4</t><br/><t align = 'left'>[ %2 + %5 ]</t><t align = 'right' color = '#ff4b4b'>%6</t></t><t size = '1'><br/><br/><t align = 'left'>%7</t><t align = 'right'>%8</t><br/><t align = 'center'>- %9 -</t></t></t>",
					toUpper localize "STR_A3_WL_target_reset_info",
					localize "str_dik_lcontrol",
					localize "str_dik_y",
					toUpper localize "str_lib_info_yes",
					localize "str_dik_n",
					toUpper localize "str_lib_info_no",
					localize "STR_A3_WL_target_reset_votes_needed",
					0 max (_limit - _votedYes),
					0 max ceil (((missionNamespace getVariable [_varNameVoting, -1]) + WL_TARGET_RESET_VOTING_TIME) - WL_SYNCED_TIME),
					if (_hintText == "") then {""} else {"<br/><br/>"}
				];
			};

			if (BIS_WL_showHint_forfeitVoting) then {
				private _varNameVoting = format ["BIS_WL_forfeitVotingSince_%1", BIS_WL_playerSide];
				private _warlords = BIS_WL_allWarlords select {side group _x == BIS_WL_playerSide};
				private _limit = ceil ((count _warlords) / 2);
				private _votedYes = count (_warlords select {(_x getVariable ["BIS_WL_forfeitVote", -1]) == 1});
				_hintText = _hintText + format [
					"%10<t shadow = '0'><t align = 'center' size = '1.3'>%1</t><br/><t size = '1.2'><t align = 'left'>[ %2 + %3 ]</t><t align = 'right' color = '#4bff58'>%4</t><br/><t align = 'left'>[ %2 + %5 ]</t><t align = 'right' color = '#ff4b4b'>%6</t></t><t size = '1'><br/><br/><t align = 'left'>%7</t><t align = 'right'>%8</t><br/><t align = 'center'>- %9 -</t></t></t>",
					toUpper "Surrender vote activated",
					localize "str_dik_lcontrol",
					localize "str_dik_y",
					toUpper localize "str_lib_info_yes",
					localize "str_dik_n",
					toUpper localize "str_lib_info_no",
					localize "STR_A3_WL_target_reset_votes_needed",
					0 max (_limit - _votedYes),
					0 max ceil (((missionNamespace getVariable [_varNameVoting, -1]) + 60) - WL_SYNCED_TIME),
					if (_hintText == "") then {""} else {"<br/><br/>"}
				];
			};

			if((_hintText != "" ) or ( _lastHint != "")) then {
				hintSilent parseText _hintText;
				_lastHint = _hintText;
			};
			sleep WL_TIMEOUT_MEDIUM;
		};
	};
	
	default {
		private _varName = format ["BIS_WL_showHint_%1", _event];
		
		if (_show isEqualType true) then {
			missionNamespace setVariable [_varName, _show];
		} else {
			[_varName, _show] spawn {
				params ["_varName", "_show"];
				while {!BIS_WL_missionEnd} do {
					missionNamespace setVariable [_varName, call _show, clientOwner];
					if (_varName == "BIS_WL_showHint_maintenance") then {
						[false] call BIS_fnc_WL2_refreshOSD;
					};
					sleep WL_TIMEOUT_STANDARD;
				};
			};
		};
	};
};