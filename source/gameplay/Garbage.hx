package gameplay;

import managers.CardGame;

class Garbage extends CardGame
{
    override function create()
    {
        add(buildDeck(50, 50));
        // add(initCards(10, 2, [300, 300], [150, 100]));

        super.create();
    }
}