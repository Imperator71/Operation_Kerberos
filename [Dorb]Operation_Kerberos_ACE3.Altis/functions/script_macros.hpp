


/* -------------------------------------------
Macro: FM()
	Function Name
	
Parameters:
	VARIABLE - Partial name of the function

Example:
	(begin example)
		this call FM(test)
	(end)

Author:
	Dorbedo
------------------------------------------- */
#define FM(VAR) TRIPLES(PREFIX,fnc,VAR)

/* -------------------------------------------
Macro: FMP
	Spawns CBA_fnc_globalExecute

Parameters:
	none

Example:
	(begin example)
		{-1,{hint _this},["Makro Test"]} FMP;
	(end)

Author:
	Dorbedo
------------------------------------------- */
#define FMP spawn CBA_fnc_globalExecute
/* -------------------------------------------
Macro: CHECK()
	Checks Condition - Exit if true
	
	Hint: no ';' after CHECK()

Parameters:
	CODE - Condition to Check

Example:
	(begin example)
		// if is server exit
		CHECK(isServer)
	(end)

Author:
	Dorbedo
------------------------------------------- */
#define CHECK(CONDITION) if (CONDITION) exitWith {};
/* -------------------------------------------
Macro: SELRND()
	Selects a random element of an array

Parameters:
	ARRAY - array to select from

Example:
	(begin example)
		winner = ["Klaus","Dieter","Thorsten"] SELRND;
	(end)

Author:
	Dorbedo
------------------------------------------- */
#define SELRND call TRIPLES(dorb,makro,selectrandom)
/* -------------------------------------------
Macro: TILGE
	deletes:
		- Marker
		- Objects (vehicles incl Crew)
		- Groups
		- Arrays including these

Parameters:
	none

Example:
	(begin example)
		[veh1  ,  group1  ,  [ "Marker1" , "marker2" ]  ,  [ [ Veh2 ] , soldier1 ] , [ group2 ] ]     TILGE;
		[soldier3,soldier4] TILGE;
		"marker3" TILGE;
	(end)

Author:
	Dorbedo
------------------------------------------- */
#define TILGE call TRIPLES(dorb,makro,delete)

//// Variablen

#define GETVAR_SYS(var1,var2) getVariable [ARR_2(QUOTE(var1),var2)]
#define SETVAR_SYS(var1,var2) setVariable [ARR_2(QUOTE(var1),var2)]
#define SETPVAR_SYS(var1,var2) setVariable [ARR_3(QUOTE(var1),var2,true)]

#define GETVAR(var1,var2,var3) var1 GETVAR_SYS(var2,var3)
#define GETMVAR(var1,var2) missionNamespace GETVAR_SYS(var1,var2)
#define GETUVAR(var1,var2) uiNamespace GETVAR_SYS(var1,var2)
#define GETPRVAR(var1,var2) profileNamespace GETVAR_SYS(var1,var2)
#define GETPAVAR(var1,var2) parsingNamespace GETVAR_SYS(var1,var2)

#define SETVAR(var1,var2,var3) var1 SETVAR_SYS(var2,var3)
#define SETPVAR(var1,var2,var3) var1 SETPVAR_SYS(var2,var3)
#define SETMVAR(var1,var2) missionNamespace SETVAR_SYS(var1,var2)
#define SETUVAR(var1,var2) uiNamespace SETVAR_SYS(var1,var2)
#define SETPRVAR(var1,var2) profileNamespace SETVAR_SYS(var1,var2)
#define SETPAVAR(var1,var2) parsingNamespace SETVAR_SYS(var1,var2)

#define GETGVAR(var1,var2) GETMVAR(GVAR(var1),var2)
#define GETEGVAR(var1,var2,var3) GETMVAR(EGVAR(var1,var2),var3)
