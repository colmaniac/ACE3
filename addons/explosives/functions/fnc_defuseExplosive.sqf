/*
* fnc_defuseExplosive.sqf
*
* Author: Garth 'L-H' de Wet
* Causes the unit to defuse the passed explosive.
*
* Arguments:
* 0: Unit <OBJECT>
* 1: Explosive <OBJECT>
*
* Return Value:
* None
*
* Example:
* [player, ACE_Interaction_Target] call ACE_Explosives_fnc_defuseExplosive;
*
* Public: Yes
*/
#include "script_component.hpp"
private ["_unit", "_explosive"];
_unit = _this select 0;
_explosive = _this select 1;

if (getNumber (ConfigFile >> "CfgAmmo" >> typeof _explosive >> "ACE_explodeOnDefuse") == 1) exitWith {
	[_unit, -1, [_explosive, 1], true] call FUNC(detonateExplosive);
};

_unit action ["Deactivate", _unit, _explosive];
