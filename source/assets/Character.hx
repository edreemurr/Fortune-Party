package assets;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.group.FlxGroup.FlxTypedGroup;

import gameplay.BoardGame;

class Character extends FlxSprite
{
    var game:BoardGame;

    public var colorChoice:FlxColor;

    public var coins:Int;
    public var starPieces:Int;

    public var player:Int;
    public var location:Int;

    public var land:Array<String>;
    public var items:Array<String>;
    public var cards:FlxTypedGroup<Card>;

    public function new(player:Int, x:Float, y:Float)
    {
        super(x, y);

        this.player = player;
        this.colorChoice = FlxColor.fromString(FlxG.save.data.charColors[player]);

        makeGraphic(50, 50, colorChoice);

        offset.x = offset.y = 25;

        updateHitbox();
    }

    public function loadStats()
    {
        if (FlxG.save.data.newGame == true)
        {
            coins = 10;
            starPieces = 0;
            
            land = [];
            location = -1;
        }
        else
        {
            coins = FlxG.save.data.coins[player];
            starPieces = FlxG.save.data.starPieces[player];

            land = FlxG.save.data.lands[player];
            location = FlxG.save.data.locations[player];
        }
    }

    public function updateStat(stat:String, num:Int)
        switch (stat)
        {
            case 'coins': coins += num;
            case 'starPiece': starPieces += num;
            case 'land': land.push(game.curSpace);
        }
}