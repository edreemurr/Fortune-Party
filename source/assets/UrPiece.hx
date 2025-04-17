package assets;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.tweens.FlxTween;
import flixel.input.mouse.FlxMouseEvent;

import gameplay.minigames.Ur;

class UrPiece extends FlxSprite
{
    public var location:Int = -1;

    var type:String;

    var spaces:Array<Array<Dynamic>>;

    public var again:Bool = false;
    public var usable:Bool = false;

    var killed:Bool = false;
    var endGoal:Bool = false;

    var ur:Ur;

    public function new(type:String, x:Float, y:Float)
    {
        super(x, y);

        this.type = type;

        if (type == 'light')
            spaces = [[FlxPoint.get(595, 466), true], [FlxPoint.get(441, 461), true], [FlxPoint.get(286, 462), true], [FlxPoint.get(122, 452), false], [FlxPoint.get(137, 331), true], [FlxPoint.get(293, 336), true], [FlxPoint.get(443, 344), true], [FlxPoint.get(587, 342), false], [FlxPoint.get(737, 348), true], [FlxPoint.get(874, 350), true], [FlxPoint.get(1003, 345), true], [FlxPoint.get(1139, 347), true], [FlxPoint.get(1184, 461), true], [FlxPoint.get(1048, 461), false], [FlxPoint.get(719, 535), true]];
        else if (type == 'dark')
            spaces = [[FlxPoint.get(586, 241), true], [FlxPoint.get(446, 234), true], [FlxPoint.get(303, 226), true], [FlxPoint.get(161, 228), false], [FlxPoint.get(137, 331), true], [FlxPoint.get(293, 336), true], [FlxPoint.get(443, 344), true], [FlxPoint.get(587, 342), false], [FlxPoint.get(737, 348), true], [FlxPoint.get(874, 350), true], [FlxPoint.get(1003, 345), true], [FlxPoint.get(1139, 347), true], [FlxPoint.get(1112, 246), true], [FlxPoint.get(982, 228), false], [FlxPoint.get(698, 224), true]];

        loadGraphic('assets/images/ur/$type.png');

        offset.x = width/2;
        offset.y = height/2;
    }

    override function update(elapsed:Float)
    {
        if (usable)
            FlxMouseEvent.add(this, pressed, null, hover, idle);
        else
        {
            alpha = 1;

            FlxMouseEvent.remove(this);
        }

        if (Ur.roll == 0)
            Ur.rolled = false;

        if (killed)
        {
            x = 0;
            y = FlxG.height;
        }

        super.update(elapsed);
    }

    function pressed(_)
        // if (Ur.rolled && !Ur.moving && !endGoal)
            movePiece(Ur.roll);

    function hover(_)
        // if (Ur.rolled && !Ur.moving && !endGoal)
            alpha = 1;

    function idle(_)
        alpha = 0.5;

    function movePiece(num:Int)
    {
        Ur.moving = true;

        var newX:Float = spaces[location + num][0].x;
        var newY:Float = spaces[location + num][0].y;

        if (location + num >= spaces.length)
        {
            newX = spaces[14][0].x;
            newY = spaces[14][0].y;
        }

        FlxTween.tween(this, {x: newX, y: newY}, 0.5, {onComplete: function(tween:FlxTween)
        {
            Ur.moving = false;
            Ur.rolled = false;

            location += num;

            again = spaces[location][2];

            Ur.turnEnd = true;
        }});
    }
}