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

import assets.Dice;
import assets.Card;
import assets.Minigames;
import assets.Character;

import managers.Everything;

class BoardGame extends Everything
{
    public var curSpace:String;

    var diceRoll:Int;
    var spaceCount:Int;

    var startPos:FlxPoint;
    var spaceType:Array<String>;
    var spacePos:Array<FlxPoint>;
    var spacePrice:Array<Null<Int>>;

    var spaceTypeAlt:Array<Array<String>>;
    var spacePosAlt:Array<Array<FlxPoint>>;

    var no:FlxButton;
    var yes:FlxButton;
    var landPrompt:FlxTypedGroup<FlxButton>;

    var landText:FlxTypeText;

    var music:String = 'assets/music';

    var dice:Dice;
    var minigameResults:PostMinigame;

    override function create()
    {
        FlxG.mouse.visible = false;

        canPause = true;

        newGame = FlxG.save.data.newGame;
        turnOrder = FlxG.save.data.turnOrder;

        board = FlxG.save.data.board;
        cycleCount = FlxG.save.data.cycleCount;
        playerCount = FlxG.save.data.playerCount;
        
        cycle = FlxG.save.data.cycle;
        lands = FlxG.save.data.lands;

        coins = FlxG.save.data.coins;
        starPieces = FlxG.save.data.starPieces;

        FlxG.sound.playMusic('$music/board.ogg', 0.5);

        switch (board)
        {
            case 'demo':
                spaceCount = 42;
                startPos = FlxPoint.get(900, 1500);
                spaceType = ['blue', 'blue', 'blue', 'red', 'blue', 'direction', 'blue', 'red', 'blue', 'green', 'blue', 'red', 'red', 'blue', 'green', 'blue', 'blue', 'red', 'blue', 'blue', 'green', 'purple', 'red', 'red', 'blue', 'teal', 'brown', 'red', 'green', 'green', 'blue', 'blue', 'blue', 'red', 'blue', 'direction', 'red', 'red', 'red', 'red', 'purple', 'red'];
                spaceTypeAlt = [['green', 'brown', 'red', 'red', 'brown'], ['blue', 'blue', 'blue', 'blue', 'blue', 'green', 'red', 'blue', 'brown']];
                spacePos = [FlxPoint.get(1010, 1410), FlxPoint.get(900, 1280), FlxPoint.get(780, 1150), FlxPoint.get(680, 1010), FlxPoint.get(550, 940), FlxPoint.get(400, 860), FlxPoint.get(260, 800), FlxPoint.get(190, 685), FlxPoint.get(130, 530), FlxPoint.get(170, 380), FlxPoint.get(240, 260), FlxPoint.get(380, 150), FlxPoint.get(540, 100), FlxPoint.get(690, 105), FlxPoint.get(870, 105), FlxPoint.get(1030, 160), FlxPoint.get(1215, 190), FlxPoint.get(1370, 200), FlxPoint.get(1530, 220), FlxPoint.get(1700, 270), FlxPoint.get(1885, 340), FlxPoint.get(2040, 440), FlxPoint.get(2000, 580), FlxPoint.get(1855, 635), FlxPoint.get(1700, 660), FlxPoint.get(1535, 675), FlxPoint.get(1380, 700), FlxPoint.get(1325, 850), FlxPoint.get(1450, 950), FlxPoint.get(1590, 1010), FlxPoint.get(1750, 1030), FlxPoint.get(1910, 1050), FlxPoint.get(2065, 1065), FlxPoint.get(2215, 1150), FlxPoint.get(2305, 1305), FlxPoint.get(2245, 1450), FlxPoint.get(2095, 1570), FlxPoint.get(1925, 1615), FlxPoint.get(1735, 1630), FlxPoint.get(1540, 1620), FlxPoint.get(1340, 1580), FlxPoint.get(1160, 1520)];
                spacePosAlt = [[FlxPoint.get(510, 760), FlxPoint.get(630, 640), FlxPoint.get(735, 520), FlxPoint.get(800, 390), FlxPoint.get(890, 280)], [FlxPoint.get(2260, 1660), FlxPoint.get(2200, 1810), FlxPoint.get(2080, 1900), FlxPoint.get(1925, 1920), FlxPoint.get(1770, 1920), FlxPoint.get(1615, 1910), FlxPoint.get(1460, 1885), FlxPoint.get(1315, 1830), FlxPoint.get(1185, 1710)]];

            case 'kingdom':
                spaceCount = 19;
                startPos = FlxPoint.get(300, 300);
                spaceType = ['land1', 'land2', 'land3', 'land4', 'land5', 'land6', 'land7', 'land8', 'land9', 'land10', 'land11', 'land12', 'land13', 'land14', 'land15', 'land16', 'land17', 'land18', 'land19', 'start'];
                spacePos = [FlxPoint.get(400, 300), FlxPoint.get(500, 300), FlxPoint.get(600, 300), FlxPoint.get(700, 300), FlxPoint.get(800, 300), FlxPoint.get(800, 350), FlxPoint.get(800, 400), FlxPoint.get(800, 450), FlxPoint.get(800, 500), FlxPoint.get(800, 550), FlxPoint.get(700, 550), FlxPoint.get(600, 550), FlxPoint.get(500, 550), FlxPoint.get(400, 550), FlxPoint.get(300, 550), FlxPoint.get(300, 500), FlxPoint.get(300, 450), FlxPoint.get(300, 400), FlxPoint.get(300, 350), FlxPoint.get(300, 300)];
                spacePrice = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, null];

                // cards1 = new FlxTypedGroup<Card>();
                // cards2 = new FlxTypedGroup<Card>();
                // cards3 = new FlxTypedGroup<Card>();
                // cards4 = new FlxTypedGroup<Card>();

                // playerHands = [cards1, cards2, cards3, cards4];
        }

