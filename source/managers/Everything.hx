package managers;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;

import menus.Pause;
import menus.Title;
import assets.Card;
import assets.Character;

class Everything extends FlxState
{
    var selected:Int = -1;

    var playerCount:Int;
    var round:Int = 0;

    var canPause:Bool = false;
    var controlsFree:Bool = false;
    
    var activePlayer:Int;
    var curLocation:Int;

    var characters:Array<Character> = [];
    // var playerHands:Array<FlxTypedGroup<Card>> = [];

    var player1:Character;
    var player2:Character;
    var player3:Character;
    var player4:Character;

    // var cards1:FlxTypedGroup<Card>;
    // var cards2:FlxTypedGroup<Card>;
    // var cards3:FlxTypedGroup<Card>;
    // var cards4:FlxTypedGroup<Card>;

    public var controls(get, never):Controls;
    public var variables:Map<String, Dynamic> = new Map<String, Dynamic>();

    override function update(elapsed:Float)
    {
        if (FlxG.save.data != null)
            FlxG.save.data.fullscreen = FlxG.fullscreen;

        if (controls.BACK)
            FlxG.switchState(Title.new);

        if (controls.PAUSE && canPause)
            openSubState(new Pause(0xffffff));

        super.update(elapsed);
    }

    function rollDice(min:Int = 1, max:Int = 6):Int
        return FlxG.random.int(min, max);

    private function get_controls()
        return Controls.instance;
}