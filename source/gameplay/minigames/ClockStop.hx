package gameplay.minigames;

import flixel.math.FlxMath;
import flixel.text.FlxText;

import assets.Minigames;

class ClockStop extends Minigames
{
    var time:FlxText;
    var pointsText:FlxText;

    var points:Float = 0;
    var timeTrack:Float = 0;

    var stop:Bool = false;

    override function create()
    {
        time = new FlxText(0, 0, 500, '', 40);
        time.screenCenter();
        add(time);

        pointsText = new FlxText(15, 15, 500, '0', 28);
        add(pointsText);

        super.create();
    }

    override function update(elapsed:Float)
    {
        if (!stop)
            timeTrack += elapsed;

        if (controls.ENTER)
        {
            stop = true;
            finish();
        }

        time.text = '${FlxMath.roundDecimal(timeTrack, 2)}';

        super.update(elapsed);
    }

    function finish()
    {
        var pointCount = FlxMath.roundDecimal(10 - timeTrack, 2);

        var timeLeft:FlxText = new FlxText(time.x, time.y + 50, 500, '$pointCount', 32);
        add(timeLeft);

        points += (pointCount < 0) ? -pointCount : pointCount;

        pointsText.text = '$points';
    }
}