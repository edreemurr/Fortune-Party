package assets;

import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import flixel.addons.text.FlxTypeText;
import flixel.group.FlxGroup.FlxTypedGroup;

import assets.Character;
import managers.Everything;

class Minigames extends Everything
{
    var choiceText:FlxTypeText;
    var startText:FlxText;

    var buttons:FlxTypedGroup<FlxSprite>;
    var buttonNames:Array<String>;

    var participants:Array<Character>;
    var playerChoice:Array<Dynamic>;

    public var START:Bool = false;

    override function create()
    {
        // playerCount = 4;

        canPause = true;

        participants = characters;
        playerChoice = [];

        choiceText = new FlxTypeText(500, 100, 500, '', 40);
        add(choiceText);

        buttons = new FlxTypedGroup<FlxSprite>();
        add(buttons);

        super.create();
    }

    function start(time:Float)
    {
        startText = new FlxText(0, 0, 500, 'START', 50);
        startText.screenCenter();
        add(startText);

        new FlxTimer().start(time, function(timer:FlxTimer)
        {
            startText.destroy();
            startText.kill();

            START = true;
        });
    }
}