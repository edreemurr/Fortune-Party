package assets;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Character extends FlxSprite
{
    public function new(color:String)
    {
        super();

        makeGraphic(16, 16, FlxColor.fromString(color));

        offset.x = offset.y = 8;

        updateHitbox();
    }
}