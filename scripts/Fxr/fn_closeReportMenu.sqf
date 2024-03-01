/*
	Description: Cleans up the chat handler on the report menu.
*/

private _ChatEHId = missionNamespace getVariable "ChatEHId";
if (!isNil "_ChatEHId") then {
    removeMissionEventHandler ["HandleChatMessage", _ChatEHId];
    missionNamespace setVariable ["ChatEHId", nil];
};
(findDisplay 73000) closeDisplay 1;