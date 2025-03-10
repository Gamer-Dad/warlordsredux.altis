#include "east_optics_short.hpp"

class OpticDMS: WLCAttachment {
    name = "DMS";
    attachments[] = {
        "optic_DMS"
    };
};

class OpticKahlia: WLCAttachment {
    name = "Kahlia";
    attachments[] = {
        "optic_KHS_blk"
    };
};

class OpticERCO: WLCAttachment {
    name = "ERCO";
    attachments[] = {
        "optic_ERCO_khk_F"
    };
};