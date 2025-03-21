package assets;

import flixel.FlxSprite;
import flixel.tweens.FlxTween;
import flixel.input.mouse.FlxMouseEvent;

import managers.CardGame;
import gameplay.minigames.Garbage;

class Card extends FlxSprite
{
    var xCut:Int;
    var yCut:Int;

    public var card:Int;
    public var cardIndex:Int;

    public var usable:Bool;
    public var discarded:Bool;

    public var drawn:Bool = false;
    public var interactable:Bool = false;

    var game:CardGame;
    var garbage:Garbage;

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
    }
    
    override function update(elapsed:Float)
    {
        if (interactable)
            FlxMouseEvent.add(this, select, null, hover, idle);

        if (usable)
        {
            x = 50;
            y = 300;
        }

        super.update(elapsed);
    }

    function select(_)
        FlxTween.tween(scale, {x: 0}, 0.15, {onComplete: function(tween:FlxTween)
        {
            animation.frameIndex = card;

            FlxTween.tween(scale, {x: 1}, 0.15);

            drawn = true;
        }});

    function hover(_)
    {
        scale.x = scale.y = 1.1;

        updateHitbox();
    }

    function idle(_)
    {
        scale.x = scale.y = 1;

        updateHitbox();
    }

}