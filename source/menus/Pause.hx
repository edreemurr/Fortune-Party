package menus;

import flixel.FlxG;
import flixel.FlxSubState;
import flixel.ui.FlxButton;
import flixel.group.FlxGroup.FlxTypedGroup;

import openfl.system.System;

class Pause extends FlxSubState
{
    var buttons:FlxTypedGroup<FlxButton>;
    var buttonNames:Array<String>;

    override function create()
    {
        FlxG.mouse.visible = true;

        buttons = new FlxTypedGroup<FlxButton>();
        add(buttons);

        buttonNames = ['Resume', 'Restart', 'Title', 'Exit'];

        for (i in 0...buttonNames.length)
        {
            var button:FlxButton = new FlxButton(0, 200 + (i * 100), buttonNames[i], () -> button(buttonNames[i]));
            button.screenCenter(X);
            button.setGraphicSize(200, 50);
            button.updateHitbox();
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
            case 'Resume':
                close();

            case 'Restart':
                FlxG.resetState();

            case 'Title':
                FlxG.switchState(Title.new);

            case 'Exit':
                System.exit(0);
        }
}