        for (spacePosAlt in spacePosAlt)
            for (num => pos in [spacePos, spacePosAlt])
            {
                var space:FlxSprite = new FlxSprite(pos[num].x, pos[num].y).loadGraphic('assets/images/spaces/space.png');
                add(space);
                
                switch (spaceType[num])
                {
                    case 'red': space.color = 0xff6363;
                    case 'blue': space.color = 0x0094ff;
                    case 'teal': space.color = 0x88cfb7;
                    case 'green': space.color = 0x3ece8f;
                    case 'brown': space.color = 0x7a5f4c;
                    case 'purple': space.color = 0xa270ff;
                    case 'direction': space.color = 0x858585;
                }
            }

        player1 = new Character(0, startPos.x, startPos.y);
        player1.animation.play('idle');
        add(player1);

        if (newGame)
            characters.push(player1);

        if (playerCount >= 2)
        {
            player2 = new Character(1, startPos.x, startPos.y);
            player2.animation.play('idle');
            add(player2);

            if (newGame)
                characters.push(player2);
        }

        if (playerCount >= 3)
        {
            player3 = new Character(2, startPos.x, startPos.y);
            player3.animation.play('idle');
            add(player3);

            if (newGame)
                characters.push(player3);
        }

        if (playerCount >= 4)
        {
            player4 = new Character(3, startPos.x, startPos.y);
            player4.animation.play('idle');
            add(player4);

            if (newGame)
                characters.push(player4);
        }

        if (!newGame)
            for (num in turnOrder)
                if (num == player1.player)
                    characters.push(player1);
                else if (num == player2.player)
                    characters.push(player2);
                else if (num == player3.player)
                    characters.push(player3);
                else
                    characters.push(player4);

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

        for (num => char in characters)
        {
            if (newGame)
            {
                locations = [-1, -1, -1, -1];
                
                char.setPosition(startPos.x + (num * 50), startPos.y);
            }
            else
            {
                locations = FlxG.save.data.locations;

                char.setPosition(spacePos[locations[num]].x, spacePos[locations[num]].y);
            }
        }

        cycleText = new FlxText(1100, 0, 100, '', 28);
        add(cycleText);
        
        initBoard();
        
