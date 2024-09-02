private _asset = uiNamespace getVariable "WLM_asset";

private _ret = 1;

private _textureSlotList = [
    ["AFV_Wheeled_01_base_F", 2],
    ["MRAP_01_base_F", 1]
];

private _slotFind = _textureSlotList select {_asset isKindOf (_x # 0)};
if (count _slotFind > 0) then {
    _ret = _slotFind # 0 # 1;
};

_ret;