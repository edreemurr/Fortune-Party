package managers;

import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;

import assets.Card;
import assets.Minigames;

class CardGame extends Minigames
{
    public var game:String;

    public var curCard:Card;
    public var newCard:Card;
    public var topDeck:Card;

    var cardType:String;
    var initCards:Array<Int>;
    var drawnCards:Array<Int>;
    
    var firstDraw:Bool = false;

    public var turnStart:Bool = false;
    // public var turnEnd:Bool = false;
    public var interactable:Bool = false;
    
    var deck:FlxTypedGroup<Card>;
    var discard:FlxTypedGroup<Card>;

    var hand1:FlxTypedGroup<Card>;
    var hand2:FlxTypedGroup<Card>;
    var hand3:FlxTypedGroup<Card>;
    var hand4:FlxTypedGroup<Card>;
    var playerHands:Array<FlxTypedGroup<Card>>;

    public var cardCount:Int;

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

                default:

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
        discard = new FlxTypedGroup<Card>();

        initCards = [];

        for (i in 0...cardCount)
        {
            var card = FlxG.random.int(0, cardCount, initCards);
            initCards.push(card);

            deck.add(new Card(cardType, x + (i * 0.05), y + (i * 0.05), cardCount));
        }

        topDeck = deck.members[cardCount - 1];

        return deck;
    }

    function shuffleTurn():Int
        return FlxG.random.int(0, playerCount);
}