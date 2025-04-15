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
    var killed:Bool = false;
    var endGoal:Bool = false;

    public function new(type:String, x:Float, y:Float)
    {
        super(x, y);

        this.type = type;

        if (type == 'light')
            spaces = [[FlxPoint.get(595, 466), false], [FlxPoint.get(441, 461), false], [FlxPoint.get(286, 462), false], [FlxPoint.get(122, 452), true], [FlxPoint.get(137, 331), false], [FlxPoint.get(293, 336), false], [FlxPoint.get(443, 344), false], [FlxPoint.get(587, 342), true], [FlxPoint.get(737, 348), false], [FlxPoint.get(874, 350), false], [FlxPoint.get(1003, 345), false], [FlxPoint.get(1139, 347), false], [FlxPoint.get(1184, 461), false], [FlxPoint.get(1048, 461), true], [FlxPoint.get(719, 535), false]];
        else if (type == 'dark')
            spaces = [[FlxPoint.get(586, 241), false], [FlxPoint.get(446, 234), false], [FlxPoint.get(303, 226), false], [FlxPoint.get(161, 228), true], [FlxPoint.get(137, 331), false], [FlxPoint.get(293, 336), false], [FlxPoint.get(443, 344), false], [FlxPoint.get(587, 342), true], [FlxPoint.get(737, 348), false], [FlxPoint.get(874, 350), false], [FlxPoint.get(1003, 345), false], [FlxPoint.get(1139, 347), false], [FlxPoint.get(1112, 246), false], [FlxPoint.get(982, 228), true], [FlxPoint.get(698, 224), false]];

        loadGraphic('assets/images/ur/$type.png');

        offset.x = width/2;
        offset.y = height/2;

        FlxMouseEvent.add(this, pressed, null, hover, idle);
    }

    override function update(elapsed:Float)
    {
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
        if (Ur.rolled && !Ur.moving && !endGoal)
            movePiece(Ur.roll);

    function hover(_)
        if (Ur.rolled && !Ur.moving && !endGoal)
            alpha = 0.5;

    function idle(_)
        alpha = 1;

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
        }});
    }
}