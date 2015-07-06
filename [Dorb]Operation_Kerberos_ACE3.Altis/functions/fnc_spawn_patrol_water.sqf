/*
	Author: Dorbedo

	Description:
	Spawns Water Patrols

	Parameter(s):
		0 :	ARRAY	- Spawnposition
		1 : SCALAR 	- Radius
		2 : SCALAR	- number of boats (-1 = automatic)
		3 : SCALAR	- nuber of divers (-1 = automatic)
		

	Returns:
	

	
*/
#include "script_component.hpp"

private ["_gruppe","_units","_vehicles","_rad","_pos","_spawnpos","_einheit","_return"];
PARAMS_1(_position);
DEFAULT_PARAM(1,_radius,1200);
DEFAULT_PARAM(2,_anzahl_boats,0);
DEFAULT_PARAM(3,_anzahl_diver,0);
_amountOfWater = 0;
//If  ((_anzahl_boats<0)||(_anzahl_diver<0)) then {
	_searchposarray = [_position];
	_searchrad = 1;
	_step = 50;
	_s = 0;
	while {_searchrad < _radius} do {
		_umfang = 2 * pi * _searchrad;
		_theta = ((_s*360)/(2*_searchrad*pi));
		_searchposarray pushBack ([_position, _searchrad, _theta] call BIS_fnc_relPos);
		_s=_s+_step;
		If (_s > _umfang) then {
			_searchrad = _searchrad + _step;
			_s=0;
		};
	};
	
	_amountOfWater = {
			/*
			If (surfaceIsWater _x) then {
				_mrkr = createMarker [format["infp-%1",random(999999)],_x];
				_mrkr setMarkerShape "ICON";
				_mrkr setMarkerColor "ColorBlue";
				_mrkr setMarkerType "o_inf";
			}else{
				_mrkr = createMarker [format["infp-%1",random(999999)],_x];
				_mrkr setMarkerShape "ICON";
				_mrkr setMarkerColor "ColorRed";
				_mrkr setMarkerType "o_inf";
			};
			*/
		surfaceIsWater _x
		}count _searchposarray;
//};
/// exit if there is only a small amount of water
CHECK(_amountOfWater<301)

If (_anzahl_boats < 0) then {
	_anzahl_boats = floor((_amountOfWater - 300)/100);
};
If (_anzahl_diver < 0) then {
	_anzahl_diver = floor((_amountOfWater - 300)/200);
};



_vehicles=[];

for "_i" from 0 to _anzahl_boats do {
	_rad = ((random 200) + 100);
	_spawnpos = [_position,_radius,3] call FM(random_pos);
	If (!(_spawnpos isEqualTo [])) then {
		_einheit = dorb_patrolboatlist SELRND;
		_return = [_spawnpos,(random(360)),_einheit,dorb_side] call BIS_fnc_spawnVehicle;
		_vehicles pushBack (_return select 0);
		[(_return select 2), (getPos (_return select 0)), _rad, 7, "MOVE", "AWARE", "RED", "NORMAL", "STAG COLUMN", "", [10,30,100]] call CBA_fnc_taskPatrol;
		[(_return select 2)] call FM(moveToHC);	
	};
};

for "_i" from 0 to _anzahl_diver do {
	_rad = ((random 200) + 100);
	_spawnpos = [_position,_radius,3] call FM(random_pos);
	If (!(_spawnpos isEqualTo [])) then {
		_einheiten = [];
		for "_j" from 0 to 3 do {
			_einheiten pushBack (dorb_diverlist SELRND)
		};
		_return = [_spawnpos,dorb_side,_einheiten] call BIS_fnc_spawnGroup;
		_vehicles pushBack (units _return);
		[_return, (getPos (leader _return)), _rad, 7, "MOVE", "AWARE", "RED", "NORMAL", "STAG COLUMN", "", [3,9,15]] call CBA_fnc_taskPatrol;
		{_x swimInDepth 10} forEach (units _return);
		[_return] call FM(moveToHC);
	};
};




