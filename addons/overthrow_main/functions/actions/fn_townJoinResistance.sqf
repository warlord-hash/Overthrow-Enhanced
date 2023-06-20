private _town = (getpos player) call OT_fnc_nearestTown;
private _standing = [_town] call OT_fnc_support;
private _civ = OT_interactingWith;
private _talk = ["If we band together, we can fight for our freedom. Will you join us?"];
private _code = {};

if(_standing < -35) then
{
	_talk pushBack "I cannot support your so-called 'resistance'. Your actions have gone too far.";
};

if(_standing == 0 || _standing >= -35) then {
	_talk pushBack "I have no interest in these kind of politics or rebel movements. Good day.";
};

if(_standing > 0 && _standing < 60) then
{
	_talk pushBack "Sorry, but I don't think you have enough backing here to make a difference. So, no.";
};

if(_standing >= 60) then {
	_talk pushBack "Count us in. Let's do this.";
	_code = {
		params ["_town"];
		[_town,-100] call OT_fnc_stability;
	};
};

[player, _civ, _talk, _code, [_town]] call OT_fnc_doConversation;