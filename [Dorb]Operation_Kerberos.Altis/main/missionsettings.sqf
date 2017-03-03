/*
 *  Author: Dorbedo
 *
 *  Description:
 *      gerneral Settings
 *
 */
#include "script_component.hpp"

GVARMAIN(playerside) = west;
enableSaving [false, false];
enableRadio false;
enableSentences false;

GVARMAIN(rescuemarker) = "rescue_marker";
If ((GVARMAIN(playerside) == west)&&(missionName in ["[Dorb]Operation_Kerberos","[Dorb]Operation_Kerberos_test"] )) then {
    GVARMAIN(respawnmarker) = "respawn_west";
    GVARMAIN(AIRFIELD) = "airfield";
    GVARMAIN(side) = east;
    CIVILIAN setFriend [WEST, 1];

    WEST setFriend [CIVILIAN, 1];
    WEST setFriend [EAST, 0];
    WEST setFriend [INDEPENDENT, 0];

    EAST setFriend [CIVILIAN, 1];
    EAST setFriend [WEST, 0];
    EAST setFriend [INDEPENDENT, 1];

    INDEPENDENT setFriend [CIVILIAN, 1];
    INDEPENDENT setFriend [WEST, 0];
    INDEPENDENT setFriend [EAST, 1];
};
If ((GVARMAIN(playerside) == east)&&(missionName in ["[Dorb]Operation_Kerberos","[Dorb]Operation_Kerberos_test"])) then {
    GVARMAIN(respawnmarker) = "respawn_east";
    GVARMAIN(AIRFIELD) = "airfield";
    GVARMAIN(side) = west;
    CIVILIAN setFriend [EAST, 1];

    WEST setFriend [CIVILIAN, 1];
    WEST setFriend [EAST, 0];
    WEST setFriend [INDEPENDENT, 1];

    EAST setFriend [CIVILIAN, 1];
    EAST setFriend [WEST, 0];
    EAST setFriend [INDEPENDENT, 0];

    INDEPENDENT setFriend [CIVILIAN, 1];
    INDEPENDENT setFriend [WEST, 1];
    INDEPENDENT setFriend [EAST, 0];
};