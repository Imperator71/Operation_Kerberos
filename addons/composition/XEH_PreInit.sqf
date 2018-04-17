#include "script_component.hpp"

ADDON = false;

RECOMPILE_START;
#include "XEH_PREP.hpp"
RECOMPILE_END;

ADDON = true;

[QGVAR(enableAI),{
    params ["_unit", "_skilltype"];
    _unit enableAI _skilltype;
}] call CBA_fnc_addEventHandler;

GVAR(usedHouses) = [];
GVAR(spawnedCompositions) = [];
GVAR(housecache) = HASH_CREATE;

[
    QEGVAR(mission,end_server),
    {
        GVAR(usedHouses) = [];
        GVAR(spawnedCompositions) = [];
    }
] call CBA_fnc_addEventHandler;
