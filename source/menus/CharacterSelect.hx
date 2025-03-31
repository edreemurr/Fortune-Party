package menus;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.group.FlxGroup.FlxTypedGroup;

// import assets.BoardSave;
import gameplay.BoardGame;
import managers.Everything;

class CharacterSelect extends Everything
{
    var char1:String;
    var char2:String;
    var char3:String;
    var char4:String;
    var charColors:Array<String>;
    
    var text:FlxText;
    var numText:FlxText;

    var buttons:FlxTypedGroup<FlxSprite>;
    var buttonNames:Array<String>;

    var num:Int = 1;

    var playerAmount:Bool = true;
    var charSelection:Bool = false;

    override function create()
    {
        FlxG.save.data.newGame = true;
        FlxG.save.data.cycle = 1;
        FlxG.save.flush();

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

                playerCount = FlxG.save.data.playerCount = num;
                FlxG.save.flush();

                num = 0;

                characterSelect();
            }
        }
        else if (charSelection)
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
        else
        {
            for (i in 0...buttonNames.length)
                if (FlxG.mouse.overlaps(buttons.members[i]))
                {
                    mouseHover = true;

                    if (FlxG.mouse.justPressed)
                    {
                        FlxG.save.data.board = buttonNames[selected].toLowerCase();
                        FlxG.save.data.charColors = charColors;
                        FlxG.save.flush();
                        trace (FlxG.save.data.charColors);

                        FlxG.switchState(BoardGame.new);
                    }

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
                    char1 = '0xFF0000';
                if (num == 2)
                    char2 = '0xFF0000';
                if (num == 3)
                    char3 = '0xFF0000';
                if (num == 4)
                    char4 = '0xFF0000';
            case 'blue':
                if (num == 1)
                    char1 = '0x0011FF';
                if (num == 2)
                    char2 = '0x0011FF';
                if (num == 3)
                    char3 = '0x0011FF';
                if (num == 4)
                    char4 = '0x0011FF';
            case 'green':
                if (num == 1)
                    char1 = '0x00FF00';
                if (num == 2)
                    char2 = '0x00FF00';
                if (num == 3)
                    char3 = '0x00FF00';
                if (num == 4)
                    char4 = '0x00FF00';
            case 'yellow':
                if (num == 1)
                    char1 = '0xD0FF00';
                if (num == 2)
                    char2 = '0xD0FF00';
                if (num == 3)
                    char3 = '0xD0FF00';
                if (num == 4)
                    char4 = '0xD0FF00';
        }

        charColors = [char1, char2, char3, char4];

        if (num == playerCount)
        {
            charSelection = false;

            boardSelect();
        }
        else
            characterSelect();
    }

    function boardSelect()
    {
        buttons.killMembers();

        buttonNames = ['Demo', 'Kingdom'];

        text.text = 'Choose a board';

        for (num => name in buttonNames)
            menuButton(name.toLowerCase(), 275 * (num + 1), 200);
    }

    function menuButton(name:String, x:Float, y:Float):FlxSprite
    {
        var button:FlxSprite = new FlxSprite(x, y);
        button.loadGraphic('assets/images/buttons/$name.png');
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