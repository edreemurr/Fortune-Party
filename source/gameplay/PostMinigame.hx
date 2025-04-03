package gameplay;

import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.group.FlxGroup.FlxTypedGroup;

import assets.Minigames;
import gameplay.BoardGame;
import managers.Everything;

class PostMinigame extends FlxSubState
{
    var stats:FlxTypedGroup<FlxText>;

    var board:BoardGame;
    var everything:Everything;

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

        trace (Minigames.victory);

        for (num => text in stats)
            for (winner in Minigames.victory)
                if (winner == num + 1)
                    text.text += ' won';
    }

    override function update(elapsed:Float)
    {
        if (everything.controls.ENTER)
            close();

        super.update(elapsed);
    }
}