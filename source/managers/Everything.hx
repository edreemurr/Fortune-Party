package managers;

import flixel.FlxG;
import flixel.FlxState;

import menus.Title;
import assets.Character;

class Everything extends FlxState
{
    var selected:Int = -1;

    var controlsFree:Bool = false;
    
    var activePlayer:Int;

    var characters:Array<Character> = [];

    var player1:Character;
    var player2:Character;
    var player3:Character;
    var player4:Character;

    public var controls(get, never):Controls;
    public var variables:Map<String, Dynamic> = new Map<String, Dynamic>();

    override function create()
        super.create();

    override function update(elapsed:Float)
    {
        if (FlxG.save.data != null)
            FlxG.save.data.fullscreen = FlxG.fullscreen;

        if (controls.PAUSE)
            FlxG.switchState(Title.new);

        super.update(elapsed);
    }

    function rollDice(min:Int = 1, max:Int = 6):Int
        return FlxG.random.int(min, max);

    private function get_controls()
        return Controls.instance;
}