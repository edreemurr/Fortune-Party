package gameplay.minigames;

import managers.CardGame;

class Garbage extends CardGame
{
    override function create()
    {
        game = 'garbage';

        start(2);

        super.create();
    }

    override function update(elapsed:Float)
    {
        if (START && !firstDraw)
        {
            add(drawCards(1, 5, [150, 400], false));
            add(drawCards(1, 5, [150, 500], false));
            add(drawCards(2, 5, [150, 100], false));
            add(drawCards(2, 5, [150, 200], false));

            firstDraw = true;
        }

        super.update(elapsed);
    }
}