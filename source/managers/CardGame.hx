package managers;

import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;

import assets.Card;
import assets.Minigames;

class CardGame extends Minigames
{
    var game:String;
    var cardType:String;
    var initCards:Array<Int>;
    var drawnCards:Array<Int>;
    
    var firstDraw:Bool = false;
    
    var deck:FlxTypedGroup<Card>;
    var hand1:FlxTypedGroup<Card>;
    var hand2:FlxTypedGroup<Card>;
    var hand3:FlxTypedGroup<Card>;
    var hand4:FlxTypedGroup<Card>;
    var playerHands:Array<FlxTypedGroup<Card>>;

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

    function drawCards(player:Int, amount:Int, start:Array<Int>, ?offset:Int = 150, faceUp:Bool = true):FlxTypedGroup<Card>
    {
        drawnCards.push(cardCount);
        
        for (i in 0...amount)
        {
            var newCard = FlxG.random.int(0, cardCount, drawnCards);
            drawnCards.push(newCard);

            var x:Float = start[0] + (i * offset);
            var y:Float = start[1] + i;

            switch (player)
            {
                case 1:
                    hand1.add(new Card(cardType, x, y, faceUp ? newCard : cardCount, newCard));

                case 2:
                    hand2.add(new Card(cardType, x, y, faceUp ? newCard : cardCount, newCard));

                case 3:
                    hand3.add(new Card(cardType, x, y, faceUp ? newCard : cardCount, newCard));

                case 4:
                    hand4.add(new Card(cardType, x, y, faceUp ? newCard : cardCount, newCard));
            }
        }

        switch (player)
        {
            case 1: return hand1;
            case 2: return hand2;
            case 3: return hand3;
            case 4: return hand4;
        }

        return null;
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