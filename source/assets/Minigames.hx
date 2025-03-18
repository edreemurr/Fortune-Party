package assets;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.addons.text.FlxTypeText;

import assets.Character;
import gameplay.BoardGame;
import managers.Everything;

class Minigames extends Everything
{
    var choiceText:FlxTypeText;

    var buttons:FlxTypedGroup<FlxSprite>;
    var buttonNames:Array<String>;

    var participants:Array<Character>;
    var playerChoice:Array<Dynamic>;

    override function create()
    {
        // playerCount = 4;

        participants = characters;
        playerChoice = [];

        choiceText = new FlxTypeText(500, 100, 500, '', 40);
        add(choiceText);

        buttons = new FlxTypedGroup<FlxSprite>();
        add(buttons);

        if (controls.BACK)
            FlxG.switchState(() -> new BoardGame('demo', playerCount));

        super.create();
    }
}