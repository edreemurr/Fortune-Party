package gameplay;

import flixel.group.FlxGroup.FlxTypedGroup;

import assets.Card;
import managers.CardGame;

class Garbage extends CardGame
{
    override function create()
    {
        // add(buildDeck(50, 50));

        super.create();
    }

    override function update(elapsed:Float)
    {
        if (controls.ENTER)
            add(drawCards(1, 1, [500, 300], [100, 0]));

        super.update(elapsed);
    }
}