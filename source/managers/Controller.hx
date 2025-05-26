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

    public var up:FlxActionDigital;
    public var down:FlxActionDigital;
    public var left:FlxActionDigital;
    public var right:FlxActionDigital;
    
    public var buttonA:FlxActionDigital;
    public var buttonB:FlxActionDigital;
    public var buttonX:FlxActionDigital;
    public var buttonY:FlxActionDigital;

    public var start:FlxActionDigital;
    public var select:FlxActionDigital;
    
    public var triggerL:FlxActionDigital;
    public var triggerR:FlxActionDigital;

    public var shoulderL:FlxActionDigital;
    public var shoulderR:FlxActionDigital;

    public function new(player:Int)
    {
        inputs = FlxG.inputs.addInput(new FlxActionManager());

        up = new FlxActionDigital();
        down = new FlxActionDigital();
        left = new FlxActionDigital();
        right = new FlxActionDigital();

        buttonA = new FlxActionDigital();
        buttonB = new FlxActionDigital();
        buttonX = new FlxActionDigital();
        buttonY = new FlxActionDigital();

        start = new FlxActionDigital();
        select = new FlxActionDigital();

        triggerL = new FlxActionDigital();
        triggerR = new FlxActionDigital();

        shoulderL = new FlxActionDigital();
        shoulderR = new FlxActionDigital();

        buttons = new FlxActionSet('buttons', [buttonA, buttonB, buttonX, buttonY, start, select, triggerL, triggerR, shoulderL, shoulderR]);
        directions = new FlxActionSet('directions', [up, down, left, right]);

        inputs.addActions([up, down, left, right, buttonA, buttonB, buttonX, buttonY, start, select, triggerL, triggerR, shoulderL, shoulderR]);

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

        buttonA.addKey(SPACE, JUST_PRESSED);
        buttonB.addKey(ESCAPE, JUST_PRESSED);
        buttonX.addKey(X, JUST_PRESSED);
        buttonY.addKey(Z, JUST_PRESSED);
        
        buttonA.addGamepad(B, JUST_PRESSED);
        buttonB.addGamepad(A, JUST_PRESSED);
        buttonX.addGamepad(Y, JUST_PRESSED);
        buttonY.addGamepad(X, JUST_PRESSED);

        inputs.activateSet(inputs.getSetIndex('buttons'), GAMEPAD, player);
        inputs.activateSet(inputs.getSetIndex('joystick'), GAMEPAD, player);
    }
}