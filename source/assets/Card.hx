package assets;

import flixel.FlxSprite;
import flixel.tweens.FlxTween;
import flixel.input.mouse.FlxMouseEvent;

import managers.CardGame;

class Card extends FlxSprite
{
    var xCut:Int;
    var yCut:Int;
    var card:Int;
    var cardIndex:Int;

    public var drawn:Bool = false;

    public function new(type:String, x:Float, y:Float, index:Int, ?card:Int)
    {
        super(x, y);

        this.card = card;
        this.cardIndex = index;

        switch (type)
        {
            case 'poker':
                xCut = 125;
                yCut = 181/* .5 */;
            
            case 'uno':
                xCut = 86;
                yCut = 86;
        }

        loadGraphic('assets/images/cards/$type.png', true, xCut, yCut);
        
        animation.frameIndex = cardIndex;
        
        FlxMouseEvent.add(this, flip, null, hover, idle);
    }

    override function update(elapsed:Float)
    {
        if (drawn)
        {
            trace ('Hello');
            x = 300;
            y = 100;
        }

        super.update(elapsed);
    }

    override public function destroy()
    {
        FlxMouseEvent.remove(this);

        super.destroy();
    }

    function flip(_)
    {
        FlxTween.tween(scale, {x: 0}, 0.1, {onComplete: function(tween:FlxTween)
        {
            if (animation.frameIndex == CardGame.cardCount)
                animation.frameIndex = card;
            else
                animation.frameIndex = cardIndex;

            FlxTween.tween(scale, {x: 1}, 0.25);
        }});
    }

    function pressed(_)
        FlxTween.tween(scale, {x: 0}, 0.5);

    function hover(_)
    {
        scale.x = scale.y = 1.2;

        updateHitbox();
    }

    function idle(_)
    {
        scale.x = scale.y = 1;

        updateHitbox();
    }

}