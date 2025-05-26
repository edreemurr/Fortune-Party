package managers;

import flixel.FlxG;
import flixel.input.actions.FlxActionSet;
import flixel.input.actions.FlxActionManager;
import flixel.input.actions.FlxAction.FlxActionDigital;

class Controller
{
    public var inputs:FlxActionManager;

    public var buttons:FlxActionSet;
    public var directions:FlxActionSet;

    public var interact:FlxActionDigital;
    public var withdraw:FlxActionDigital;

    public var up:FlxActionDigital;
    public var down:FlxActionDigital;
    public var left:FlxActionDigital;
    public var right:FlxActionDigital;

    public function new(player:Int)
    {
        inputs = FlxG.inputs.addInput(new FlxActionManager());

        up = new FlxActionDigital();
        down = new FlxActionDigital();
        left = new FlxActionDigital();
        right = new FlxActionDigital();

        interact = new FlxActionDigital();
        withdraw = new FlxActionDigital();

        buttons = new FlxActionSet('buttons', [interact, withdraw]);
        directions = new FlxActionSet('directions', [up, down, left, right]);

        inputs.addActions([up, down, left, right, interact, withdraw]);

        up.addKey(UP, PRESSED);
        down.addKey(DOWN, PRESSED);
        left.addKey(LEFT, PRESSED);
        right.addKey(RIGHT, PRESSED);

        up.addKey(W, PRESSED);
        down.addKey(S, PRESSED);
        left.addKey(A, PRESSED);
        right.addKey(D, PRESSED);

        up.addGamepad(DPAD_UP, PRESSED);
        down.addGamepad(DPAD_DOWN, PRESSED);
        left.addGamepad(DPAD_LEFT, PRESSED);
        right.addGamepad(DPAD_RIGHT, PRESSED);

        up.addGamepad(LEFT_STICK_DIGITAL_UP, PRESSED);
        down.addGamepad(LEFT_STICK_DIGITAL_DOWN, PRESSED);
        left.addGamepad(LEFT_STICK_DIGITAL_LEFT, PRESSED);
        right.addGamepad(LEFT_STICK_DIGITAL_RIGHT, PRESSED);

        interact.addKey(SPACE, JUST_PRESSED);
        interact.addGamepad(B, JUST_PRESSED);
        
        withdraw.addKey(ESCAPE, JUST_PRESSED);
        withdraw.addGamepad(A, JUST_PRESSED);

        inputs.activateSet(inputs.getSetIndex('buttons'), GAMEPAD, player);
        inputs.activateSet(inputs.getSetIndex('joystick'), GAMEPAD, player);
    }
}