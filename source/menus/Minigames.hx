package menus;

import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.group.FlxGroup.FlxTypedGroup;

import gameplay.minigames.*;
import managers.Everything;

class Minigames extends Everything
{
    var buttons:FlxTypedGroup<FlxButton>;
    var buttonNames:Array<String>;

    override function create()
    {
        FlxG.mouse.visible = true;

        buttons = new FlxTypedGroup<FlxButton>();
        add(buttons);

        buttonNames = ['Hue Won\'t', 'Garbage', 'Ur'];

        for (i in 0...buttonNames.length)
        {
            var button:FlxButton = new FlxButton(0, 200 + (i * 50), buttonNames[i], () -> button(buttonNames[i]));
            button.screenCenter(X);
            button.setGraphicSize(200, 50);
            button.updateHitbox();
            button.label.setFormat(25);
            button.label.fieldWidth = button.width;
            button.label.alignment = CENTER;
            button.label.offset.y -= 5;
            buttons.add(button);
        }

        super.create();
    }

    function button(state:String)
        switch (state)
        {
            case 'Hue Won\'t': FlxG.switchState(HueWont.new);
            case 'Garbage': FlxG.switchState(Garbage.new);
            case 'Ur': FlxG.switchState(Ur.new);
        }
}