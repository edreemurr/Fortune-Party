package gameplay.minigames;

import managers.CardGame;

class Garbage extends CardGame
{
    override function create()
    {
        game = 'garbage';

        add(buildDeck(100, 100));

        super.create();
    }

    override function update(elapsed:Float)
    {
        if (controls.ENTER)
        {
            add(drawCards(1, 1, [800, 200]));
        }

        super.update(elapsed);
    }
}