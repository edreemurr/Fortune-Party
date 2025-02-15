package managers;

import flixel.FlxG;
import flixel.input.gamepad.FlxGamepadInputID;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxSave;

@:structInit class GameSettings
{
    public var antialiasing:Bool = true;
    public var allPause:Bool = false;
}

class SaveData
{
    public static var save:GameSettings = {};
    public static var defaultSave:GameSettings = {};

    public static var keyboardDefault:Map<String, Array<FlxKey>> = null;
    public static var gamepadDefault:Map<String, Array<FlxGamepadInputID>> = null;

    public static  var keyboardButtons:Map<String, Array<FlxKey>> = [
        'up' => [W, UP],
        'down' => [S, DOWN],
        'left' => [A, LEFT],
        'right' => [D, RIGHT],

        'enter' => [SPACE, ENTER],
        'back' => [BACKSPACE],
        'pause' => [ESCAPE]
    ];

    public static var gamepadButtons:Map<String, Array<FlxGamepadInputID>> = [
        'up' => [DPAD_UP],
        'down' => [DPAD_DOWN],
        'left' => [DPAD_LEFT],
        'right' => [DPAD_RIGHT],

        'enter' => [A],
        'back' => [B],
        'pause' => [START]
    ];

    public static function resetButtons(controller:Null<Bool> = null)
    {
        if (controller != true)
            for (button in keyboardButtons.keys())
                if (keyboardDefault.exists(button))
                    keyboardButtons.set(button, keyboardDefault.get(button).copy());

        if (controller != false)
            for (button in gamepadButtons.keys())
                if (gamepadDefault.exists(button))
                    gamepadButtons.set(button, gamepadDefault.get(button).copy());
    }

    public static function loadDefaultButtons()
    {
        keyboardDefault = keyboardButtons.copy();
        gamepadDefault = gamepadButtons.copy();
    }

    public static function saveSettings()
    {
        for (button in Reflect.fields(save))
            Reflect.setField(FlxG.save.data, button, Reflect.field(save, button));

        FlxG.save.flush();

        var saveControls:FlxSave = new FlxSave();
        saveControls.bind('controls', FileNans.locateSave());
        saveControls.data.keyboard = keyboardButtons;
        saveControls.data.gamepad = gamepadButtons;
        saveControls.flush();
    }

    public static function loadSettings()
    {
        for (button in Reflect.fields(save))
            if (Reflect.hasField(FlxG.save.data, button))
                Reflect.setField(save, button, Reflect.field(FlxG.save.data, button));

        if (FlxG.save.data.volume != null)
            FlxG.sound.volume = FlxG.save.data.volume;
        if (FlxG.save.data.muted != null)
            FlxG.sound.muted = FlxG.save.data.muted;

        var saveData:FlxSave = new FlxSave();
        saveData.bind('controls', FileNans.locateSave());

        if (saveData != null)
        {
            if (FlxG.save.data.keyboard != null)
            {
                var controls:Map<String, Array<FlxKey>> = FlxG.save.data.keyboard;

                for (input => button in controls)
                    if (keyboardButtons.exists(input))
                        keyboardButtons.set(input, button);
            }

            if (FlxG.save.data.gamepad != null)
            {
                var controls:Map<String, Array<FlxGamepadInputID>> = FlxG.save.data.gamepad;

                for (input => button in controls)
                    if (gamepadButtons.exists(input))
                        gamepadButtons.set(input, button);
            }
        }
    }
}