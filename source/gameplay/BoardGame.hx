package gameplay;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.tweens.FlxTween;
import flixel.util.FlxArrayUtil;
import flixel.addons.text.FlxTypeText;
import flixel.group.FlxGroup.FlxTypedGroup;

import assets.Card;
import assets.Character;
import gameplay.minigames.*;

import managers.Everything;
import menus.CharacterSelect;

class BoardGame extends Everything
{
    public var curSpace:String;

    var diceRoll:Int;
    var spaceCount:Int;

    var startPos:FlxPoint;
    var spacePrice:Array<Null<Int>>;
    var spaceType:Array<String>;
    var spacePos:Array<FlxPoint>;

    var yes:FlxButton;
    var no:FlxButton;
    var landPrompt:FlxTypedGroup<FlxButton>;

    var landText:FlxTypeText;

    override function create()
    {
        FlxG.mouse.visible = false;

        #if DEBUG
        FlxG.watch.add(activePlayer, 'Active Player');
        #end

        canPause = true;

        newGame = FlxG.save.data.newGame;

        board = FlxG.save.data.board;
        playerCount = FlxG.save.data.playerCount;

        cycle = FlxG.save.data.cycle;
        coins = FlxG.save.data.coins;
        starPieces = FlxG.save.data.starPieces;

        switch (board)
        {
            case 'demo':
                spaceCount = 13;
                startPos = FlxPoint.get(600, 650);
                spaceType = ['blue', 'blue', 'red', 'blue', 'green', 'red', 'brown', 'blue', 'blue', 'brown', 'green', 'blue', 'brown', 'red'];
                spacePos = [FlxPoint.get(634, 546), FlxPoint.get(500, 543), FlxPoint.get(380, 490), FlxPoint.get(294, 400), FlxPoint.get(325, 285), FlxPoint.get(413, 191), FlxPoint.get(511, 115), FlxPoint.get(633, 105), FlxPoint.get(766, 115), FlxPoint.get(872, 154), FlxPoint.get(948, 237), FlxPoint.get(971, 343), FlxPoint.get(887, 456), FlxPoint.get(768, 522)];

            case 'kingdom':
                spaceCount = 20;
                startPos = FlxPoint.get(300, 300);
                spaceType = ['land1', 'land2', 'land3', 'land4', 'land5', 'land6', 'land7', 'land8', 'land9', 'land10', 'land11', 'land12', 'land13', 'land14', 'land15', 'land16', 'land17', 'land18', 'land19', 'start'];
                spacePos = [FlxPoint.get(400, 300), FlxPoint.get(500, 300), FlxPoint.get(600, 300), FlxPoint.get(700, 300), FlxPoint.get(800, 300), FlxPoint.get(800, 350), FlxPoint.get(800, 400), FlxPoint.get(800, 450), FlxPoint.get(800, 500), FlxPoint.get(800, 550), FlxPoint.get(700, 550), FlxPoint.get(600, 550), FlxPoint.get(500, 550), FlxPoint.get(400, 550), FlxPoint.get(300, 550), FlxPoint.get(300, 500), FlxPoint.get(300, 450), FlxPoint.get(300, 400), FlxPoint.get(300, 350), FlxPoint.get(300, 300)];
                spacePrice = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, null];

                landText = new FlxTypeText(0, 100, 500, 'Would you like to\npurchase this land?', 30);
                landText.screenCenter(X);
                add(landText);
                
                landPrompt = new FlxTypedGroup<FlxButton>();
                landPrompt.visible = false;
                add(landPrompt);

                yes = new FlxButton('YES', () -> landOption('purchase'));
                landPrompt.add(yes);
                
                no = new FlxButton('NO', () -> landOption('decline'));
                landPrompt.add(no);

                for (num => button in landPrompt)
                {
                    button.screenCenter(X);
                    button.y = landText.y + 200 + (num * 150);
                }

                // cards1 = new FlxTypedGroup<Card>();
                // cards2 = new FlxTypedGroup<Card>();
                // cards3 = new FlxTypedGroup<Card>();
                // cards4 = new FlxTypedGroup<Card>();

                // playerHands = [cards1, cards2, cards3, cards4];
        }

        for (i in 0...spacePos.length)
        {
            var space:FlxSprite = new FlxSprite(spacePos[i].x, spacePos[i].y).loadGraphic('assets/images/spaces/${spaceType[i]}.png');
            add(space);
        }

