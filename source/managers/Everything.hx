package managers;

import flixel.input.gamepad.FlxGamepad;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import flixel.group.FlxGroup.FlxTypedGroup;

import assets.*;

import menus.Pause;

class Everything extends FlxState
{
    var selected:Int = -1;

    var GUI:FlxCamera;
    var cam1:FlxCamera;
    var cam2:FlxCamera;
    var cam3:FlxCamera;
    var cam4:FlxCamera;
    var subCam:FlxCamera;
    var gayCam:FlxCamera;
    var textCam:FlxCamera;

    var newGame:Bool;
    var boardGame:Bool = false;

    var cycleCount:Int;
    var playerCount:Int;

    var cycle:Int = 1;
    var round:Int = 0;

    var rng:Int = 0;

    var board:String;
    public var curGame:String;

    var numArray:Array<String> = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];

    var turnOrder:Array<Int>;
    public var chen:Array<Int>;
    public var sprouts:Array<Int>;
    
    var numbers:FlxSprite;

    var statsUI:Array<FlxSprite>;
    var charNum:Array<FlxSprite>;

    var canPause:Bool = false;
    public var controlsFree:Bool = false;

    public var activePlayer:Int;

    var locations:Array<Int> = [-1, -1, -1, -1];
    var locationsAlt:Array<Int> = [-1, -1, -1, -1];

    public var curChar:Character;
    var characters:Array<Character> = [];

    public var cycleText:FlxText;
    
    var sproutArray:Array<FlxSprite>;
    var chenArray:Array<Array<FlxSprite>>;
    
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
    // var playerHands:Array<FlxTypedGroup<Card>>;

    var controllers:Array<FlxGamepad> = [];

    var deciding:Bool = false;
    var turnStart:Bool = false;

    var timerComplete:Void -> Void;

    override function update(elapsed:Float)
    {
        if (FlxG.save.data != null)
            FlxG.save.data.fullscreen = FlxG.fullscreen;

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
                text.kill();
                text.destroy();

                timerComplete;
            }
        }, time);
    }
}