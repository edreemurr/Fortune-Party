package assets;

import flixel.FlxSprite;
import flixel.tweens.FlxTween;
import flixel.input.mouse.FlxMouseEvent;

import gameplay.minigames.Garbage;

import managers.CardGame;
import managers.Everything;

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
    var everything:Everything;

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
            y = 200;
        
        if (discarded)
        {
            x = 1150;
            y = 0;
        }

        super.update(elapsed);
    }

    public function select(_)
        FlxTween.tween(scale, {x: 0}, 0.15, {onComplete: function(tween:FlxTween)
        {
            animation.frameIndex = card;

            FlxTween.tween(scale, {x: 1}, 0.15);

            drawn = true;
        }});

    function hover(_)
        alpha = 0.5;

    function idle(_)
        alpha = 1;
}