package gameplay;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import flixel.group.FlxGroup.FlxTypedGroup;

import gameplay.minigames.*;

import managers.Everything;

class MinigameSelection extends FlxSubState
{
    var all:Array<String>;
    var pair:Array<String>;
    var split:Array<String>;

    var chosen:Array<Int>;
    var options:FlxTypedGroup<FlxText>;

    var everything:Everything;

    override function create()
    {
        // var dim:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, 0x000000);
        // dim.alpha = 0.5;
        // add(dim);

        all = ['Hue Won\'t', 'Ur', 'Garbage'];

        chosen = [];

        options = new FlxTypedGroup<FlxText>();
        add(options);

        for (index => game in all)
        {
            var num = FlxG.random.int(0, all.length, chosen);
            
            var text:FlxText = new FlxText(0, 250 + (index * 100), 500, game, 50);
            text.screenCenter(X);
            options.add(text);

            chosen.push(num);
        }

        roulette();

        super.create();
    }

    function roulette()
    {
        var num:Int = 0;
        var loops = FlxG.random.int(10, 20);

        new FlxTimer().start(0.2, function (timer:FlxTimer)
        {
            for (index => game in options)
                if (index == FlxG.random.int(0, options.length))
                {
                    game.alpha = 1;

                    num = index;
                }
                else
                    game.alpha = 0.5;

            loops --;

            if (loops == 0)
                loadMinigame(all[/* num */0]);
        }, loops);
    }

    function loadMinigame(minigame:String)
        switch (minigame)
        {
            case 'Ur': FlxG.switchState(Ur.new);
            case 'Garbage': FlxG.switchState(Garbage.new);
            case 'Hue Won\'t': FlxG.switchState(HueWont.new);
        }
}