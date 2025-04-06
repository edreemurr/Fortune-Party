package gameplay;

import flixel.FlxG;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.math.FlxMath;

import managers.Everything;

class BoardBegin extends FlxSubState
{
    var num:Int = 5;
    
    var text:FlxText;
    var numText:FlxText;

    var everything:Everything;

    override function create()
    {
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

        if (everything.controls.UP)
            num = FlxMath.maxAdd(num, 5, 100, 5);
        if (everything.controls.DOWN)
            num = FlxMath.maxAdd(num, -5, 100, 5);
        if (everything.controls.ENTER)
        {
            FlxG.save.data.cycleCount = num;
            FlxG.save.flush();

            close();
        }

        super.update(elapsed);
    }
}