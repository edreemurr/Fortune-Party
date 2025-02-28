package gameplay;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.group.FlxGroup.FlxTypedGroup;

import managers.Everything;

class CharacterSelect extends Everything
{
    public static var players:Int = 0;

    public static var character1:FlxColor;
    public static var character2:FlxColor;
    public static var character3:FlxColor;
    public static var character4:FlxColor;
    
    var text:FlxText = null;
    var numText:FlxText = null;

    var buttons:FlxTypedGroup<FlxSprite>;
    var buttonNames:Array<String>;

    var num:Int = 1;

    var selected:Int = 0;

    override function create()
    {
        text = new FlxText(0, 50, 'How many players?', 40);
        text.screenCenter(X);
        add(text);

        numText = new FlxText('1');
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
        if (controls.UP)
            numText.text = '${FlxMath.maxAdd(num, 1, 4, 1)}';
        if (controls.DOWN)
            numText.text = '${FlxMath.maxAdd(num, -1, 4, 1)}';
        if (controls.ENTER)
        {
            numText.visible = false;
            players = num;
            num = 0;

            characterSelect();
        }

        super.update(elapsed);
    }

    function characterSelect()
    {
        num += 1;
        
        buttons.visible = true;
        
        text.text = 'Player $num: Choose your character';

        for (i in 0...buttonNames.length)
            if (FlxG.mouse.overlaps(buttons.members[i]))
                if (selected != i)
                {
                    buttonHover(i);
                    
                    break;
                }

                if (FlxG.mouse.justPressed)
                    characterChoice();
            else
                selected = -1;
    }

    function characterChoice()
    {
        switch (num)
        {
            case 1: character1 = FlxColor.fromString(buttonNames[selected]);
            case 2: character2 = FlxColor.fromString(buttonNames[selected]);
            case 3: character3 = FlxColor.fromString(buttonNames[selected]);
            case 4: character4 = FlxColor.fromString(buttonNames[selected]);
        }

        if (num > players)
            FlxG.switchState(() -> new PlayState());
        else
            characterSelect();
    }

    function menuButton(name: String, x:Float, y:Float):FlxSprite
    {
        var button:FlxSprite = new FlxSprite(x, y);
        button.loadGraphic('assets/images/$name.png');
        buttons.add(button);
        button.updateHitbox();

        return button;
    }

    function buttonHover(selection:Int)
    {
        if (selected != -1)
            buttons.members[selected].alpha = 1;

        selected = selection;

        buttons.members[selected].alpha = 0.5;
    }
}