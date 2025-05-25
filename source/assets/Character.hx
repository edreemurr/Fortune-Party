package assets;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.graphics.frames.FlxAtlasFrames;

import gameplay.BoardGame;
import menus.CharacterSelect;

class Character extends FlxSprite
{    
    public var colorChoice:FlxColor;
    
    public var player:Int;
    
    public var land:Array<String>;
    public var inventory:Array<String>;

    public var cards:FlxTypedGroup<Card>;

    var sprite:String = 'assets/images/characters';
    
    var game:BoardGame;

    public function new(player:Int, ?items:Array<String>)
    {
        super();

        this.player = player;
        this.inventory = items;
        this.colorChoice = FlxColor.fromString(CharacterSelect.charColors[player]);

        frames = FlxAtlasFrames.fromSparrow('$sprite/Character.png', '$sprite/Character.xml');
        
        animation.addByPrefix('idle', 'character idle');
        animation.addByPrefix('walk', 'character walk');
        animation.addByPrefix('think', 'character think');

        color = colorChoice;
//first player gets no item? how to save & load items?
        inventory = [];
    }
}