        super.create();
    }

    override function update(elapsed:Float)
    {
        if (controls.ENTER && controlsFree)
        {
            diceRoll = rollDice();
            
            dice.spinning = false;
            dice.animation.frameIndex = diceRoll - 1;

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
            else
                startTurn();

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

                coinsArray = [];
                piecesArray = [];

                land1 = [];
                land2 = [];
                land3 = [];
                land4 = [];
                lands = [land1, land2, land3, land4];

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
                        locations = FlxG.save.data.locations;

                        lands = FlxG.save.data.lands;
                    }

                    // char.loadStats();

                    var ui:FlxSprite = new FlxSprite(20, 20 + (num * 100), 'assets/images/GUI/stats.png');
                    ui.color = char.color;
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

                        // curChar.land.push(curSpace);
                        lands[activePlayer].push(curSpace);

                        coins = FlxArrayUtil.fastSplice(coins, activePlayer);

                        FlxG.save.data.coins = coins;
                        FlxG.save.data.lands = lands;
                        FlxG.save.flush();

                    case 'land rent':
                        if (coins[activePlayer] < spacePrice[locations[activePlayer]])
                        {
                            trace ('Can\'t afford');

                            changeTurn();
                        }
                        else
                        {
                            coins[activePlayer] -= 2;
                            checkOwnership().coins += 2;

                            coins = FlxArrayUtil.fastSplice(coins, activePlayer);
                            coins = FlxArrayUtil.fastSplice(coins, characters.indexOf(checkOwnership()));

                            FlxG.save.data.coins = coins;
                            FlxG.save.flush();
                        }

                    case 'minigame':
                        for (winner in Minigames.victory)
                        {
                            coins[winner - 1] = FlxMath.maxAdd(coins[winner - 1], 10, 999, 0);
                            coinsArray[winner - 1].text = '${coins[winner - 1]}';
                        }

                        FlxG.save.data.coins = coins;
                        FlxG.save.flush();
                }
        }

        function playerMove(num:Int)
        {
            controlsFree = false;

            curChar.animation.play('walk');
            
            if (num > 0)
            {
                var wrap:Int = (locations[activePlayer] + 1) > spaceCount ? -spaceCount : 1;
                var nextSpace = spacePos[locations[activePlayer] + wrap];

                FlxTween.tween(characters[activePlayer], {x: nextSpace.x, y: nextSpace.y}, 0.5, {onComplete: function(tween:FlxTween)
                {
                    locations[activePlayer] += wrap;
                    
                    curSpace = spaceType[locations[activePlayer]];

                    dice.animation.frameIndex --;
                    
                    num--;
    
                    playerMove(num);
                }});
            }
            else
            {
                curChar.animation.play('idle');

                remove(dice);

                if (board == 'demo')
                    initEvent(curSpace);
                else if (board == 'kingdom')
                    if (spaceType[locations[activePlayer]] == null)
                        changeTurn();
                    else
                        land();
            }
        }

    function minigame()
    {
        cycle += 1;

        controlsFree = false;

        saveData();

        openSubState(new MinigameSelection(0x000000));
    }

    function checkOwnership():Character
    {
        for (char => array in lands)
            if (array.contains(curSpace))
                return characters[char];

        return null;
    }

    function initBoard()
    {
        if (newGame)
        {
            openSubState(new BoardBegin(0x000000));

            turnOrder = [];

            FlxG.random.shuffle(characters);

            for (player in characters)
                turnOrder.push(player.player);

            FlxG.save.data.turnOrder = turnOrder;
            FlxG.save.flush();
        }
        else
        {
            openSubState(new PostMinigame(playerCount));
            
            cycleText.text = '$cycle/$cycleCount';
        }

        curChar = characters[activePlayer];

        playerStats();

        if (!newGame)
            playerStats('update', 'minigame');

        curChar.animation.play('think');

        startTurn();

        controlsFree = true;
    }

    function startTurn()
    {
        FlxG.camera.follow(curChar);

        dice = new Dice(curChar.x, curChar.y - 100);
        add(dice);
    }

    function changeTurn()
    {
        activePlayer += 1;

        if (board != 'demo')
        {
            activePlayer = FlxMath.wrap(activePlayer, 0, playerCount - 1);
            
            if (activePlayer == 0)
            {
                cycle ++;
                cycleText.text = '$cycle/$cycleCount';
                
                saveData();
            }

            startTurn();
        }

        curChar = characters[activePlayer];

        if (activePlayer < playerCount && !newGame)
            curChar.animation.play('think');
    }

    function saveData()
    {
        FlxG.save.data.newGame = false;

        FlxG.save.data.cycle = cycle;
        FlxG.save.data.turnOrder = turnOrder;
        FlxG.save.data.locations = locations;
        
        FlxG.save.data.coins = coins;
        FlxG.save.data.starPieces = starPieces;

        FlxG.save.data.lands = lands;
        FlxG.save.flush();
    }
}