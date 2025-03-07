package gameplay;

import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.group.FlxGroup.FlxTypedGroup;

import assets.Card;

import managers.Everything;

class CardGame extends Everything
{
    var chosenCards:Array<Int>;

    var cardType:String;
    var amount:Int;

    public function new(type:String = 'uno')
    {
        super();

        this.cardType = type;

        switch (type)
        {
            case 'poker': amount = 66;
            case 'uno': amount = 61;
        }
    }

    override public function create()
    {
        add(initCards());

        super.create();
    }

    override public function update(elapsed:Float)
    {
        if (FlxG.keys.pressed.R)
            FlxG.resetState();

        super.update(elapsed);
    }

    function initCards():FlxTypedGroup<Card>
    {
        cards = new FlxTypedGroup<Card>();
        chosenCards = [];

        cardStack(7, FlxPoint.get(40, 50), FlxPoint.get(2, -2));

        return cards;
    }

    function cardStack(cardCount:Int, start:FlxPoint, offset:FlxPoint)
    {
        var x = start.x;
        var y = start.y;

        for (i in 0...cardCount)
        {
            var choice = FlxG.random.int(0, amount, chosenCards);
            chosenCards.push(choice);

            cards.add(new Card(cardType, x, y, choice));

            x += offset.x;
            y += offset.y;
        }
    }
}