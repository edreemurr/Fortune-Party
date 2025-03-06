package gameplay;

import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.group.FlxGroup.FlxTypedGroup;

import managers.Card;

import managers.Everything;

class CardGame extends Everything
{
    var cards:FlxTypedGroup<Card>;
    var chosenCards:Array<Int>;

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
            var choice = FlxG.random.int(0, 66, chosenCards);
            chosenCards.push(choice);

            cards.add(new Card(x, y, choice));

            trace (chosenCards);

            x += offset.x;
            y += offset.y;
        }
    }
}