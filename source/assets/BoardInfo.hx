package assets;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxTween;

import managers.Everything;

class BoardInfo extends Everything
{
    var board:String;

    var cycle:Int;
    var diceRoll:Int;
    var spaceCount:Int;

    var coins:Array<Int>;
    var starPieces:Array<Int>;

    var statsArray:Array<FlxText>;
    var startPos:Array<Int>;
    var spaceArray:Array<Array<Dynamic>>;
    var playerLocations:Map<Character, Int>;

    public function new(board:String)
    {
        super();

        this.board = board;

        switch (board)
        {
            case 'demo':
                spaceCount = 13;
                startPos = [600, 650];
                spaceArray = [['blue', 634, 546], ['blue', 500, 543], ['red', 380, 490], ['blue', 294, 400], ['green', 325, 285], ['red', 413, 191], ['brown', 511, 115], ['blue', 633, 105], ['blue', 766, 115], ['brown', 872, 154], ['green', 948, 237], ['blue', 971, 343], ['brown', 887, 456], ['red', 768, 522]];

            case 'kingdom':
                spaceCount = 20;
                startPos = [300, 300];
                spaceArray = [[null, 400, 300], [null, 500, 300], [null, 600, 300], [null, 700, 300], ['jail', 800, 300], [null, 800, 350], [null, 800, 400], [null, 800, 450], [null, 800, 500], ['parking', 800, 550], [null, 700, 550], [null, 600, 550], [null, 500, 550], [null, 400, 550], ['go to jail', 300, 550], [null, 300, 500], [null, 300, 450], [null, 300, 400], [null, 300, 350], ['start', 300, 300]];
        }

        playerLocations = new Map<Character, Int>();
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
            activePlayer += 1;
            activePlayer = FlxMath.wrap(activePlayer, 0, characters.length - 1);

            space.destroy();
            space.kill();
            
            controlsFree = true;
        }});
    }

    function playerStats(event:String = 'create', ?statChange:Dynamic)
    {
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
                }
        }
    }
}