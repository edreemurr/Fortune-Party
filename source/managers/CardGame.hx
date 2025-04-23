package managers;

import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;

import assets.Card;
import assets.Minigames;

class CardGame extends Minigames
{
    public var game:String;

    public var topDeck:Card;
    public var curCard:Card;
    public var nextCard:Card;

    public var curCardNum:Int;
    public var nextCardNum:Int;

    var cardType:String;
    var initCards:Array<Int>;
    var drawnCards:Array<Int>;
    
    var firstDraw:Bool = false;

    // public var turnStart:Bool = false;
    // public var turnEnd:Bool = false;
    public var interactable:Bool = false;
    
    public var deck:FlxTypedGroup<Card>;
    public var discard:FlxTypedGroup<Card>;

    var hand1:FlxTypedGroup<Card>;
    var hand2:FlxTypedGroup<Card>;
    var hand3:FlxTypedGroup<Card>;
    var hand4:FlxTypedGroup<Card>;
    public var playerHands:Array<FlxTypedGroup<Card>>;

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

        deck = new FlxTypedGroup<Card>();
        discard = new FlxTypedGroup<Card>();

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

            playerHands[player].add(new Card(cardType, x, y, faceUp ? newCard : cardCount, newCard));

        }

        return playerHands[player];
    }

    function buildDeck(x:Float, y:Float):FlxTypedGroup<Card>
    {
        initCards = [];

        for (i in 0...cardCount)
        {
            var card = FlxG.random.int(0, cardCount, initCards);
            initCards.push(card);

            deck.add(new Card(cardType, x + (i * 0.05), y + (i * 0.05), cardCount, card));
        }

        topDeck = deck.members[cardCount];

        return deck;
    }

    function shuffleTurn():Int
        return FlxG.random.int(1, playerCount);
}