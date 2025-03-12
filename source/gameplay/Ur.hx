package gameplay;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import flixel.group.FlxGroup.FlxTypedGroup;

import assets.UrPiece;
import managers.Everything;
//managers.BoardGame.hx
class Ur extends Everything
{
    public static var roll:Int;

    public static var turn:String = 'light';

    public static var rolled:Bool = false;
    public static var moving:Bool = false;

    var board:FlxSprite;
    var pieces:FlxTypedGroup<UrPiece>;
    
    var numText:FlxText;
    var basedText:FlxText;

    var zero:Array<String>;

    override function create()
    {
        board = new FlxSprite().loadGraphic('assets/images/ur/board.png');
        add(board);

        numText = new FlxText(20, 10, '', 40);
        add(numText);

        zero = [
            'L',
            'Gay',
            'Nerd',
            'Bruh',
            'Basic',
            'Cringe',
            'You suck',
            'Hi Ryder',
            'Mitaplier',
            'Me when I-',
            'It wimdy fr',
            'Not the vibe',
            'My cabbages!',
            'Nitroglycerin',
            'Immunoglobulin',
            'I miss my\nwife, Tails',
            'How\'d he know\nwhat time it was?'
        ];

        add(initPieces('light'));
        add(initPieces('dark'));

        basedText = new FlxText(250, '', 100);
        basedText.alignment = CENTER;
        basedText.screenCenter(Y);
        add(basedText);
        
        super.create();
    }

    override function update(elapsed:Float)
    {
        if (controls.ENTER && !moving && !rolled)
        {
            roll = rollDice(0, 4);

            numText.text = '$roll';

            if (roll > 0)
                rolled = true;
            else
            {
                basedText.text = '${zero[FlxG.random.int(0, zero.length)]}';

                new FlxTimer().start(5, function(timer:FlxTimer)
                {
                    basedText.text = '';
                });
            }
        }

        if (moving)
            numText.text = '';

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