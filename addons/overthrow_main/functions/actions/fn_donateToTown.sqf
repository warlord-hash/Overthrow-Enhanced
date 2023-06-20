private _town = (getpos player) call OT_fnc_nearestTown;

private _money = player getVariable ["money",0];
private _stability = (server getVariable [format["stability%1",_town],0]);
private _price = floor((1000/(1+_stability)/10)*1000);

if(_money < _price) exitWith {"You cannot afford that" call OT_fnc_notifyMinor};
playSound "3DEN_notificationDefault";
player setVariable ["money",_money-_price,true];

if (_town in (server getVariable ["NATOabandoned",[]])) then {
	[_town, 5] call OT_fnc_stability;
} else {
	[_town, -5] call OT_fnc_stability;
}