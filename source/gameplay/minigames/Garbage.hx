package gameplay.minigames;

import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.addons.text.FlxTypeText;

import assets.Card;
import managers.CardGame;

class Garbage extends CardGame
{
    var cardPlaces1:Array<FlxPoint>;
    var cardPlaces2:Array<FlxPoint>;
    public var cardPlaces:Array<Array<FlxPoint>>;

    public var cardCheck:Bool = false;

    override function create()
    {
        game = 'garbage';

        choiceText = new FlxTypeText(0, 50, 500, 'Player ${activePlayer + 1}\nDraw a card', 32);
        choiceText.screenCenter(X);
        add(choiceText);

        cardPlaces1 = [FlxPoint.get(250, 400), FlxPoint.get(350, 400), FlxPoint.get(450, 400), FlxPoint.get(550, 400), FlxPoint.get(650, 400), FlxPoint.get(250, 500), FlxPoint.get(350, 500), FlxPoint.get(450, 500), FlxPoint.get(550, 500), FlxPoint.get(650, 500)];
        cardPlaces2 = [FlxPoint.get(250, 100), FlxPoint.get(350, 100), FlxPoint.get(450, 100), FlxPoint.get(550, 100), FlxPoint.get(650, 100), FlxPoint.get(250, 200), FlxPoint.get(350, 200), FlxPoint.get(450, 200), FlxPoint.get(550, 200), FlxPoint.get(650, 200)];

        cardPlaces = [cardPlaces1, cardPlaces2];

        playerHands = [hand1, hand2];

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

        if (nextCard != null && !cardCheck)
        {
            if (nextCard.flipped)
                checkIndex(nextCard);

            if (nextCard.selected)
                curCard.accepted = true;
        }

        super.update(elapsed);
    }

    public function checkIndex(card:Card)
    {
        cardCheck = true;

        curCard = card;
        
        var yippee:Bool = false;

        for (index in 0...playerHands[activePlayer].length)
        {
            curCardNum = Std.int(curCard.card/4) + 2;

            if (curCardNum < 10)
            {
                nextCard = playerHands[activePlayer].members[curCardNum];
                nextCardNum = Std.int(nextCard.card/4) + 2;

                nextCard.interactable = true;

                curCard.usable = true;
                curCard.interactable = false;

                curCard.newX = cardPlaces[activePlayer][curCardNum].x;
                curCard.newY = cardPlaces[activePlayer][curCardNum].y;

                yippee = true;

                choiceText.resetText('Player ${activePlayer + 1}\nKeep going');
                choiceText.start(0.02);

                cardCheck = false;

                trace ('yes');

                break;
            }
        }

        if (!yippee)
        {
            // deck.remove(card);
            discard.add(curCard);
            
            curCard.discarded = true;
            curCard.interactable = false;

            trace ('no');

            changeTurn();
        }
    }

    function changeTurn()
    {
        activePlayer += 1;
        activePlayer = FlxMath.wrap(activePlayer, 0, 1);

        choiceText.y = 0;

        choiceText.resetText('Player ${activePlayer + 1}\nDraw a card');
        choiceText.alignment = CENTER;
        choiceText.start(0.04);

        cardCount -= 1;

        topDeck = deck.members[cardCount];
        topDeck.interactable = true;

        turnStart = true;
    }
}