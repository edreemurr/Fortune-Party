package managers;

import flixel.FlxG;
import flixel.input.gamepad.FlxGamepadButton;
import flixel.input.gamepad.FlxGamepadInputID;
import flixel.input.gamepad.mappings.FlxGamepadMapping;
import flixel.input.keyboard.FlxKey;
import managers.Settings;

class Controls
{
    public function new()
    {
        keyboard = SaveData.keyboardButtons;
        gamepad = SaveData.gamepadButtons;
    }

    public static var instance:Controls;

    public var keyboard:Map<String, Array<FlxKey>>;
    public var gamepad:Map<String, Array<FlxGamepadInputID>>;

    // Pressed buttons (directions)
	public var UP_P(get, never):Bool;
	public var DOWN_P(get, never):Bool;
	public var LEFT_P(get, never):Bool;
	public var RIGHT_P(get, never):Bool;
	private function get_UP_P() return justPressed('up');
	private function get_DOWN_P() return justPressed('down');
	private function get_LEFT_P() return justPressed('left');
	private function get_RIGHT_P() return justPressed('right');

	// Held buttons (directions)
	public var UP(get, never):Bool;
	public var DOWN(get, never):Bool;
	public var LEFT(get, never):Bool;
	public var RIGHT(get, never):Bool;
	private function get_UP() return justPressed('up');
	private function get_DOWN() return justPressed('down');
	private function get_LEFT() return justPressed('left');
	private function get_RIGHT() return justPressed('right');

	// Released buttons (directions)
	public var UP_R(get, never):Bool;
	public var DOWN_R(get, never):Bool;
	public var LEFT_R(get, never):Bool;
	public var RIGHT_R(get, never):Bool;
	private function get_UP_R() return released('up');
	private function get_DOWN_R() return released('down');
	private function get_LEFT_R() return released('left');
	private function get_RIGHT_R() return released('right');


	// Pressed buttons (others)
	public var ENTER(get, never):Bool;
	public var BACK(get, never):Bool;
	public var PAUSE(get, never):Bool;
	private function get_ENTER() return justPressed('enter');
	private function get_BACK() return justPressed('back');
	private function get_PAUSE() return justPressed('pause');

    public function justPressed(button:String)
        return FlxG.keys.anyJustPressed(keyboard[button]) == true || gamepadJustPressed(gamepad[button]) == true;

    public function pressed(button:String)
        return FlxG.keys.anyJustPressed(keyboard[button]) == true || gamepadPressed(gamepad[button]) == true;

    public function released(button:String)
        return FlxG.keys.anyJustReleased(keyboard[button]) == true || gamepadReleased(gamepad[button]) == true;

    private function gamepadJustPressed(buttons:Array<FlxGamepadInputID>):Bool
    {
        if (buttons != null)
            for (button in buttons)
                if (FlxG.gamepads.anyJustPressed(button) == true)
                    return true;

        return false;
    }

    private function gamepadPressed(buttons:Array<FlxGamepadInputID>):Bool
    {
        if (buttons != null)
            for (button in buttons)
                if (FlxG.gamepads.anyPressed(button) == true)
                    return true;

        return false;
    }

    private function gamepadReleased(buttons:Array<FlxGamepadInputID>):Bool
    {
        if (buttons != null)
            for (button in buttons)
                if (FlxG.gamepads.anyJustReleased(button) == true)
                    return true;

        return false;
    }
}