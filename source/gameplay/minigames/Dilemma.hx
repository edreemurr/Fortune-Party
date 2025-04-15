package gameplay.minigames;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxTimer;
import flixel.addons.text.FlxTypeText;
import flixel.group.FlxGroup.FlxTypedGroup;

import assets.Minigames;

class Dilemma extends Minigames
{
    var ally:FlxButton;
    var betray:FlxButton;

    var prisoners:FlxTypedGroup<FlxText>;

    var options:Array<String>;

    var points1:Int;
    var points2:Int;

    var pointsText1:FlxText;
    var pointsText2:FlxText;

    var selecting:Bool = true;

    override function create()
    {
        roundText = new FlxText(FlxG.width - 50, 50, 500, '', 28);
        add(roundText);

        ally = new FlxButton(0, 200, 'Ally', () -> choice('Ally'));
        ally.screenCenter(X);
        add(ally);

        betray = new FlxButton(0, 400, 'Betray', () -> choice('Betray'));
        betray.screenCenter(X);
        add(betray);

        choiceText = new FlxTypeText(0, 50, 500, 'Make your choice...', 32);
        choiceText.screenCenter(X);
        add(choiceText);

        pointsText1 = new FlxText(50, 50, 500, 'Team 1: 5', 28);
        add(pointsText1);

        pointsText2 = new FlxText(50, 100, 500, 'Team 2: 5', 28);
        add(pointsText2);

        prisoners = new FlxTypedGroup<FlxText>();
        add(prisoners);

        group1 = [1, 2];
        group2 = [3, 4];

        points1 = 10;
        points2 = 10;

        onStart = turnStart;

        start(1);

        super.create();
    }

    function turnStart()
    {
        round += 1;

        roundText.text = '$round';

        choiceText.resetText('Make your choice...');
        choiceText.start(0.02);

        ally.visible = true;
        betray.visible = true;
    }

    function choice(option:String)
    {
        selecting = false;

        ally.visible = false;
        betray.visible = false;

        options = [];

        for (i in 0...4)
        {
            if (i > 0)
            {
                var num = FlxG.random.int(0, 1);

                switch (num)
                {
                    case 0: option = 'Ally';
                    case 1: option = 'Betray';
                }
            }

            options.push(option);

            var text:FlxText = new FlxText(0, 200 + (i * 100), 1000, 'Player ${i + 1} chose: ${options[i]}', 40);
            text.screenCenter(X);
            prisoners.add(text);
        }

        if (options[0] == 'Ally' && options[2] == 'Ally')
        {
            points1 += 2;
            points2 += 2;
        }
        else if (options[0] == 'Ally' && options[2] == 'Betray')
        {
            points1 -= 2;
            points2 += 3;
        }
        else if (options[0] == 'Betray' && options[2] == 'Ally')
        {
            points1 += 3;
            points2 -= 2;
        }

        if (options[1] == 'Ally' && options[3] == 'Ally')
        {
            points1 += 2;
            points2 += 2;
        }
        else if (options[1] == 'Ally' && options[3] == 'Betray')
        {
            points1 -= 2;
            points2 += 3;
        }
        else if (options[1] == 'Betray' && options[3] == 'Ally')
        {
            points1 += 3;
            points2 -= 2;
        }

        pointsText1.text = 'Team 1: $points1';
        pointsText2.text = 'Team 2: $points2';

        new FlxTimer().start(3, function (timer:FlxTimer)
        {
            selecting = true;

            for (text in prisoners)
                prisoners.remove(text);

            if (round == 10)
                winner(points1 > points2 ? group1 : group2);
            else
                turnStart();
        });
    }
}