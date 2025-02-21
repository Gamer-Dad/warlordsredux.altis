params ["_team"];

switch (_team) do {
    case WEST: {
        "$"
    };
    case EAST: {
        "¥"
    };
    case INDEPENDENT: {
        "$"
    };
    default {
        "$"
    };
};