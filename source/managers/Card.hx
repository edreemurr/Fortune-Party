package managers;

import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEvent;

class Card extends FlxSprite
{
    var cardIndex:Int;

    var xCut:Int;
    var yCut:Int;

    public function new(type:String = 'uno', x:Float, y:Float, index:Int)
    {
        super(x, y);

        this.cardIndex = index;

        switch (type)
        {
            case 'poker':
                xCut = 125;
                yCut = 181;
            
            case 'uno':
                xCut = 86;
                yCut = 86;
        }

        loadGraphic('assets/images/cards/$type.png', true, xCut, yCut/* .5 */);
        
        animation.frameIndex = cardIndex;
        
        FlxMouseEvent.add(this, pressed, null, hover, idle);
    }

    override public function destroy()
    {
        FlxMouseEvent.remove(this);

        super.destroy();
    }

    function pressed(_)
        FlxTween.tween(scale, {x: 0}, 0.5);

    function hover(_)
        scale.x = scale.y = 1.2;

    function idle(_)
        scale.x = scale.y = 1;

}