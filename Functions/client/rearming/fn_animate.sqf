params ["_asset", "_animation", "_state", "_lbCurSel", "_idc"];

_asset animate [_animation, _state, true];
lbSetData [_idc, _lbCurSel, str ([_animation, (_asset animationPhase _animation)])];