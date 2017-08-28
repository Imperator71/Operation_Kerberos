#include "script_component.hpp"
/**
 * Author: Dorbedo
 * adds the initPosEventhandlers
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 */

[QGVAR(HCjoined),{_this call FUNC(HCconnect);}] call CBA_fnc_addEventHandler;
addMissionEventHandler ["HandleDisconnect",{_this call FUNC(HCdisconnect);false;}];

["AllVehicles", "initPost", {
    _this spawn FUNC(onInit);
},true,[],true] call CBA_fnc_addClassEventHandler;
