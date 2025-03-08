package gameplay;

import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.group.FlxGroup.FlxTypedGroup;

import assets.UrPiece;
import managers.Everything;

class Ur extends Everything
{
    public static var roll:Int;

    public static var turn:String = 'light';

    public static var rolled:Bool = false;
    public static var moving:Bool = false;

    var pieces:FlxTypedGroup<UrPiece>;

    override function create()
    {
        board = new FlxSprite().loadGraphic('assets/images/ur/board.png');
        add(board);

        add(initPieces('light'));
        add(initPieces('dark'));
        
        super.create();
    }

    override function update(elapsed:Float)
    {
        var numText:FlxText = new FlxText(20, 10, '', 40);

        if (controls.ENTER && !moving && !rolled)
        {
            roll = rollDice(0, 4);

            numText.text = '$roll';
            add(numText);

            rolled = true;
        }

        if (moving)
        {
            remove(numText);
            numText.destroy();
        }

        super.update(elapsed);
    }
    
    function initPieces(type:String):FlxTypedGroup<UrPiece>
    {
        var x:Int = 0;
        var y:Int = 0;
        
        pieces = new FlxTypedGroup<UrPiece>();

        if (type == 'light')
        {
            x = 300;
            y = 650;
        }
        else if (type == 'dark')
        {
            x = 300;
            y = 100;
        }

        for (i in 0...5)
            pieces.add(new UrPiece(type, x + (i * 100), y));

        return pieces;
    }
}