        player1 = new Character(0, startPos.x, startPos.y, CharacterSelect.character1);
        characters.push(player1);
        add(player1);

        if (playerCount >= 2)
        {
            player2 = new Character(1, startPos.x, startPos.y, CharacterSelect.character2);
            characters.push(player2);
            add(player2);
        }

        if (playerCount >= 3)
        {
            player3 = new Character(2, startPos.x, startPos.y, CharacterSelect.character3);
            characters.push(player3);
            add(player3);
        }

        if (playerCount >= 4)
        {
            player4 = new Character(3, startPos.x, startPos.y, CharacterSelect.character4);
            characters.push(player4);
            add(player4);
        }

        for (num => char in characters)
        {
            locations = [];

            if (newGame)
            {
                char.setPosition(startPos.x, startPos.y - (num * 15));
                
                locations.push(-1);
            }
            else
            {
                locations = FlxG.save.data.locations;

                for (location in locations)
                    char.setPosition(spacePos[location].x, spacePos[location].y);
            }
        }

        curChar = characters[activePlayer];

        initTurnOrder();

        super.create();
    }

    override function update(elapsed:Float)
    {
        if (controls.ENTER && controlsFree)
        {
            diceRoll = rollDice();

            playerMove(diceRoll);
        }

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

            if (activePlayer == playerCount && board == 'demo')
                minigame();

            space.destroy();
            space.kill();
            
            controlsFree = true;
        }});
    }

    function land()
    {
        FlxG.mouse.visible = true;

        var owner = checkOwnership();

        landText.completeCallback = null;

        if (owner != null)
        {
            landText.resetText('Pay 2 coins');
            
            landOption('rent');
        }
        else
        {
            if (coins[activePlayer] < spacePrice[locations[activePlayer]])
                changeTurn();
            else
                landText.resetText('Would you like to\npurchase this land for ${spacePrice[locations[activePlayer]]} coins?');

            landPrompt.visible = true;
        }

        landText.start(0.02);
    }
    
    function landOption(choice:String)
    {
        FlxG.mouse.visible = false;

        landPrompt.visible = false;
        landText.resetText('');
        
        switch (choice)
        {
            case 'purchase':
                playerStats('update', 'land buy');

            case 'rent':
                playerStats('update', 'land rent');
        }

        // drawCard();
        changeTurn();

        controlsFree = true;
    }

