package assets;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class Dice extends FlxSprite
{
    public var spinning:Bool;

    public var index:Int;

    public var type:String;

    var sprite:String = 'assets/images/dice';

    public function new(x:Float, y:Float, type:String = 'dice', spinning:Bool = true)
    {
        super(x, y);

        this.type = type;
        this.spinning = spinning;

        frames = FlxAtlasFrames.fromSparrow('$sprite/dice.png', '$sprite/dice.xml');

        switch (type)
        {
            case 'low':
                animation.addByPrefix('one', 'dice one');
                animation.addByPrefix('two', 'dice two');
                animation.addByPrefix('three', 'dice three');

            case 'high':
                animation.addByPrefix('four', 'dice four');
                animation.addByPrefix('five', 'dice five');
                animation.addByPrefix('six', 'dice six');

            case 'odd':
                animation.addByPrefix('one', 'dice one');
                animation.addByPrefix('three', 'dice three');
                animation.addByPrefix('five', 'dice five');

            case 'even':
                animation.addByPrefix('two', 'dice two');
                animation.addByPrefix('four', 'dice four');
                animation.addByPrefix('six', 'dice six');

            default:
                animation.addByPrefix('one', 'dice one');
                animation.addByPrefix('two', 'dice two');
                animation.addByPrefix('three', 'dice three');
                animation.addByPrefix('four', 'dice four');
                animation.addByPrefix('five', 'dice five');
                animation.addByPrefix('six', 'dice six');
        }
    }

    override function update(elapsed:Float)
    {
        if (spinning && (type != 'slow' || (type == 'slow' && elapsed == 1.5)))
        {
            animation.randomFrame();

            elapsed = 0;
        }

        super.update(elapsed);
    }
}