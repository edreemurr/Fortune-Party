package gameplay;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.math.FlxMath;

import managers.Everything;

class Shop extends FlxSubState
{
    var selected = 0;

    var stock:Array<Array<Dynamic>>;
    var items:Array<Array<Dynamic>>;

    var stockSprites:Array<FlxSprite>;
    
    var itemText:FlxText;

    var everything:Everything;

    override function create()
    {
        cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];

        stock = [];
        stockSprites = [];

        items = [
            ['high', 5, 'Can roll only between 4 and 6'],
            ['low', 5, 'Can only only between 1 and 3'],
            ['odd', 6, 'Can only roll 1, 3, and 5'],
            ['even', 7, 'Can only roll 2, 4, and 6'],
            ['slow', 10, 'The dice rolls slowly, allowing for easy manipulation'],
            ['choice', 15, 'The dice shows whatever you choose']
        ];

        var forSale:Array<Int> = [];

        for (i in 0...3)
        {
            var rng = FlxG.random.int(0, items.length - 1, forSale);
            var item:Array<Dynamic> = items[rng];

            forSale.push(rng);
            stock.push(item);
        }

        itemText = new FlxText(0, 500, 500, '${stock[0]}', 28);
        itemText.screenCenter(X);
        add(itemText);

        for (num => item in stock)
        {
            var sprite:FlxSprite = new FlxSprite(400 + (num * 200), 250).loadGraphic('assets/images/dice/${item[0]}.png');
            stockSprites.push(sprite);
            add(sprite);
        }

        super.create();
    }

    override function update(elapsed:Float)
    {
        if (everything.controls.LEFT)
            changeSelection(-1);

        if (everything.controls.RIGHT)
            changeSelection(1);

        super.update(elapsed);
    }

    function changeSelection(num:Int)
    {
        selected = FlxMath.maxAdd(selected, num, stock.length - 1, 0);

        for (num => item in stockSprites)
            item.alpha = (num == selected) ? 1 : 0.5;

        itemText.text = stock[selected][2];
    }
}