package gameplay;

import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.group.FlxGroup.FlxTypedGroup;

import assets.Minigames;

import managers.EverythingSub;

class PostMinigame extends EverythingSub
{
    var stats:FlxTypedGroup<FlxText>;

    public function new(players:Int)
    {
        super();

        stats = new FlxTypedGroup<FlxText>();
        add(stats);

        for (i in 0...players)
        {
            var text:FlxText = new FlxText(0, 150 + (i * 150), 500, 'Player ${i + 1}', 38);
            text.screenCenter(X);
            stats.add(text);
        }

        for (num => text in stats)
            for (winner in Minigames.victory)
                if (winner == num + 1)
                    text.text += ' won';
    }

    override function update(elapsed:Float)
    {
        // if (controls.interact.triggered)
            close();

        super.update(elapsed);
    }
}