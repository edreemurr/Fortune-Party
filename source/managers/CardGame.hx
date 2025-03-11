package managers;

import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;

import assets.Card;

import managers.Everything;

class CardGame extends Everything
{
    var cards:FlxTypedGroup<Card>;
    var deck:FlxTypedGroup<Card>;
    var drawnCards:Array<Int>;
    var initCards:Array<Int>;
    var cardType:String;
    var cardCount:Int;

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
    }

/*     function initCards(amount:Int, ?rows:Int = 1, start:Array<Int>, offset:Array<Int>):FlxTypedGroup<Card>
    {
        cards = new FlxTypedGroup<Card>();

        var setRows:Float = amount/rows;

        for (i in 0...amount)
        {
            var choice = FlxG.random.int(0, cardCount, drawnCards);
            drawnCards.push(choice);

            cards.add(new Card(cardType, start[0], start[1], choice));

            start[0] += i == setRows ? -i * offset[0] : offset[0];
            start[1] += i == setRows - 1 ? offset[1] : 0;
        }

        return cards;
    }
 */
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