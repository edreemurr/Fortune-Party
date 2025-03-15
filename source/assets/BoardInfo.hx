package assets;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.tweens.FlxTween;
import flixel.addons.text.FlxTypeText;
import flixel.group.FlxGroup.FlxTypedGroup;

import managers.Everything;

class BoardInfo extends Everything
{
    var board:String;
    var curSpace:Dynamic;

    var cycle:Int;
    var diceRoll:Int;
    var spaceCount:Int;

    var coins:Array<Int>;
    var starPieces:Array<Int>;

    var statsArray:Array<FlxText>;
    var startPos:Array<Int>;
    var spaceType:Array<Dynamic>;
    var spacePos:Array<FlxPoint>;
    var playerLocations:Map<Character, Int>;

    var landPrompt:FlxTypedGroup<FlxButton>;
    var yes:FlxButton;
    var no:FlxButton;

    var landText:FlxTypeText;

    public function new(board:String)
    {
        super();

        this.board = board;

        playerLocations = new Map<Character, Int>();

        switch (board)
        {
            case 'demo':
                spaceCount = 13;
                startPos = [600, 650];
                spaceType = ['blue', 'blue', 'red', 'blue', 'green', 'red', 'brown', 'blue', 'blue', 'brown', 'green', 'blue', 'brown', 'red'];
                spacePos = [FlxPoint.get(634, 546), FlxPoint.get(500, 543), FlxPoint.get(380, 490), FlxPoint.get(294, 400), FlxPoint.get(325, 285), FlxPoint.get(413, 191), FlxPoint.get(511, 115), FlxPoint.get(633, 105), FlxPoint.get(766, 115), FlxPoint.get(872, 154), FlxPoint.get(948, 237), FlxPoint.get(971, 343), FlxPoint.get(887, 456), FlxPoint.get(768, 522)];

            case 'kingdom':
                spaceCount = 20;
                startPos = [300, 300];
                spaceType = [null, null, null, null, 'jail', null, null, null, null, 'parking', null, null, null, null, 'go to jail', null, null, null, null, 'start'];
                spacePos = [FlxPoint.get(400, 300), FlxPoint.get(500, 300), FlxPoint.get(600, 300), FlxPoint.get(700, 300), FlxPoint.get(800, 300), FlxPoint.get(800, 350), FlxPoint.get(800, 400), FlxPoint.get(800, 450), FlxPoint.get(800, 500), FlxPoint.get(800, 550), FlxPoint.get(700, 550), FlxPoint.get(600, 550), FlxPoint.get(500, 550), FlxPoint.get(400, 550), FlxPoint.get(300, 550), FlxPoint.get(300, 500), FlxPoint.get(300, 450), FlxPoint.get(300, 400), FlxPoint.get(300, 350), FlxPoint.get(300, 300)];

                landText = new FlxTypeText(0, 100, 500, 'Would you like to\npurchase this land?', 30);
                landText.screenCenter(X);
                add(landText);
                
                landPrompt = new FlxTypedGroup<FlxButton>();
                landPrompt.visible = false;
                add(landPrompt);

                yes = new FlxButton('YES', () -> landOption('buy'));
                landPrompt.add(yes);
                
                no = new FlxButton('NO', () -> landOption('decline'));
                landPrompt.add(no);

                for (num => button in landPrompt)
                {
                    button.screenCenter(X);
                    button.y = landText.y + 200 + (num * 150);
                }
        }
    }

    override function update(elapsed:Float)
    {
        curSpace = spaceType[playerLocations.get(characters[activePlayer])];

        super.update(elapsed);
    }

    function initEvent(event:String)
    {
        var space:FlxText = new FlxText(FlxG.width/2, FlxG.height/2, '', 40);
        add(space);

        switch (event)
        {
            case 'blue': space.text = '+3';
            case 'red': space.text = '-3';
            case 'green': space.text = 'lucky';
            case 'brown': space.text = 'chance time';
        }

        playerStats('update', event);
        
        FlxTween.tween(space, {alpha: 0}, 1, {onComplete: function(tween:FlxTween)
        {
            changeTurn();

            space.destroy();
            space.kill();
            
            controlsFree = true;
        }});
    }

    function land(owner:String)
    {
        FlxG.mouse.visible = true;

        trace (owner);

        if (owner != null)
            landText.text = 'This property is owned by Player ${characters[curSpace[0]]}';
        else
            landText.text = 'Would you like to\npurchase this land?';

        landText.start(0.02);
        landPrompt.visible = true;
    }
    
    function landOption(choice:String)
    {
        FlxG.mouse.visible = false;

        switch (choice)
        {
            case 'buy':
                playerStats('update', 'land buy');
        }
                
        landPrompt.visible = false;

        changeTurn();

        controlsFree = true;
    }

    function playerStats(event:String = 'create', ?statChange:Dynamic)
        switch (event)
        {
            case 'create':
                coins = [10, 10, 10, 10];
                starPieces = [0, 0, 0, 0];
                statsArray = [];
                
                for (num => char in characters)
                {
                    var player:FlxSprite = new FlxSprite(20, 20 + (num * 30)).loadGraphicFromSprite(char);
                    player.setGraphicSize(25);
                    add(player);

                    var stats:FlxText = new FlxText(player.x + 20, player.y, 'Coins: ${coins[num]}, Star Pieces: ${starPieces[num]}', 20);
                    statsArray.push(stats);
                    add(stats);
                }

            case 'update':

                switch (statChange)
                {
                    case 'blue':
                        coins[activePlayer] = FlxMath.maxAdd(coins[activePlayer], 3, 999, 0);
                        statsArray[activePlayer].text = 'Coins: ${coins[activePlayer]}, Star Pieces: ${starPieces[activePlayer]}';

                    case 'red':
                        coins[activePlayer] = FlxMath.maxAdd(coins[activePlayer], -3, 999, 0);
                        statsArray[activePlayer].text = 'Coins: ${coins[activePlayer]}, Star Pieces: ${starPieces[activePlayer]}';

                    case 'green':
                        starPieces[activePlayer] = FlxMath.maxAdd(starPieces[activePlayer], 1, 5, 0);
                        statsArray[activePlayer].text = 'Coins: ${coins[activePlayer]}, Star Pieces: ${starPieces[activePlayer]}';

                    case 'brown':
                        coins[activePlayer] = FlxMath.maxAdd(coins[activePlayer], 100, 999, 0);
                        statsArray[activePlayer].text = 'Coins: ${coins[activePlayer]}, Star Pieces: ${starPieces[activePlayer]}';

                    case 'land buy':
                        coins[activePlayer] = FlxMath.maxAdd(coins[activePlayer], -5, 999, 0);
                        statsArray[activePlayer].text = 'Coins: ${coins[activePlayer]}, Star Pieces: ${starPieces[activePlayer]}';
                }
        }

    function changeTurn()
    {
        activePlayer += 1;
        activePlayer = FlxMath.wrap(activePlayer, 0, characters.length - 1);
    }
}