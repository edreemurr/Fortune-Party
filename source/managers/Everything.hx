package managers;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import flixel.group.FlxGroup.FlxTypedGroup;

import assets.Card;
import assets.Character;

import menus.Pause;
import gameplay.BoardGame;

class Everything extends FlxState
{
    var selected:Int = -1;

    var GUI:FlxCamera;
    var cam1:FlxCamera;
    var cam2:FlxCamera;
    var cam3:FlxCamera;
    var cam4:FlxCamera;
    var gayCam:FlxCamera;

    public var subCam:FlxCamera;

    public var newGame:Bool;

    public var cycleCount:Int;
    public var playerCount:Int;

    var cycle:Int = 1;
    var round:Int = 0;

    var rng:Int = 0;

    var board:String;
    public var curGame:String;

    var turnOrder:Array<Int>;
    public var coins:Array<Int>;
    public var starPieces:Array<Int>;
    
    var statsUI:Array<FlxSprite>;

    var canPause:Bool = false;
    public var controlsFree:Bool = false;

    public var activePlayer:Int;
    var locations:Array<Int>;

    var curChar:Character;
    var characters:Array<Character> = [];

    public var cycleText:FlxText;
    
    var coinsArray:Array<FlxText>;
    var piecesArray:Array<FlxText>;
    
    var player1:Character;
    var player2:Character;
    var player3:Character;
    var player4:Character;
    
    var land1:Array<String>;
    var land2:Array<String>;
    var land3:Array<String>;
    var land4:Array<String>;
    var lands:Array<Array<String>>;
    
    var cards1:FlxTypedGroup<Card>;
    var cards2:FlxTypedGroup<Card>;
    var cards3:FlxTypedGroup<Card>;
    var cards4:FlxTypedGroup<Card>;
    // var playerHands:Array<FlxTypedGroup<Card>> = [];

    var timerComplete:Void -> Void;

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

    function timer(time:Int, x:Float, y:Float)
    {
        var text:FlxText = new FlxText(x, y, 100, '$time', 28);
        add(text);

        new FlxTimer().start(1, function (timer:FlxTimer)
        {
            time --;

            text.text = '$time';

            if (time == 0)
            {
                trace ('Time\'s up');

                text.kill();
                text.destroy();

                timerComplete;
            }
        }, time);
    }

    function rollDice(min:Int = 1, max:Int = 6):Int
        return FlxG.random.int(min, max);

    function RNG(min:Int, max:Int):Int
        return FlxG.random.int(min, max);

    private function get_controls()
        return Controls.instance;
}