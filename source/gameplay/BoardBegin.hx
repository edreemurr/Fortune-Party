package gameplay;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.math.FlxMath;

import managers.EverythingSub;

class BoardBegin extends EverythingSub
{
    var num:Int;
    
    var text:FlxText;
    var numText:FlxText;

    override function create()
    {
        cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];

        text = new FlxText(0, 200, 500, 'How many turns?', 36);
        text.screenCenter(X);
        add(text);

        numText = new FlxText(0, text.y + 150, 500, '5', 50);
        numText.screenCenter(X);
        add(numText);

        super.create();
    }

    override function update(elapsed:Float)
    {
        numText.text = '$num';

        if (FlxG.keys.justPressed.UP)
            num = FlxMath.maxAdd(num, 5, 100, 5);
        if (FlxG.keys.justPressed.DOWN)
            num = FlxMath.maxAdd(num, -5, 100, 5);
        if (FlxG.keys.justPressed.ENTER)
        {
            FlxG.save.data.cycleCount = num;
            FlxG.save.flush();

            close();
        }

        super.update(elapsed);
    }
}