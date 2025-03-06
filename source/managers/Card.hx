package managers;

import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEvent;

class Card extends FlxSprite
{
    var cardIndex:Int;

    public function new(x:Float, y:Float, index:Int)
    {
        super(x, y);

        this.cardIndex = index;

        loadGraphic('assets/images/cards/poker.png', true, 125, 181/* .5 */);
        
        animation.frameIndex = cardIndex;
        
        FlxMouseEvent.add(this, pressed, null, hover, idle);
    }

/*     override public function destroy()
    {
        FlxMouseEvent.remove(this);

        super.destroy();
    }
 */
    function pressed(_)
        FlxTween.tween(scale, {x: 0}, 0.5);

    function hover(_)
        scale.x = scale.y = 1.2;

    function idle(_)
        scale.x = scale.y = 1;

}