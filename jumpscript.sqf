waitUntil {time > 0};
if (hasInterface) then
{
waitUntil {!isNull player};
waitUntil {!(isNull (findDisplay 46))};
};

fn_jumpAnim =
{
	if (vehicle player != player) exitWith {};
	private["_unit", "_anim", "_weap"];
    _unit = _this select 0;
    _anim = _this select 1;
    _unit switchMove _anim;
	if (primaryWeapon player != currentWeapon player) then {
    sleep 0.79;
	    if (handgunWeapon player == currentWeapon player) then {
	        _unit switchMove "AmovPercMstpSrasWpstDnon"; player switchCamera cameraView;
		}else{
			_unit switchMove "AmovPercMrunSnonWnonDf"; player switchCamera cameraView;
		};
	};
};

AA_fnc_jumpHandler = {
private ["_handled","_key","_shift","_ctrl"];
_key = (_this select 1);
_shift = (_this select 2);
_ctrl = (_this select 3);
//exm  if (_ctrl) then {};
//_shift = _this select 2;
_handled = false;

if(!alive player) exitWith {_handled};
    if (_key in (actionKeys "getOver")) then // V
	        {
				if (vehicle player != player) exitWith {_handled = false;};
				 if (animationState player != "AovrPercMrunSrasWrflDf" && speed player >= 15 && getFatigue player < 0.7) then {
				[[player,"AovrPercMrunSrasWrflDf"],"fn_jumpAnim"] spawn BIS_fnc_MP;
				_handled = true;
				};	
			};
_handled;
};

(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call AA_fnc_jumpHandler;"];