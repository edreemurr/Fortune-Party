package gameplay.minigames;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import flixel.addons.text.FlxTypeText;
import flixel.group.FlxGroup.FlxTypedGroup;

import assets.Minigames;
import managers.Everything;

class HueWont extends Minigames
{
    var choice:String;
    var choiceArray:Array<String>;

    var colorChoice:FlxTypeText;
    var textGroup:FlxTypedGroup<FlxTypeText>;

    override function create()
    {
        group1 = [1];
        group2 = [2, 3, 4];

        buttons = new FlxTypedGroup<FlxSprite>();
        add(buttons);

        textGroup = new FlxTypedGroup<FlxTypeText>();
        add(textGroup);
        
        roundText = new FlxText('', 28);
        add(roundText);
        
        buttonNames = ['red', 'blue', 'green', 'yellow'];

        for (num => color in buttonNames)
        {
            var button:FlxSprite = new FlxSprite(300 + (num * 150), 300, 'assets/images/buttons/$color.png');
            button.alpha = 0.5;
            buttons.add(button);
        }

        colorChoice = new FlxTypeText(0, 100, 500, '', 32);
        colorChoice.screenCenter(X);
        add(colorChoice);

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

        playerChoice = [];

        colorChoice.resetText('Player 1 chose: $color');
        colorChoice.start(0.02);

        for (num => player in group2)
        {
            playerChoice.push(FlxG.random.getObject(buttonNames));

            var text:FlxTypeText = new FlxTypeText(0, 300 + (num * 50), 500, 'Player $player chose: ${playerChoice[num]}', 28);
            text.screenCenter(X);
            textGroup.add(text);
            text.start(0.02);
        }

        eliminate();

        new FlxTimer().start(3, function (timer:FlxTimer)
        {
            if (eliminated == 3 || round == 5)
            {
                textGroup.visible = false;
                choiceText.visible = false;
                colorChoice.visible = false;

                winner(eliminated == 3 ? group1 : group2);
            }
            else
                startRound();
        });
    }

    function eliminate()
        for (player => color in playerChoice)
            if (color == choice)
            {
                group2.remove(player + 2);

                eliminated += 1;
            }

    function startRound()
    {
        round += 1;

        buttons.visible = true;
        FlxG.mouse.visible = true;

        for (text in textGroup)
            textGroup.remove(text);

        colorChoice.resetText('');

        roundText.text = '$round';

        choiceText.resetText('Make your choice');
        choiceText.start(0.02);
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