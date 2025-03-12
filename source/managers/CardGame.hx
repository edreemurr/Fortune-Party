package managers;

import flixel.FlxG;
import flixel.FlxBasic;
import flixel.tweens.FlxTween;
import flixel.group.FlxGroup.FlxTypedGroup;

import assets.Card;
import managers.Everything;

class CardGame extends Everything
{
    var hand1:FlxTypedGroup<Card>;
    var hand2:FlxTypedGroup<Card>;
    var hand3:FlxTypedGroup<Card>;
    var hand4:FlxTypedGroup<Card>;
    var deck:FlxTypedGroup<Card>;
    var drawnCards:Array<Int>;
    var initCards:Array<Int>;
    var cardType:String;
    var cardCount:Int;

    var drawCallback:Void -> Void = null;

    public function new(game:String = 'garbage')
    {
        super();

        switch (game)
        {
            case 'garbage':
                cardType = 'poker';
                cardCount = 66;
            case 'uno':
                cardType = 'uno';
                cardCount = 61;
        }

        drawnCards = [];

        hand1 = new FlxTypedGroup<Card>();
        hand2 = new FlxTypedGroup<Card>();
        hand3 = new FlxTypedGroup<Card>();
        hand4 = new FlxTypedGroup<Card>();
    }

    function drawCards(player:Int, amount:Int, start:Array<Int>, ?offset:Array<Int>):FlxTypedGroup<Card>
    {
        // var setRows:Float = amount/rows;

        // var choice = FlxG.random.int(0, cardCount, drawnCards);
        // drawnCards.push(choice);

        for (i in 0...amount)
        {
            var newCard = FlxG.random.int(0, cardCount, drawnCards);
            drawnCards.push(newCard);

            switch (player)
            {
                case 1:
                    hand1.add(new Card(cardType, start[0] + (i * offset[0]), start[1] + (i * offset[1]), newCard));

                case 2:
                    hand2.add(new Card(cardType, start[0] + (i * offset[0]), start[1] + (i + offset[1]), newCard));

                case 3:
                    hand3.add(new Card(cardType, start[0] + (i * offset[0]), start[1] + (i * offset[1]), newCard));

                case 4:
                    hand4.add(new Card(cardType, start[0] + (i * offset[0]), start[1] + (i * offset[1]), newCard));
            }

    /*         for (card in hand1)
            {
                card.drawn = true;
                card.x = 500;
                card.y = 200;
            }
    */
            // if (amount > 0)
            // drawCards(player, amount, start, offset);
        }

        return hand1;

        // start[0] += i == setRows ? -i * offset[0] : offset[0];
        // start[1] += i == setRows - 1 ? offset[1] : 0;
    }

    function buildDeck(x:Float, y:Float):FlxTypedGroup<Card>
    {
        deck = new FlxTypedGroup<Card>();

        initCards = [];

        for (i in 0...cardCount)
        {
            var card = FlxG.random.int(0, cardCount, initCards);
            initCards.push(card);

            deck.add(new Card(cardType, x + (i * 0.25), y + (i * 0.25), card));
        }

        return deck;
    }
}