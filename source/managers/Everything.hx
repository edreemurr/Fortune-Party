package managers;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;

import assets.Card;
import assets.Character;

class Everything extends FlxState
{
    var selected:Int = -1;

    var controlsFree:Bool = false;
    
    var cycle:Int;
    var diceRoll:Int;
    var spaceCount:Int;
    var activePlayer:Int;

    var board:FlxSprite;
    var cards:FlxTypedGroup<Card>;

    var characters:Array<Character> = [];

    var player1:Character;
    var player2:Character;
    var player3:Character;
    var player4:Character;

    var coins:Array<Int>;
    var starPieces:Array<Int>;

    var spaceArray:Array<Array<Dynamic>>;
    var playerLocations:Map<Character, Int>;

    public var controls(get, never):Controls;
    public var variables:Map<String, Dynamic> = new Map<String, Dynamic>();

    override function create()
        super.create();

    override function update(elapsed:Float)
    {
        if (FlxG.save.data != null)
            FlxG.save.data.fullscreen = FlxG.fullscreen;

        super.update(elapsed);
    }

    function rollDice(min:Int = 1, max:Int = 6):Int
        return FlxG.random.int(min, max);

    private function get_controls()
        return Controls.instance;
}