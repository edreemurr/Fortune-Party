package gameplay.minigames;

import managers.Everything;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;

import assets.Minigames;

class HueWont extends Minigames
{
    var choice:String;

    override function create()
    {
        buttonNames = ['red', 'blue', 'green', 'yellow'];

        startRound();

        super.create();
    }

    override function update(elapsed:Float)
    {
        var mouseHover:Bool = false;

        for (i in 0...buttonNames.length)
            if (FlxG.mouse.overlaps(buttons.members[i]))
            {
                mouseHover = true;

                if (FlxG.mouse.justPressed)
                    colorSelect(buttonNames[selected]);

                if (selected != i)
                    buttonHover(i);

                break;
            }

        if (!mouseHover && selected != -1)
        {
            buttonIdle(selected);

            selected = -1;
        }

        super.update(elapsed);
    }

    function colorSelect(color:String)
    {
        buttons.visible = false;

        choiceText.resetText('');

        choice = color;

        for (i in 0...playerCount)
        {
            playerChoice.push(FlxG.random.getObject(buttonNames));

            var text:FlxTypeText = new FlxTypeText(0, 300 + (i * 50), 500, 'Player ${i + 1} chose: ${i > 0 ? playerChoice[i] : color}', 28);
            text.screenCenter(X);
            text.start(0.02);
            add(text);
        }

        eliminate();

        trace (participants);
    }

    function eliminate()
        for (player => color in playerChoice)
            if (color[player] == choice)
                participants.remove(characters[player]);

    function startRound()
    {
        round += 1;

        buttons.visible = true;

        choiceText.resetText('Make your choice');
        choiceText.start(0.02);

        FlxG.random.shuffle(buttonNames);

        for (num => color in buttonNames)
        {
            var button:FlxSprite = new FlxSprite(300 + (num * 150), 300, 'assets/images/buttons/$color.png');
            button.alpha = 0.5;
            buttons.add(button);
        }
    }

    function buttonHover(selection:Int)
    {
        if (selected != -1)
            buttonIdle(selected);

        selected = selection;

        buttons.members[selected].alpha = 1;
    }

    function buttonIdle(index:Int)
        buttons.members[index].alpha = 0.5;
}