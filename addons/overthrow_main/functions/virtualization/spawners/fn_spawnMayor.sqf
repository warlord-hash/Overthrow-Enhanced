params ["_town"];

private _group = createGroup civilian;
_group setBehaviour "SAFE";

private _roadPos = _town call OT_fnc_getRandomRoadPosition;
private _pos = [_roadPos,random 360,10] call SHK_pos_fnc_pos;

diag_log format["Overthrow Enhanced: creating mayor for %1 at %2", _town, _pos];

private _mayor = _group createUnit ["C_Man_formal_1_F", _pos, [], 0, "NONE"];
_mayor setVariable ["town", _town];
_mayor setBehaviour "CARELESS";

[_mayor] call OT_fnc_initMayor;
_group;