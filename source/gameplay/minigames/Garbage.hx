package gameplay.minigames;

import managers.CardGame;

class Garbage extends CardGame
{
    override function create()
    {
        game = 'garbage';

        start(2);
        trace ('started');

        super.create();
    }

    override function update(elapsed:Float)
    {
        if (START && !firstDraw)
        {
            trace ('drawing cards');
            cards();

            firstDraw = true;
        }

        super.update(elapsed);
    }

    function cards()
    {
        trace ('drawCards');
        add(drawCards(1, 5, [300, 400], [200, 0]));
        add(drawCards(1, 5, [300, 600], [200, 0]));
        add(drawCards(2, 5, [300, 100], [200, 0]));
        add(drawCards(2, 5, [300, 300], [200, 0]));
    }
}