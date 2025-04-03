package assets;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import flixel.addons.text.FlxTypeText;
import flixel.group.FlxGroup.FlxTypedGroup;

import assets.Character;
import gameplay.BoardGame;
import managers.Everything;

class Minigames extends Everything
{
    var char:Character;

    var startText:FlxText;
    var roundText:FlxText;
    var choiceText:FlxTypeText;

    var buttonNames:Array<String>;
    var buttons:FlxTypedGroup<FlxSprite>;

    var participants:Array<Int>;
    var playerChoice:Array<Dynamic>;

    var group1:Array<Int>;
    var group2:Array<Int>;

    var eliminated:Int = 0;

    public static var victory:Array<Int>;

    public var START:Bool = false;

    override function create()
    {
        canPause = true;

        super.create();
    }

    function winner(?players:Array<Int>)
    {
        var screenDim:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, 0x000000);
        screenDim.alpha = 0.5;
        add(screenDim);

        for (player in players)
        {        
            var text:FlxText = new FlxText(0, 100 + (player * 100), 500, 'Player $player', 40);
            text.alignment = CENTER;
            text.screenCenter(X);
            add(text);

            if (player == players.length)
                text.text += '\nwins';
        }

        victory = players;

        new FlxTimer().start(3, function (timer:FlxTimer)
            FlxG.switchState(BoardGame.new));
    }

    function start(time:Float)
    {
        startText = new FlxText(0, 0, 500, 'START', 50);
        startText.screenCenter();
        add(startText);

        new FlxTimer().start(time, function(timer:FlxTimer)
        {
            startText.kill();
            startText.destroy();

            START = true;
        });
    }
}