/*     function drawCard():FlxTypedGroup<Card>
        {
            playerHands[activePlayer].add(new Card('poker', 0, 0, FlxG.random.int(0, 67)));

            return playerHands[activePlayer];
        }
 */
    function playerStats(event:String = 'create', ?statChange:Dynamic)
        switch (event)
        {
            case 'create':
                coins = [];
                starPieces = [];

                lands = [];
                coinsArray = [];
                piecesArray = [];

                for (num => char in characters)
                {
                    if (newGame)
                    {
                        coins.push(10);
                        starPieces.push(0);

                        // lands.push(char.land);
                    }
                    else
                    {
                        coins = FlxG.save.data.coins;
                        starPieces = FlxG.save.data.starPieces;
                        locations = FlxG.save.data.curLocations;
                        lands = FlxG.save.data.ownedLand;
                    }

                    // trace ('Loading stats');
                    // char.loadStats();

                    var ui:FlxSprite = new FlxSprite(20, 20 + (num * 100), 'assets/images/GUI/stats.png');
                    // ui.color = char.color;
                    // statsUI.push(ui);
                    add(ui);

                    var player:FlxSprite = new FlxSprite(ui.x, ui.y).loadGraphicFromSprite(char);
                    player.setGraphicSize(25);
                    add(player);

                    var coins:FlxText = new FlxText(ui.x + 160, ui.y + 30, '${coins[num]}', 20);
                    coinsArray.push(coins);
                    add(coins);

                    var pieces:FlxText = new FlxText(ui.x + 250, ui.y + 30, '${starPieces[num]}', 20);
                    piecesArray.push(pieces);
                    add(pieces);

/*                     if (newGame)
                    {
                        FlxG.save.data.coins.push(10);
                        FlxG.save.flush();
                    }
 */             }

            case 'update':
                switch (statChange)
                {
                    case 'blue':
                        coins[activePlayer] = FlxMath.maxAdd(coins[activePlayer], 3, 999, 0);
                        coinsArray[activePlayer].text = '${coins[activePlayer]}';

                        coins = FlxArrayUtil.fastSplice(coins, activePlayer);
                        FlxG.save.data.coins = coins;
                        FlxG.save.flush();

                    case 'red':
                        coins[activePlayer] = FlxMath.maxAdd(coins[activePlayer], -3, 999, 0);
                        coinsArray[activePlayer].text = '${coins[activePlayer]}';

                        coins = FlxArrayUtil.fastSplice(coins, activePlayer);
                        FlxG.save.data.coins = coins;
                        FlxG.save.flush();

                    case 'green':
                        starPieces[activePlayer] = FlxMath.maxAdd(starPieces[activePlayer], 1, 5, 0);
                        piecesArray[activePlayer].text = '${starPieces[activePlayer]}';

                        starPieces = FlxArrayUtil.fastSplice(starPieces, activePlayer);
                        FlxG.save.data.starPieces = starPieces;
                        FlxG.save.flush();

                    case 'brown':
                        coins[activePlayer] = FlxMath.maxAdd(coins[activePlayer], 100, 999, 0);
                        coinsArray[activePlayer].text = '${coins[activePlayer]}';

                        coins = FlxArrayUtil.fastSplice(coins, activePlayer);
                        FlxG.save.data.coins = coins;
                        FlxG.save.flush();

                    case 'land buy':
                        coins[activePlayer] -= spacePrice[locations[activePlayer]];
                        coinsArray[activePlayer].text = '${coins[activePlayer]}';

                        curChar.land.push(curSpace);

                        coins = FlxArrayUtil.fastSplice(coins, activePlayer);
                        FlxG.save.data.coins = coins;
                        FlxG.save.flush();

                        // for (land in ownedLand)
                        //     trace (land);

                    case 'land rent':
                        if (coins[activePlayer] < 2)
                        {
                            trace ('Can\'t afford');

                            changeTurn();
                        }
                        else
                        {
                            coins[activePlayer] -= 2;
                            checkOwnership().coins += 2;

                            // coins = FlxArrayUtil.fastSplice(coins, activePlayer);
                            // coins = FlxArrayUtil.fastSplice(coins, characters.indexOf(checkOwnership()));

                            // FlxG.save.data.coins = coins;
                            // FlxG.save.flush();
                        }
                }
        }

        function playerMove(num:Int)
        {
            controlsFree = false;
            
            if (num > 0)
            {
                var wrap:Int = (locations[activePlayer] + 1) > spaceCount ? -spaceCount : 1;
                var nextSpace = spacePos[locations[activePlayer] + wrap];

                FlxTween.tween(characters[activePlayer], {x: nextSpace.x, y: nextSpace.y}, 0.5, {onComplete: function(tween:FlxTween)
                {
                    locations[activePlayer] += wrap;
                    
                    curSpace = spaceType[locations[activePlayer]];

                    // FlxG.save.data.curLocations = curLocations;
                    // FlxG.save.flush();

                    num--;
    
                    playerMove(num);
                }});
            }
            else
                if (board == 'demo')
                    initEvent(curSpace);
                else if (board == 'kingdom')
                    if (spaceType[locations[activePlayer]] == null)
                        changeTurn();
                    else
                        land();
        }

    function minigame()
    {
        cycle += 1;

        FlxG.save.data.cycle = cycle;
        FlxG.save.data.newGame = false;
        // FlxG.save.data.ownedLand = ownedLand;
        // FlxG.save.data.starPieces = starPieces;
        // FlxG.save.data.curLocations = curLocations;
        FlxG.save.flush();

        FlxG.switchState(Ur.new);
    }

    function checkOwnership():Character
    {
        // for (char => array in ownedLand)
        //     if (array.contains(curSpace))
        //         return characters[char];

        return null;
    }

    function initTurnOrder()
    {
        if (newGame)
            FlxG.random.shuffle(characters);

        playerStats();

        controlsFree = true;
    }

    function changeTurn()
    {
        activePlayer += 1;
        activePlayer = FlxMath.wrap(activePlayer, 0, playerCount - 1);

        curChar = characters[activePlayer];
    }
}