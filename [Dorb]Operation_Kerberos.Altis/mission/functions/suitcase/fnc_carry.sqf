/*
	Author: Dorbedo
	
	Description:
		init function
	
*/
#include "script_component.hpp"
SCRIPT(carry);

CHECK(!hasinterface)

#define ATTACH_POINT [0,0,-0.1]
#define ANIM_TIME 1.1


params["_suitcase","_carrier"];

_carrier action ["SwitchWeapon", _carrier, _carrier, 100];

uiSleep ANIM_TIME;

_suitcase attachTo [_carrier, ATTACH_POINT, "RightHand"];
_suitcase setDir 90;
_carrier forceWalk true;

_suitcase setVariable [QGVAR(suitcase_carrier),_carrier,true];
_carrier setVariable [QGVAR(suitcase_suitcase),_suitcase];

[0, {
	params ["_suitcase"];
	[{_this call FUNC(suitcase_handle); }, 1, [_suitcase] call CBA_fnc_addPerFrameHandler;
}, [_suitcase]] FMP;