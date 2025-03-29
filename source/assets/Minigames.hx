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

    var buttons:FlxTypedGroup<FlxSprite>;
    var buttonNames:Array<String>;

    var participants:Array<Int>;
    var playerChoice:Array<Dynamic>;

    public var START:Bool = false;

    override function create()
    {
        playerCount = 4;

        canPause = true;

        playerChoice = [];

        if (FlxG.save.data.characters != null)
            participants = FlxG.save.data.characters;
        else
            participants = [1, 2, 3, 4];

        super.create();
    }

    function winner()
    {
        for (player in participants)
        {        
            var text:FlxText = new FlxText(0, 200 + (player * 100), 500, 'Player $player', 40);
            text.alignment = CENTER;
            text.screenCenter(X);
            add(text);

            if (player == participants.length)
                text.text += '\nwin';
        }

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