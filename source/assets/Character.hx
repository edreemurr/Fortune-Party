package assets;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Character extends FlxSprite
{
    public function new(color:String)
    {
        super();

        makeGraphic(50, 50, FlxColor.fromString(color));

        offset.x = offset.y = 25;

        updateHitbox();
    }
}