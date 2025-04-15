package gameplay.minigames;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import flixel.input.mouse.FlxMouseEvent;
import flixel.group.FlxGroup.FlxTypedGroup;

import assets.UrPiece;
import managers.Everything;

class Ur extends Everything
{
    public static var roll:Int;

    var newLocation:Int = -1;

    public static var rolled:Bool = false;
    public static var moving:Bool = false;

    var gameBoard:FlxSprite;

    var piecesDark:FlxTypedGroup<UrPiece>;
    var piecesLight:FlxTypedGroup<UrPiece>;
    var pieces:Array<FlxTypedGroup<UrPiece>>;
    
    var numText:FlxText;
    var basedText:FlxText;

    var zero:Array<String>;

    override function create()
    {
        gameBoard = new FlxSprite().loadGraphic('assets/images/ur/board.png');
        add(gameBoard);

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
            'Bummerland',
            'It wimdy fr',
            'Not the vibe',
            'My cabbages!',
            'Nitroglycerin',
            'Immunoglobulin',
            'I miss my\nwife, Tails',
            'How\'d he know\nwhat time it was?',
            'Ababugada\nscaba\nfaggot\nskaba\nfagaba\ngabagalaga'
        ];

        piecesLight = new FlxTypedGroup<UrPiece>();
        add(piecesLight);

        piecesDark = new FlxTypedGroup<UrPiece>();
        add(piecesDark);

        add(initPieces('dark'));
        add(initPieces('light'));

        pieces = [piecesLight, piecesDark];

        basedText = new FlxText(250, 0, 1000, '', 100);
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

                    activePlayer += 1;
                    activePlayer = FlxMath.wrap(activePlayer, 0, 1);
                });
            }
        }

        for (piece in pieces[activePlayer])
        {
            newLocation = piece.location + roll;
            trace (newLocation, piece.location);

            if (newLocation == piece.location && rolled)
            {
                trace ('FlxMouseEvent.remove');
                FlxMouseEvent.remove(piece);
            }

            if (!piece.again)
            {
                activePlayer += 1;
                activePlayer = FlxMath.wrap(activePlayer, 0, 1);
            }
        }

        if (moving)
            numText.text = '';

        super.update(elapsed);
    }

    function initPieces(type:String):FlxTypedGroup<UrPiece>
    {
        switch (type)
        {
            case 'light':
                for (i in 0...5)
                    piecesLight.add(new UrPiece('light', 300 + (i * 100), 650));

                return piecesLight;

            case 'dark':
                for (i in 0...5)
                    piecesDark.add(new UrPiece('dark', 300 + (i * 100), 100));

                return piecesDark;
        }

        return null;
    }
}