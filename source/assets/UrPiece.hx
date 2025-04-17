package assets;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.tweens.FlxTween;
import flixel.input.mouse.FlxMouseEvent;

import gameplay.minigames.Ur;

class UrPiece extends FlxSprite
{
    public var location:Int = -1;

    var spaces:Array<Array<Dynamic>>;

    public var again:Bool = false;
    public var usable:Bool = false;
    public var killed:Bool = false;

    var endGoal:Bool = false;

    var ur:Ur;

    public function new(type:String, x:Float, y:Float)
    {
        super(x, y);

        if (type == 'light')
            spaces = [[FlxPoint.get(595, 466), false], [FlxPoint.get(441, 461), false], [FlxPoint.get(286, 462), false], [FlxPoint.get(122, 452), true], [FlxPoint.get(137, 331), false], [FlxPoint.get(293, 336), false], [FlxPoint.get(443, 344), false], [FlxPoint.get(587, 342), true], [FlxPoint.get(737, 348), false], [FlxPoint.get(874, 350), false], [FlxPoint.get(1003, 345), false], [FlxPoint.get(1139, 347), false], [FlxPoint.get(1184, 461), false], [FlxPoint.get(1048, 461), true], [FlxPoint.get(719, 535), false]];
        else if (type == 'dark')
            spaces = [[FlxPoint.get(586, 241), false], [FlxPoint.get(446, 234), false], [FlxPoint.get(303, 226), false], [FlxPoint.get(161, 228), true], [FlxPoint.get(137, 331), false], [FlxPoint.get(293, 336), false], [FlxPoint.get(443, 344), false], [FlxPoint.get(587, 342), true], [FlxPoint.get(737, 348), false], [FlxPoint.get(874, 350), false], [FlxPoint.get(1003, 345), false], [FlxPoint.get(1139, 347), false], [FlxPoint.get(1112, 246), false], [FlxPoint.get(982, 228), true], [FlxPoint.get(698, 224), false]];

        loadGraphic('assets/images/ur/$type.png');

        offset.x = width/2;
        offset.y = height/2;
    }

    override function update(elapsed:Float)
    {
        if (usable && !endGoal)
        {
            alpha = 0.5;

            FlxMouseEvent.add(this, pressed, null, hover, idle);
        }
        else
        {
            alpha = 1;

            FlxMouseEvent.remove(this);
        }

        if (Ur.roll == 0)
            Ur.rolled = false;

        if (killed)
        {
            FlxTween.tween(this, {x: 0, y: FlxG.height}, 1, {onComplete: function (tween:FlxTween)
            {
                killed = false;

                location = -1;
            }});
        }

        super.update(elapsed);
    }

    function pressed(_)
        movePiece(Ur.roll);

    function hover(_)
        alpha = 1;

    function idle(_)
        alpha = 0.5;

    function movePiece(num:Int)
    {
        Ur.moving = true;

        var newX:Float = spaces[FlxMath.maxAdd(location, num, spaces.length - 1, -1)][0].x;
        var newY:Float = spaces[FlxMath.maxAdd(location, num, spaces.length - 1, -1)][0].y;

        FlxTween.tween(this, {x: newX, y: newY}, 0.5, {onComplete: function(tween:FlxTween)
        {
            Ur.moving = false;
            Ur.rolled = false;

            location += num;

            if (location == spaces.length - 1)
                endGoal = true;

            again = spaces[location][1];

            Ur.turnEnd = true;
        }});
    }
}