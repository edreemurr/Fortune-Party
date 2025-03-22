package gameplay.minigames;

import flixel.math.FlxMath;
import assets.Card;
import managers.CardGame;

class Garbage extends CardGame
{
    override function create()
    {
        game = 'garbage';

        start(1);

        super.create();
    }

    override function update(elapsed:Float)
    {
        if (START && !firstDraw)
        {
            add(buildDeck(50, 50));

            add(drawCards(1, 5, [250, 400], false));
            add(drawCards(1, 5, [250, 500], false));
            add(drawCards(2, 5, [250, 100], false));
            add(drawCards(2, 5, [250, 200], false));

            firstDraw = true;

            changeTurn();
        }

        if (turnStart)
        {
            if (topDeck.drawn)
            {
                turnStart = false;

                checkIndex(topDeck);
            }
        }

        super.update(elapsed);
    }

    function checkIndex(card:Card)
        for (index in 0...playerHands[activePlayer].length)
        {
            cardNum = Std.int(index/4);

            if (card.card == cardNum)
            {
                nextCard = playerHands[activePlayer].members[cardNum];

                // nextCard.interactable = true;

                card.usable = true;
                card.interactable = false;

                nextCard.select(nextCard);

                checkIndex(nextCard);

                break;
            }
            else
            {
                card.discarded = true;
                card.interactable = false;

                deck.remove(card);
                discard.add(card);

                activePlayer += 1;
                activePlayer = FlxMath.wrap(activePlayer, 0, 1);

                changeTurn();
            }
        }

    function changeTurn()
    {
        choiceText.y = 0;

        choiceText.resetText('Player ${activePlayer + 1}\nDraw a card');
        choiceText.alignment = CENTER;
        choiceText.start(0.04);

        cardCount -= 1;

        topDeck = deck.members[cardCount];
        topDeck.interactable = true;

        // turnEnd = false;
        turnStart = true;
    }
}