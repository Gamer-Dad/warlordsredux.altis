class WLCAmmo {};
class WLCAttachment {};
class CfgWLCCustomization {
    class WEST {
        #include "west\customization\west_primary.hpp"
        #include "west\customization\west_secondary.hpp"
        #include "west\customization\west_launcher.hpp"
        #include "west\customization\west_uniform.hpp"
        #include "west\customization\west_vest.hpp"
        #include "west\customization\west_helmet.hpp"
    };

    class EAST {
        #include "east\customization\east_primary.hpp"
        #include "east\customization\east_secondary.hpp"
        #include "east\customization\east_launcher.hpp"
        #include "east\customization\east_uniform.hpp"
        #include "east\customization\east_vest.hpp"
        #include "east\customization\east_helmet.hpp"
    };
};