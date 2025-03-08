package gameplay;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.group.FlxGroup.FlxTypedGroup;

import gameplay.BoardGame;
import managers.Everything;

class CharacterSelect extends Everything
{
    public static var playerCount:Int = 1;

    public static var character1:String;
    public static var character2:String;
    public static var character3:String;
    public static var character4:String;
    
    var text:FlxText;
    var numText:FlxText;

    var buttons:FlxTypedGroup<FlxSprite>;
    var buttonNames:Array<String>;

    var num:Int = 1;
    // var selected:Int = 0;

    var playerAmount:Bool = true;
    var charSelection:Bool = false;

    override function create()
    {
        text = new FlxText(0, 50, 'How many players?', 40);
        text.screenCenter(X);
        add(text);

        numText = new FlxText('', 32);
        numText.screenCenter();
        add(numText);

        buttons = new FlxTypedGroup<FlxSprite>();
        buttons.visible = false;
        add(buttons);

        buttonNames = ['red', 'blue', 'green', 'yellow'];

        for (num => icon in buttonNames)
            menuButton(icon, 275 * (num + 1), 200);

        super.create();
    }

    override function update(elapsed)
    {
        var mouseHover:Bool = false;

        if (playerAmount)
        {
            numText.text = '$num';

            if (controls.UP)
                num = FlxMath.maxAdd(num, 1, 4, 1);
            if (controls.DOWN)
                num = FlxMath.maxAdd(num, -1, 4, 1);
            if (controls.ENTER)
            {
                numText.visible = false;
                playerCount = num;
                num = 0;

                characterSelect();
            }
        }

        if (charSelection)
        {
            // if (controls.LEFT)
            //     changeSelection(-1);
            // if (controls.RIGHT)
            //     changeSelection(1);

            for (i in 0...buttonNames.length)
                if (FlxG.mouse.overlaps(buttons.members[i]))
                {
                    mouseHover = true;

                    if (FlxG.mouse.justPressed)
                        characterChoice();

                    if (selected != i)
                        buttonHover(i);
                        
                    break;
                }

            if (!mouseHover && selected != -1)
            {
                buttonIdle(selected);

                selected = -1;
            }
        }

        super.update(elapsed);
    }

    function characterSelect()
    {
        playerAmount = false;
        charSelection = true;
        
        buttons.visible = true;
        
        num += 1;
        
        text.text = 'Player $num: Choose your character';
    }

    function characterChoice()
    {
        switch (buttonNames[selected])
        {
            case 'red':
                if (num == 1)
                    character1 = '0xFF0000';
                if (num == 2)
                    character2 = '0xFF0000';
                if (num == 3)
                    character3 = '0xFF0000';
                if (num == 4)
                    character4 = '0xFF0000';
            case 'blue':
                if (num == 1)
                    character1 = '0x0011FF';
                if (num == 2)
                    character2 = '0x0011FF';
                if (num == 3)
                    character3 = '0x0011FF';
                if (num == 4)
                    character4 = '0x0011FF';
            case 'green':
                if (num == 1)
                    character1 = '0x00FF00';
                if (num == 2)
                    character2 = '0x00FF00';
                if (num == 3)
                    character3 = '0x00FF00';
                if (num == 4)
                    character4 = '0x00FF00';
            case 'yellow':
                if (num == 1)
                    character1 = '0xD0FF00';
                if (num == 2)
                    character2 = '0xD0FF00';
                if (num == 3)
                    character3 = '0xD0FF00';
                if (num == 4)
                    character4 = '0xD0FF00';
        }

        trace ('Player $num selected ${buttonNames[selected]}');

        if (num == playerCount)
            FlxG.switchState(BoardGame.new);
        else
            characterSelect();
    }

    function menuButton(name:String, x:Float, y:Float):FlxSprite
    {
        var button:FlxSprite = new FlxSprite(x, y);
        button.loadGraphic('assets/images/characters/$name.png');
        button.alpha = 0.5;
        buttons.add(button);

        return button;
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