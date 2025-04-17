package gameplay.minigames;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import flixel.group.FlxGroup.FlxTypedGroup;

import assets.UrPiece;
import managers.Everything;

class Ur extends Everything
{
    public static var roll:Int;

    var newLocation:Int = -1;

    public static var rolled:Bool = false;
    public static var moving:Bool = false;
    public static var turnEnd:Bool = false;

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

            if (roll == 0)
            {
                basedText.text = '${zero[FlxG.random.int(0, zero.length)]}';

                new FlxTimer().start(3, function(timer:FlxTimer)
                {
                    basedText.text = '';

                    turnEnd = true;
                });
            }
            else
                checkMoves();
        }

        if (moving)
            numText.text = '';

        if (turnEnd)
        {
            var jover:Bool = true;

            var locations:Array<Int> = [];

            var inactivePlayer:Int = 0;
            
            if (activePlayer == 0)
                inactivePlayer = 1;

            var otherPlayer = pieces[inactivePlayer];

            for (otherPiece in otherPlayer)
                locations.push(otherPiece.location);

            for (piece in pieces[activePlayer])
            {
                if (locations.contains(piece.location) && (piece.location > 3 && piece.location < 12))
                    otherPlayer.members[locations.indexOf(piece.location)].killed = true;

                piece.usable = false;

                if (piece.again)
                {
                    jover = false;
                    piece.again = false;
                }
            }

            if (jover)
            {
                activePlayer += 1;
                activePlayer = FlxMath.wrap(activePlayer, 0, 1);
            }

            turnEnd = false;
        }

        super.update(elapsed);
    }

    function checkMoves()
    {
        rolled = true;

        var locations:Array<Int> = [];

        for (piece in pieces[activePlayer])
            locations.push(piece.location);

        for (index => num in locations)
        {
            newLocation = num + roll;

            if (locations.contains(newLocation))
                pieces[activePlayer].members[index].usable = false;
            else
                pieces[activePlayer].members[index].usable = true;
        }
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