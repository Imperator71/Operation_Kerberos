/*
	Author: Dorbedo

	Description:
	Creates a vehicle Patrol

	Parameter(s):
		0 :	ARRAY	- can be
		1 : NUMBER 	- maybe
		

	Returns:
	Something (eventually)
	
*/
#include "script_component.hpp"
SCRIPT(patrol_veh);
private ["_gruppe","_units","_rand"];
params["_position",["_radius",1200,[0]],["_anzahl_leicht",0,[0]],["_anzahl_schwer",0,[0]]];

_vehicles=[];
_rand=[];
_einheit="";
for "_i" from 0 to (_anzahl_leicht) do {
	_rad = ((random 500) + 500);
	_pos = [_position, _radius,0] call EFUNC(common,random_pos);
	
	_rand = (floor(random 8));
	if (_rand < 2) then {
		_einheit = dorb_veh_aa SELRND;
	}else{
		_einheit = dorb_veh_unarmored SELRND;
	};
	sleep 3;
	
	
	_spawnpos = _pos findEmptyPosition [1,100,_einheit];

	if (count _spawnpos < 1) then {
		ERROR(FORMAT_1("Keine Spawnposition | %1",_spawnpos));
	}else{
		LOG_3(_spawnpos,_einheit,dorb_side);
		_return = [_spawnpos,(random(360)),_einheit,dorb_side] call BIS_fnc_spawnVehicle;
		_vehicles pushBack (_return select 0);
		[(_return select 2), (getPos (_return select 0)), _rad, 7, "MOVE", "AWARE", "RED", "NORMAL", "STAG COLUMN", "", [5,10,15]] call CBA_fnc_taskPatrol;
		
	};
};

for "_i" from 0 to (_anzahl_schwer) do {
	_rad = ((random 500) + 500);
	_pos = [_position, _radius,0] call EFUNC(common,random_pos);
	
	_rand = (floor(random 8));
	if (_rand<2) then {
		_einheit = dorb_veh_aa SELRND;
	}else{
		_einheit = dorb_veh_armored SELRND;
	};
	_spawnpos = _pos findEmptyPosition [1,100,_einheit];
	if (count _spawnpos < 1) then {
		ERROR(FORMAT_1("Keine Spawnposition | %1",_spawnpos));
	}else{
		LOG_3(_spawnpos,_einheit,dorb_side);
		_return = [_spawnpos,(random(360)),_einheit,dorb_side] call BIS_fnc_spawnVehicle;
		_vehicles pushBack (_return select 0);
		[(_return select 2), (getPos (_return select 0)), _rad, 7, "MOVE", "AWARE", "RED", "NORMAL", "STAG COLUMN", "", [5,10,15]] call CBA_fnc_taskPatrol;
		
	};
};

LOG(FORMAT_1("Spawned Vehicles \n %1",_vehicles));

if (dorb_debug) then {
	{
		_mrkr = createMarker [format["veh-%1",_x],getPos _x];
		_mrkr setMarkerShape "ICON";
		_mrkr setMarkerColor "ColorRed";
		_mrkr setMarkerType "o_mech_inf";
		
	}forEach _vehicles;
};