package managers;

import flixel.FlxG;
import flixel.tweens.FlxTween;
import flixel.group.FlxGroup.FlxTypedGroup;

import gameplay.Garbage;
import gameplay.Ur;
import assets.Card;
import managers.Everything;

class CardGame extends Everything
{
    var playerHands:Array<FlxTypedGroup<Card>>;
    var hand1:FlxTypedGroup<Card>;
    var hand2:FlxTypedGroup<Card>;
    var hand3:FlxTypedGroup<Card>;
    var hand4:FlxTypedGroup<Card>;
    var deck:FlxTypedGroup<Card>;
    var drawnCards:Array<Int>;
    var initCards:Array<Int>;
    var cardType:String;
    var game:String;

    public static var cardCount:Int;

    override function create()
    {
        switch (game)
        {
            case 'garbage':
                cardType = 'poker';
                cardCount = 67;

            case 'uno':
                cardType = 'uno';
                cardCount = 61;
        }

        drawnCards = [];

        hand1 = new FlxTypedGroup<Card>();
        hand2 = new FlxTypedGroup<Card>();
        hand3 = new FlxTypedGroup<Card>();
        hand4 = new FlxTypedGroup<Card>();

        playerHands = [hand1, hand2, hand3, hand4];

        super.create();
    }

    function drawCards(player:Int, amount:Int, start:Array<Int>, ?offset:Array<Int>, faceUp:Bool = true):FlxTypedGroup<Card>
    {
        // var setRows:Float = amount/rows;

        if (offset == null)
            offset = [0, 0];

        for (i in 0...amount)
        {
            var newCard = FlxG.random.int(0, cardCount, drawnCards);
            drawnCards.push(newCard);

            var x:Float = start[0] + (i * offset[0]);
            var y:Float = start[1] + (i * offset[1]);

            // start[0] += i == setRows ? -i * offset[0] : offset[0];
            // start[1] += i == setRows - 1 ? offset[1] : 0;

            switch (player)
            {
                case 1:
                    hand1.add(new Card(cardType, x, y, newCard));

                case 2:
                    hand2.add(new Card(cardType, x, y, newCard));

                case 3:
                    hand3.add(new Card(cardType, x, y, newCard));

                case 4:
                    hand4.add(new Card(cardType, x, y, newCard));
            }

    /*         for (card in hand1)
            {
                card.drawn = true;
                card.x = 500;
                card.y = 200;
            }
    */
        }

        return hand1;
    }

    function buildDeck(x:Float, y:Float):FlxTypedGroup<Card>
    {
        deck = new FlxTypedGroup<Card>();

        // initCards = [];

        for (i in 0...cardCount)
        {
            // var card = FlxG.random.int(0, cardCount, initCards);
            // initCards.push(card);

            deck.add(new Card(cardType, x + (i * 0.25), y + (i/0.25), cardCount));
        }

        return deck;
    }
}