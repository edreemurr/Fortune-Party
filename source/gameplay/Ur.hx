package gameplay;

import flixel.FlxSprite;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.group.FlxGroup.FlxTypedGroup;

import assets.UrPiece;
import managers.Everything;

class Ur extends Everything
{
    public static var roll:Int;
    public static var turn:Int;

    public static var rolled:Bool = false;
    public static var moving:Bool = false;

    var pieces:FlxTypedGroup<UrPiece>;

    //set turn cycle, each player only interact with their own pieces...ghost of placement option on hover?
    override function create()
    {
        board = new FlxSprite().loadGraphic('assets/images/ur/board.png');
        add(board);

        turn = FlxMath.wrap(activePlayer, 0, 1);

        add(initPieces('light'));
        add(initPieces('dark'));
        
        super.create();
    }

    override function update(elapsed:Float)
    {
        if (controls.ENTER && !moving && !rolled)
        {
            roll = rollDice(0, 4);

            var numText:FlxText = new FlxText(20, 10, roll, 40);
            add(numText);

            trace ('Player ${turn + 1}, rolled $roll');

            rolled = true;
        }

        super.update(elapsed);
    }
    
    function initPieces(type:String):FlxTypedGroup<UrPiece>
    {
        var x:Int = 0;
        var y:Int = 0;
        
        pieces = new FlxTypedGroup<UrPiece>();

        switch (type)
        {
            case 'light':
                x = 50;

            case 'dark':
                x = 640;
        }

        for (i in 0...5)
            pieces.add(new UrPiece(type, x + (i * 50), 600));

        return pieces;
    }
}