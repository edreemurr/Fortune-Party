package assets;

import flixel.FlxG;
import flixel.FlxSprite;

class Character extends FlxSprite
{
    public function new(x:Float = 0, y:Float = 0)
    {
        super(x, y);

        makeGraphic(16, 16, FlxG.random.color());
    }
}