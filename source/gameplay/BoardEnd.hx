package gameplay;

import flixel.util.FlxArrayUtil;
import flixel.FlxG;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.group.FlxGroup.FlxTypedGroup;

import managers.Everything;

class BoardEnd extends Everything
{
    var playerAssets:FlxTypedGroup<FlxText>;

    var results:Array<Int>;

    override function create()
    {
        chen = FlxG.save.data.chen;
        sprouts = FlxG.save.data.sprouts;

        turnOrder = FlxG.save.data.turnOrder;
        playerCount = FlxG.save.data.playerCount;

        trace ('turnOrder = $turnOrder');
        trace ('chen = $chen');

        playerAssets = new FlxTypedGroup<FlxText>();
        add(playerAssets);

        for (i in 0...playerCount)
        {
            var text:FlxText = new FlxText(0, 200 + (i * 100), 500, 'Player ${turnOrder[i] + 1}: ${chen[i]}, ${sprouts[i]}', 28);
            text.screenCenter(X);
            playerAssets.add(text);
        }

        results = [];

        findResults();

        super.create();
    }

    function findResults()
    {
        var num:Int = 0;
        var index:Int = 0;

        for (i in 0...playerCount)
        {
            num = FlxMath.maxInt(num, chen[i]);
            index = chen.indexOf(num);
            trace ('i = $i, $num, $index');
        }

        // results.push(turnOrder[index]);
        // trace ('results = $results');

        // FlxArrayUtil.fastSplice(chen, num);
        // FlxArrayUtil.fastSplice(turnOrder, index);
        // trace ('chen = $chen');
        // trace ('turnOrder = $turnOrder');

        // playerCount --;

        // if (playerCount > 1)
        //     findResults();
        // else
        // {
        //     results.push(turnOrder[0]);

        for (num => text in playerAssets)
            if (num != index)
                text.alpha = 0.5;
        // }
    }
}