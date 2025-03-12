package gameplay;

import flixel.FlxG;

import managers.CardGame;

class Garbage extends CardGame
{
    override function create()
    {
        game = 'garbage';

        // add(buildDeck(50, 50));

        super.create();
    }

    override function update(elapsed:Float)
    {
        if (controls.ENTER)
            add(drawCards(1, 1, [500, 300], [100, 0]));

        if (FlxG.keys.pressed.THREE)
            add(drawCards(1, 3, [500, 300], [100, 0]));
        if (FlxG.keys.pressed.FIVE)
            add(drawCards(1, 5, [500, 100], [100, 0]));

        super.update(elapsed);
    }
}