package gameplay.minigames;

import assets.Card;
import managers.CardGame;

class Garbage extends CardGame
{
    override function create()
    {
        game = 'garbage';

        start(1);

        activePlayer = shuffleTurn();

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
    {
        curCard = card;

        for (index in 0...playerHands[activePlayer].length)
            if (curCard.card == index)
            {
                newCard = playerHands[activePlayer].members[index];

                newCard.scale.x = 1.1;
                newCard.scale.y = 1.1;
                newCard.interactable = true;

                curCard.usable = true;
                curCard.interactable = false;

                break;
            }
            else
            {
                curCard.x = 1150;
                curCard.y = 0;

                // curCard.discarded = true;
                curCard.interactable = false;

                deck.remove(curCard);
                discard.add(curCard);

                activePlayer += 1;

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

        topDeck = deck.members[cardCount - 1];
        topDeck.interactable = true;

        // turnEnd = false;
        turnStart = true;
    }
}