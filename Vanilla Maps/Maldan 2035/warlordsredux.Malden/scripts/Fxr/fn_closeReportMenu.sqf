/*
	Description: Cleans up the chat handler on the report menu.
*/

/*private _ChatEHId = localNamespace getVariable "ChatEHId";
if (!isNil "_ChatEHId") then {
    removeMissionEventHandler ["HandleChatMessage", _ChatEHId];
    localNamespace setVariable ["ChatEHId", nil];
};*/
(findDisplay 73000) closeDisplay 1;