package gameplay.minigames;

import flixel.math.FlxMath;
import flixel.text.FlxText;

import assets.Minigames;

class ClockStop extends Minigames
{
    var time:FlxText;

    var timeTrack:Float = 0;

    var stop:Bool = false;

    override function create()
    {
        time = new FlxText(0, 0, 500, '', 40);
        time.screenCenter();
        add(time);

        super.create();
    }

    override function update(elapsed:Float)
    {
        if (!stop)
            timeTrack += elapsed;

        if (controls.ENTER)
            stop = true;

        time.text = '${FlxMath.roundDecimal(timeTrack, 2)}';

        super.update(elapsed);
    }
}