package assets;

import flixel.FlxSprite;
import flixel.tweens.FlxTween;
import flixel.input.mouse.FlxMouseEvent;

import gameplay.Ur;

class UrPiece extends FlxSprite
{
    var spaces:Array<Array<Dynamic>>;
    var location:Int = -1;

    public function new(type:String, x:Float, y:Float)
    {
        super(x, y);

        switch (type)
        {
            case 'light':
                spaces = [[595, 466, false], [441, 461, false], [286, 462, false], [122, 452, true], [137, 331, false], [293, 336, false], [443, 344, false], [587, 342, true], [737, 348, false], [874, 350, false], [1003, 345, false], [1139, 347, false], [1184, 461, false], [1048, 461, true], [719, 535, false]];

            case 'dark':
                spaces = [[586, 241, false], [446, 234, false], [303, 226, false], [161, 228, true], [137, 331, false], [293, 336, false], [443, 344, false], [587, 342, true], [737, 348, false], [874, 350, false], [1003, 345, false], [1139, 347, false], [1112, 246, false], [982, 228, true], [698, 224, false]];
        }

        loadGraphic('assets/images/ur/$type.png');

        offset.x = width/2;
        offset.y = width/2;

        FlxMouseEvent.add(this, pressed, null, hover, idle);
    }

    function pressed(_)
        if (Ur.rolled && !Ur.moving)
                movePiece(Ur.roll);

    function hover(_)
        if (Ur.rolled && !Ur.moving)
            alpha = 0.5;

    function idle(_)
        alpha = 1;

    function movePiece(num:Int)
        if (num > 0)
        {
            Ur.moving = true;

            var x:Int = spaces[location + num][0];
            var y:Int = spaces[location + num][1];

            FlxTween.tween(this, {x: x, y: y}, 0.5, {onComplete: function(tween:FlxTween)
            {
                Ur.moving = false;
                Ur.rolled = false;
                Ur.turn += 1;
            }});
        }
        else
        {
            Ur.rolled = false;
            Ur.turn += 1;
        }
}