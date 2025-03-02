package managers;

import flixel.FlxG;
import flixel.FlxState;

import assets.Character;

class Everything extends FlxState
{
    var cycle:Int;
    var activePlayer:Int;

    var characters:Array<Character> = [];

    var coins:Array<Int> = [];
    var starPieces:Array<Int> = [];

    public var controls(get, never):Controls;
    public var variables:Map<String, Dynamic> = new Map<String, Dynamic>();

    override function create()
    {
        // FlxTransitionableState.skipNextTransOut = false;

        super.create();
    }

    override function update(elapsed:Float)
    {
        if (FlxG.save.data != null)
            FlxG.save.data.fullscreen = FlxG.fullscreen;

        super.update(elapsed);
    }

/*     public static function switchState(state:FlxState = null)
    {
        if (state == null)
        {
            resetState();

            return;
        }

        if (FlxTransitionableState.skipNextTransIn)
            FlxG.switchState(state);
        else
            startTransition(state);

        FlxTransitionableState.skipNextTransIn = false;
    }

    public static function resetState()
    {
        if (FlxTransitionableState.skipNextTransIn)
            FlxG.resetState();
        else
            startTransition();

        FlxTransitionableState.skipNextTransIn = false;
    }

    public static function startTransition(state:FlxState = null)
    {
        FlxG.state.openSubState(new CustomFadeTransition(0.5, false));

        if (state == false)
            CustomFadeTransition.finishCallback = function() FlxG.resetState();
        else
            CustomFadeTransition.finishCallback = function() FlxG.switchState(state);
    }
 */
    public static function getState():Everything
        return cast (FlxG.state, Everything);

    public static function getVariables()
        return getState().variables;
    
    private function get_controls()
        return Controls.instance;
}