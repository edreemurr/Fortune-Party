package managers;

import flixel.FlxG;
import flixel.FlxState;

class Everything extends FlxState
{
    private static var cycle:Int = 0;

    private static var players:Int = 1;
    private static var cpus:Int = 0;

    private static var coins:Array<Int> = [];
    private static var starPieces:Array<Int> = [];

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