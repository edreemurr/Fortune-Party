package assets;

import flixel.FlxSprite;
import flixel.tweens.FlxTween;
import flixel.input.mouse.FlxMouseEvent;

class Card extends FlxSprite
{
    var xCut:Int;
    var yCut:Int;

    public var newX:Float;
    public var newY:Float;

    public var card:Int;
    public var cardIndex:Int;

    public var usable:Bool;
    public var flipped:Bool;
    public var selected:Bool;
    
    public var drawn:Bool = false;
    public var accepted:Bool = false;
    public var discarded:Bool = false;
    public var interactable:Bool = false;

    public function new(type:String, x:Float, y:Float, index:Int, ?card:Int)
    {
        super(x, y);

        if (card == null)
            this.card = index;
        else
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
    }
    
    override function update(elapsed:Float)
    {
        if (interactable)
            FlxMouseEvent.add(this, select, null, hover, idle);
        else
        {
            alpha = 1;

            FlxMouseEvent.remove(this);
        }

        if (usable)
            y = 200;
        
        if (discarded)
        {
            x = 1150;
            y = 0;

            alpha = 1;
        }

        if (accepted)
        {
            x = newX;
            y = newY;

            alpha = 1;
            
            usable = false;
            accepted = false;
            selected = false;
        }

        super.update(elapsed);
    }

    public function select(_)
    {
        if (!flipped)
            FlxTween.tween(scale, {x: 0}, 0.15, {onComplete: function(tween:FlxTween)
            {
                animation.frameIndex = card;

                FlxTween.tween(scale, {x: 1}, 0.15);

                drawn = true;
                flipped = true;
            }});

        selected = true;
    }

    function hover(_)
        alpha = 1;

    function idle(_)
        alpha = 0.5;
}