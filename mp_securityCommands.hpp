class CfgDisabledCommands
{
    class CREATE3DENENTITY
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{"GROUP"},{"ARRAY"}};
        };

        class SYNTAX2
        {
            targets[] = {1,0,0};
            args[] = {{},{"ARRAY"}};
        };
    };

    class CREATETRIGGER
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{},{"ARRAY"}};
        };
    };

    class SETTRIGGERSTATEMENTS
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{"OBJECT"},{"ARRAY"}};
        };
    };

    class CREATEUNIT
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{"STRING"},{"ARRAY"}};
        };

        class SYNTAX2
        {
            targets[] = {1,1,1};
            args[] = {{"GROUP"},{"ARRAY"}};
        };
    };

    class SKIPTIME
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{},{"SCALAR"}};
        };
    };

    class DRAWLINE3D
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{},{"ARRAY"}};
        };
    };

    class SETCUSTOMAIMCOEF
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{"OBJECT"},{"SCALAR"}};
        };
    };

    class PUBLICVARIABLE
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{},{"STRING"}};
        };
    };

    class PUBLICVARIABLECLIENT
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{"SCALAR"},{"STRING"}};
        };
    };

    class SETVELOCITYTRANSFORMATION
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{"OBJECT"},{"ARRAY"}};
        };
    };

    class ADDFORCE
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{"OBJECT"},{"ARRAY"}};
        };
    };

    class SETVELOCITYMODELSPACE
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{"OBJECT"},{"ARRAY"}};
        };
    };

    class SETANIMSPEEDCOEF
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{"OBJECT"},{"SCALAR"}};
        };
    };

    class ENABLEFATIGUE
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{"OBJECT"},{"BOOL"}};
        };
    };

    class SETHIT
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{"OBJECT"},{"ARRAY"}};
        };
    };

    class SETHITINDEX
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{"OBJECT"},{"ARRAY"}};
        };
    };

    class SETHITPOINTDAMAGE
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{"OBJECT"},{"ARRAY"}};
        };
    };

    class SETDAMMAGE
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{"OBJECT"},{"SCALAR"}};
        };
    };

    class SETPOSASLW
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{"OBJECT"},{"ARRAY"}};
        };
    };

    class SETPOSATL
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{"OBJECT"},{"ARRAY"}};
        };
    };
};