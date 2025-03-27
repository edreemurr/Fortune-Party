package managers;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.text.FlxText;

import assets.Card;
import assets.Character;

import menus.Pause;
import gameplay.BoardGame;

class Everything extends FlxState
{
    var selected:Int = -1;

    public var newGame:Bool;

    var playerCount:Int;

    public var cycle:Int = 1;
    var round:Int = 0;

    var board:String;

    var coins:Array<Int>;
    var starPieces:Array<Int>;
    var lands:Array<Array<String>>;

    var statsUI:Array<FlxSprite>;

    var canPause:Bool = false;
    var controlsFree:Bool = false;
    
    public var activePlayer:Int;
    var locations:Array<Int>;

    var curChar:Character;
    var characters:Array<Character> = [];
    // var playerHands:Array<FlxTypedGroup<Card>> = [];

    var coinsArray:Array<FlxText>;
    var piecesArray:Array<FlxText>;

    var player1:Character;
    var player2:Character;
    var player3:Character;
    var player4:Character;

    // var char1Land:Array<String>;
    // var char2Land:Array<String>;
    // var char3Land:Array<String>;
    // var char4Land:Array<String>;
    // var ownedLand:Array<Array<String>>;

    // var playerLocations:Map<Character, Int>;

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
            FlxG.switchState(BoardGame.new);

        if (controls.PAUSE && canPause)
            openSubState(new Pause(0xffffff));

        super.update(elapsed);
    }

    function rollDice(min:Int = 1, max:Int = 6):Int
        return FlxG.random.int(min, max);

    private function get_controls()
        return Controls.instance;
}