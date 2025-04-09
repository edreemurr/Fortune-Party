package assets;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class Dice extends FlxSprite
{
    public var spinning:Bool;

    public var index:Int;

    var sprite:String = 'assets/images/dice';

    public function new(x:Float, y:Float, spinning:Bool = true)
    {
        super(x, y);

        this.spinning = spinning;

        frames = FlxAtlasFrames.fromSparrow('$sprite/dice.png', '$sprite/dice.xml');

        animation.addByPrefix('one', 'dice one');
        animation.addByPrefix('two', 'dice two');
        animation.addByPrefix('three', 'dice three');
        animation.addByPrefix('four', 'dice four');
        animation.addByPrefix('five', 'dice five');
        animation.addByPrefix('six', 'dice six');
    }

    override function update(elapsed:Float)
    {
        if (spinning)
            animation.randomFrame();

        super.update(elapsed);
    }
}