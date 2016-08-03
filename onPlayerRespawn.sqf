if (isDedicated) exitWith {};
_new = _this select 0;
_old = _this select 1;

if(isNull(_old)) exitWith {};

titleText ["You died", "BLACK FADED", 0];

waitUntil {alive player};
player setCaptive true;

removeHeadgear player;
removeAllWeapons player;
removeAllAssignedItems player;
removeGoggles player;
removeBackpack player;
removeVest player;

player addWeapon "ItemMap";

sleep 2;

_house = _old getVariable "home";
_town = (getpos _house) call nearestTown;
_housepos = getpos _house;

_pos = [_housepos, 0, 30, 1, 0, 20, 0] call BIS_fnc_findSafePos;

_house setVariable ["owner",player,true];
player setVariable ["home",_house,true];

//put a marker on home
_mrk = createMarkerLocal ["home",_housepos];
_mrk setMarkerShape "ICON";
_mrk setMarkerType "loc_Tourism";
_mrk setMarkerColor "ColorWhite";
_mrk setMarkerText "Home";


player setPos _pos;

titleText ["", "BLACK IN", 5];

[] execVM "setupPlayer.sqf";
