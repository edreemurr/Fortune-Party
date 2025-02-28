package assets;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Character extends FlxSprite
{
    public function new(color:FlxColor)
    {
        super();

        makeGraphic(16, 16, color);
    }
}