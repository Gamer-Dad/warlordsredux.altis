#include "optics_short.hpp"

class OpticMOS: WLCAttachment {
    name = "MOS";
    attachments[] = {
        "optic_SOS"
    };
};

class OpticAMS: WLCAttachment {
    name = "AMS";
    attachments[] = {
        "optic_AMS_snd"
    };
};

class OpticERCO: WLCAttachment {
    name = "ERCO";
    attachments[] = {
        "optic_ERCO_snd_F"
    };
};

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

class OpticTWS: WLCAttachment {
    name = "TWS";
    attachments[] = {
        "optic_tws"
    };
};

class OpticTWSMG: WLCAttachment {
    name = "TWS MG";
    attachments[] = {
        "optic_tws_mg"
    };
};