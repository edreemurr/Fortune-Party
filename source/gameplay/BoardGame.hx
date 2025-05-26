package gameplay;

import flixel.input.gamepad.FlxGamepad;
import flixel.input.actions.FlxActionInput.FlxInputDevice;
import flixel.tweens.FlxEase;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.util.FlxArrayUtil;
import flixel.addons.text.FlxTypeText;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.graphics.frames.FlxAtlasFrames;

import flixel.input.actions.FlxActionSet;
import flixel.input.actions.FlxActionManager;
import flixel.input.actions.FlxAction.FlxActionAnalog;
import flixel.input.actions.FlxAction.FlxActionDigital;

import assets.*;

import managers.Everything;

class BoardGame extends Everything
{
    public var curSpace:String;

    var shopping = false;

    var diceRoll:Int;
    var spaceCount:Int;
    var spaceCountAlt:Array<Int>;

    var playerPaths:Array<Int> = [-1, -1, -1, -1];

    var curFork:Int = 0;
    var merge:Array<Int>;

    var arrow:FlxSprite;

    var playerSpaces:Array<FlxSprite>;
    var spaceColors:Map<String, FlxColor>;

    var startPos:FlxPoint;
    var spaceType:Array<String>;
    var spacePos:Array<FlxPoint>;
    var spacePrice:Array<Null<Int>>;

    var spaceTypeAlt:Array<Array<String>>;
    var spacePosAlt:Array<Array<FlxPoint>>;

    var itemSprites:Array<Array<FlxSprite>>;

    var events:Array<String>;

    var no:FlxButton;
    var yes:FlxButton;
    var landPrompt:FlxTypedGroup<FlxButton>;

    var landText:FlxTypeText;

    var stock:Array<Array<Dynamic>>;
    var items:Array<Array<Dynamic>>;

    var stockSprites:Array<FlxSprite>;

    var itemText:FlxText;

    var music:String = 'assets/music';
    var image:String = 'assets/images';

    var inputs:FlxActionManager;

    var buttons:FlxActionSet;
    var directions:FlxActionSet;

    var joystick:FlxActionAnalog;
    
    var interact:FlxActionDigital;
    var withdraw:FlxActionDigital;

    var up:FlxActionDigital;
    var down:FlxActionDigital;
    var left:FlxActionDigital;
    var right:FlxActionDigital;

    var dice:Dice;
    var minigameResults:PostMinigame;

    override function create()
    {
        FlxG.mouse.visible = false;

        canPause = true;
        boardGame = true;

        newGame = FlxG.save.data.newGame;
        turnOrder = FlxG.save.data.turnOrder;

        board = FlxG.save.data.board;
        cycleCount = FlxG.save.data.cycleCount;
        playerCount = FlxG.save.data.playerCount;
        
        cycle = FlxG.save.data.cycle;
        lands = FlxG.save.data.lands;

        FlxG.sound.playMusic('$music/board.ogg', 0.5);

        playerSpaces = new Array<FlxSprite>();
        spaceColors = new Map<String, FlxColor>();

        events = [/* 'Chance Time',  */'Random Space', 'Gain/Lose Chen', 'Star Sprout'];

        switch (board)
        {
            case 'party':
                spaceCount = 42;
                spaceCountAlt = [4, 8];

                merge = [15, 41];

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

        for (num => pos in spacePos)
        {
            var space:FlxSprite = new FlxSprite(pos.x, pos.y).loadGraphic('assets/images/spaces/space.png');
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

            if (!spaceColors.exists(spaceType[num]))
                spaceColors.set(spaceType[num], space.color);
        }

        for (index => spaceAlt in spacePosAlt)
            for (num => pos in spaceAlt)
            {
                var space:FlxSprite = new FlxSprite(pos.x, pos.y).loadGraphic('assets/images/spaces/space.png');
                add(space);

                switch (spaceTypeAlt[index][num])
                {
                    case 'red': space.color = 0xff6363;
                    case 'blue': space.color = 0x0094ff;
                    case 'teal': space.color = 0x88cfb7;
                    case 'green': space.color = 0x3ece8f;
                    case 'brown': space.color = 0x7a5f4c;
                    case 'purple': space.color = 0xa270ff;
                }
            }

        var curItems:Array<String> = FlxG.save.data.inventory1;

        player1 = new Character(0, curItems);
        player1.animation.play('idle');
        add(player1);

        if (playerCount >= 2)
        {
            curItems = FlxG.save.data.inventory2;

            player2 = new Character(1, curItems);
            player2.animation.play('idle');
            add(player2);
        }

        if (playerCount >= 3)
        {
            curItems = FlxG.save.data.inventory3;

            player3 = new Character(2, curItems);
            player3.animation.play('idle');
            add(player3);
        }

        if (playerCount >= 4)
        {
            curItems = FlxG.save.data.inventory4;

            player4 = new Character(3, curItems);
            player4.animation.play('idle');
            add(player4);
        }

        if (newGame)
        {
            characters.push(player1);
            characters.push(player2);
            characters.push(player3);
            characters.push(player4);
        }
        else
            for (num in turnOrder)
                if (num == player1.player)
                    characters.push(player1);
                else if (num == player2.player)
                    characters.push(player2);
                else if (num == player3.player)
                    characters.push(player3);
                else
                    characters.push(player4);

        for (num in 0...FlxG.gamepads.numActiveGamepads)
            controllers.push(FlxG.gamepads.getByID(num));

        items = [
            ['high', 5, 'Can roll only between 4 and 6'],
            ['low', 5, 'Can only only between 1 and 3'],
            ['odd', 6, 'Can only roll 1, 3, and 5'],
            ['even', 7, 'Can only roll 2, 4, and 6'],
            ['slow', 10, 'The dice rolls slowly, allowing for easy manipulation'],
            ['choice', 15, 'The dice shows whatever you choose']
        ];

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
            if (newGame)
            {
                playerPaths = [-1, -1, -1, -1];

                locations = [-1, -1, -1, -1];
                locationsAlt = [-1, -1, -1, -1];
                
                char.setPosition(startPos.x + (num * 50), startPos.y);
            }
            else
            {
                locations = FlxG.save.data.locations;
                playerPaths = FlxG.save.data.playerPaths;
                locationsAlt = FlxG.save.data.locationsAlt;

                var pathCheck = playerPaths[num];
    
                if (pathCheck > -1)
                    char.setPosition(spacePosAlt[pathCheck][locationsAlt[num]].x, spacePosAlt[pathCheck][locationsAlt[num]].y);
                else
                    char.setPosition(spacePos[locations[num]].x, spacePos[locations[num]].y);
            }

        cycleText = new FlxText(1100, 0, 100, '', 28);
        add(cycleText);

        gayCam = new FlxCamera();

        GUI = new FlxCamera();
        GUI.bgColor.alpha = 0;

        textCam = new FlxCamera();
        textCam.bgColor.alpha = 0;

        subCam = new FlxCamera();
        subCam.bgColor.alpha = 0;

        FlxG.cameras.add(gayCam, true);
        FlxG.cameras.add(GUI, false);
        FlxG.cameras.add(textCam, false);
        FlxG.cameras.add(subCam, false);

        playerControls();
        initBoard();

        super.create();
    }

    override function update(elapsed:Float)
    {
        if (controlsFree)
        {
            if (turnStart)
                if (interact.triggered)
                {
                    var min:Int = 1;
                    var max:Int = 6;

                    var exclude:Array<Int> = [];

                    switch (dice.type)
                    {
                        case 'low':
                            min = 1;
                            max = 3;

                        case 'high':
                            min = 4;
                            max = 6;

                        case 'odd':
                            min = 1;
                            max = 5;
                            exclude = [2, 4, 6];

                        case 'even':
                            min = 2;
                            max = 6;
                            exclude = [1, 3, 5];
                    }

                    diceRoll = FlxG.random.int(min, max, exclude);
                    
                    dice.spinning = false;
                    dice.animation.frameIndex = diceRoll - 1;

                    turnStart = false;

                    playerMove(diceRoll);
                }
            
            if (deciding)
            {
                if (down.triggered || left.triggered)
                {
                    playerPaths[activePlayer] = -1;

                    FlxTween.cancelTweensOf(arrow);
                    FlxTween.tween(arrow, {angle: -45}, 0.5);
                }

                if (up.triggered || right.triggered)
                {
                    playerPaths[activePlayer] = curFork;

                    FlxTween.cancelTweensOf(arrow);
                    FlxTween.tween(arrow, {angle: 45}, 0.5);
                }

                if (interact.triggered)
                {
                    deciding = false;

                    arrow.destroy();

                    playerMove(diceRoll);
                }
            }

            if (shopping)
            {
                if (left.triggered)
                    changeSelection(-1);

                if (right.triggered)
                    changeSelection(1);

                if (interact.triggered)
                {
                    curChar.inventory.push(Std.string(stock[selected][0]));
                    chen[activePlayer] -= Std.int(stock[selected][1]);

                    updateItem(activePlayer - 1);

                    shopping = false;

                    startTurn();
                }
            }
        }

        super.update(elapsed);
    }

    function initEvent(event:String)
    {
        var space:FlxText = new FlxText(FlxG.width/2, FlxG.height/2, '', 40);
        space.cameras = [textCam];
        add(space);

        switch (event)
        {
            case 'blue':
                rng = FlxG.random.int(3, 5);

                space.text = '+$rng';

                if (/* cycle > 4 &&  */FlxG.random.int(1, 3) == 3)
                    sproutCheck();

            case 'red':
                rng = FlxG.random.int(2, 6);

                space.text = '-$rng';

                if (/* cycle > 4 && */FlxG.random.int(1, 3) == 3)
                    sproutCheck();

            case 'green':
                space.text = 'Random Item';

            case 'brown':
                space.text = 'Solo Minigame';

            case 'purple':
                rng = FlxG.random.int(0, events.length - 1);

                space.text = 'Random Event\n${events[rng]}';

            case 'teal':
                rng = FlxG.random.int(3, 8);

                space.text = '$rng';

            case 'sprout':
                space.text = 'Found Star Sprout';
        }

        playerStats('update', event);
        
        FlxTween.tween(space, {alpha: 0}, 1, {onComplete: function(tween:FlxTween)
        {
            changeTurn();

            if (event != 'brown')
                if (activePlayer == playerCount && board == 'party')
                    minigame();
                // else
                //     startTurn();

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
            landText.resetText('Pay 2 chen');
            
            landOption('rent');
        }
        else
        {
            if (chen[activePlayer] < spacePrice[locations[activePlayer]])
                changeTurn();
            else
                landText.resetText('Would you like to\npurchase this land for ${spacePrice[locations[activePlayer]]} chen?');

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
                chen = [];
                sprouts = [];

                chenArray = [];
                sproutArray = [];

                statsUI = [];
                itemSprites = [];

                land1 = [];
                land2 = [];
                land3 = [];
                land4 = [];
                lands = [land1, land2, land3, land4];

                for (num => char in characters)
                {
                    var chenNumbers:Array<FlxSprite> = [];

                    if (newGame)
                    {
                        chen.push(10);
                        sprouts.push(0);
                        // lands.push(char.land);
                    }
                    else
                    {
                        chen = FlxG.save.data.chen;
                        sprouts = FlxG.save.data.sprouts;

                        itemSprites = FlxG.save.data.itemSprites;

                        lands = FlxG.save.data.lands;
                    }

                    var ui:FlxSprite = new FlxSprite(20, 20 + (num * 150), 'assets/images/GUI/stats.png');
                    ui.color = char.color;
                    ui.cameras = [GUI];
                    statsUI.push(ui);
                    add(ui);

                    var space:FlxSprite = new FlxSprite(ui.x, ui.y, 'assets/images/GUI/space.png');
                    space.cameras = [GUI];
                    playerSpaces.push(space);
                    add(space);

                    var chenIcon:FlxSprite = new FlxSprite(ui.x + 60, ui.y + 15, '$image/GUI/chen.png');
                    chenIcon.cameras = [GUI];
                    add(chenIcon);

                    var sproutIcon:FlxSprite = new FlxSprite(ui.x + 175, ui.y + 15, '$image/GUI/sprout.png');
                    sproutIcon.cameras = [GUI];
                    add(sproutIcon);

                    for (i in 0...2)
                    {
                        var chenNum:FlxSprite = new FlxSprite(chenIcon.x + 50 + (i * 20), chenIcon.y + 15);
                        chenNum.frames = FlxAtlasFrames.fromSparrow('$image/GUI/numbers.png', '$image/GUI/numbers.xml');
                        chenNum.animation.addByPrefix('zero', 'numbers zero');
                        chenNum.animation.addByPrefix('one', 'numbers one');
                        chenNum.animation.addByPrefix('two', 'numbers two');
                        chenNum.animation.addByPrefix('three', 'numbers three');
                        chenNum.animation.addByPrefix('four', 'numbers four');
                        chenNum.animation.addByPrefix('five', 'numbers five');
                        chenNum.animation.addByPrefix('six', 'numbers six');
                        chenNum.animation.addByPrefix('seven', 'numbers seven');
                        chenNum.animation.addByPrefix('eight', 'numbers eight');
                        chenNum.animation.addByPrefix('nine', 'numbers nine');
                        chenNum.cameras = [GUI];
                        chenNumbers.push(chenNum);
                        add(chenNum);
                    }

                    chenArray.push(chenNumbers);

                    var sproutNum:FlxSprite = new FlxSprite(sproutIcon.x + 75, sproutIcon.y + 15);
                    sproutNum.frames = FlxAtlasFrames.fromSparrow('$image/GUI/numbers.png', '$image/GUI/numbers.xml');
                    sproutNum.animation.addByPrefix('zero', 'numbers zero');
                    sproutNum.animation.addByPrefix('one', 'numbers one');
                    sproutNum.animation.addByPrefix('two', 'numbers two');
                    sproutNum.animation.addByPrefix('three', 'numbers three');
                    sproutNum.animation.addByPrefix('four', 'numbers four');
                    sproutNum.animation.addByPrefix('five', 'numbers five');
                    sproutNum.animation.addByPrefix('six', 'numbers six');
                    sproutNum.animation.addByPrefix('seven', 'numbers seven');
                    sproutNum.animation.addByPrefix('eight', 'numbers eight');
                    sproutNum.animation.addByPrefix('nine', 'numbers nine');
                    sproutNum.cameras = [GUI];
                    sproutArray.push(sproutNum);
                    add(sproutNum);

                    updateNum(num, 'chen', chen[num]);
                    updateNum(num, 'sprouts', sprouts[num]);

                    updateItem(num);
                }

            case 'update':
                switch (statChange)
                {
                    case 'blue':
                        chen[activePlayer] = FlxMath.maxAdd(chen[activePlayer], rng, 999, 0);

                        chen = FlxArrayUtil.fastSplice(chen, activePlayer);

                        updateNum(activePlayer, 'chen', chen[activePlayer]);

                    case 'red':
                        chen[activePlayer] = FlxMath.maxAdd(chen[activePlayer], -rng, 999, 0);

                        chen = FlxArrayUtil.fastSplice(chen, activePlayer);

                        updateNum(activePlayer, 'chen', chen[activePlayer]);

                    case 'green':
                        curChar.inventory.push(items[FlxG.random.int(0, items.length - 1)][0]);
                        
                        updateItem(activePlayer);

                    case 'brown':
                        minigame();

                    case 'purple':
                        switch (rng)
                        {
                            case 0:
                                playerMove(FlxG.random.int(1, spaceCount));

                            case 1:
                                chen[activePlayer] = FlxMath.maxAdd(chen[activePlayer], FlxG.random.int(-10, 20), 999, 0);

                                updateNum(activePlayer, 'chen', chen[activePlayer]);

                            case 2:
                                sprouts[activePlayer] += 1;

                                updateNum(activePlayer, 'sprouts', sprouts[activePlayer]);
                        }

                    case 'teal':
                        playerMove(FlxG.random.int(0, 1) == 0 ? rng : -rng);

                    case 'sprout':
                        sprouts[activePlayer] = FlxMath.maxAdd(sprouts[activePlayer], 1, 5, 0);

                        updateNum(activePlayer, 'sprouts', sprouts[activePlayer]);

                    case 'land buy':
                        chen[activePlayer] -= spacePrice[locations[activePlayer]];

                        lands[activePlayer].push(curSpace);

                        chen = FlxArrayUtil.fastSplice(chen, activePlayer);

                        updateNum(activePlayer, 'chen', chen[activePlayer]);

                    case 'land rent':
                        if (chen[activePlayer] < spacePrice[locations[activePlayer]])
                        {
                            trace ('Can\'t afford');

                            changeTurn();
                        }
                        else
                        {
                            chen[activePlayer] -= 2;
                            chen[characters.indexOf(checkOwnership())] += 2;

                            chen = FlxArrayUtil.fastSplice(chen, activePlayer);
                            chen = FlxArrayUtil.fastSplice(chen, characters.indexOf(checkOwnership()));
                        }

                    case 'minigame':
                        for (winner in Minigames.victory)
                        {
                            chen[winner - 1] = FlxMath.maxAdd(chen[winner - 1], 10, 999, 0);

                            updateNum(winner - 1, 'chen', chen[winner - 1]);
                        }

                        FlxG.save.data.chen = chen;
                        FlxG.save.flush();
                }

            case 'item':
                curChar.inventory.push(statChange);

                updateItem(activePlayer);
        }

    function directionChoice()
    {
        deciding = true;
        controlsFree = true;

        arrow = new FlxSprite(curChar.x, curChar.y).loadGraphic('assets/images/GUI/arrow.png');
        add(arrow);

        curChar.animation.play('think');

        switch (locations[activePlayer])
        {
            case 5: curFork = 0;
            case 36: curFork = 1;
        };
    }

    function playerMove(num:Int)
    {
        controlsFree = false;

        curChar.animation.play('walk');

        var altPath:Bool = playerPaths[activePlayer] > -1 ? true : false;

        if (num != 0)
        {
            var wrap:Int = 1;

            var path = playerPaths[activePlayer];

            if (num < 0)
                if (locations[activePlayer] - 1 < 0)
                    wrap = spaceCount;
                else
                    wrap = -1;
            else
                if (locations[activePlayer] + 1 > spaceCount)
                        wrap = -spaceCount;

            var nextSpace = spacePos[locations[activePlayer] + wrap];

            if (altPath)
                if (locationsAlt[activePlayer] + 1 > spaceCountAlt[path])
                {
                    nextSpace = spacePos[merge[path]];

                    playerPaths[activePlayer] = -1;
                    locations[activePlayer] = merge[path];

                    altPath = false;
                }
                else
                    nextSpace = spacePosAlt[path][locationsAlt[activePlayer] + 1];

            FlxTween.tween(curChar, {x: nextSpace.x, y: nextSpace.y}, 0.5, {onComplete: function(tween:FlxTween)
            {
                if (altPath)
                {
                    locationsAlt[activePlayer] += 1;
                    curSpace = spaceTypeAlt[path][locationsAlt[activePlayer]];
                }
                else
                {
                    locations[activePlayer] += wrap;
                    curSpace = spaceType[locations[activePlayer]];
                }

                if (curSpace == 'direction')
                    directionChoice();
                else
                {
                    dice.animation.frameIndex --;

                    if (num < 0)
                        num++;
                    else
                        num--;

                    diceRoll = num;
    
                    playerMove(num);
                }
            }});
        }
        else
        {
            curChar.animation.play('idle');

            playerSpaces[activePlayer].color = spaceColors.get(curSpace);

            dice.destroy();

            if (board == 'party')
                initEvent(curSpace);
            else if (board == 'kingdom')
                if (spaceType[locations[activePlayer]] == null)
                    changeTurn();
                else
                    land();
        }
    }

    public function updateItem(player:Int)
    {
        itemSprites[player] = [];

        for (num => item in characters[player].inventory)
        {
            var sprite:FlxSprite = new FlxSprite(statsUI[player].x + 50 + (num * 20), statsUI[player].y + 50).loadGraphic('assets/images/dice/$item.png');
            sprite.setGraphicSize(25);
            sprite.updateHitbox();
            sprite.cameras = [GUI];
            itemSprites[player].push(sprite);
            add(sprite);
        }
    }

    function minigame()
    {
        cycle += 1;

        controlsFree = false;

        saveData();

        openSubState(new MinigameSelection(0x000000));
    }

    function shop()
    {
        shopping = true;
        controlsFree = true;

        stock = [];
        stockSprites = [];

        var forSale:Array<Int> = [];

        for (i in 0...3)
        {
            var rng = FlxG.random.int(0, items.length - 1, forSale);

            forSale.push(rng);
            stock.push(items[rng]);

            var sprite:FlxSprite = new FlxSprite(400 + (i * 200), 250).loadGraphic('assets/images/dice/${Std.string(items[rng])}.png');
            sprite.cameras = [subCam];
            stockSprites.push(sprite);
            add(sprite);
        }

        itemText = new FlxText(0, 500, 500, '${stock[0]}', 28);
        itemText.screenCenter(X);
        add(itemText);
    }

    function checkOwnership():Character
    {
        for (char => array in lands)
            if (array.contains(curSpace))
                return characters[char];

        return null;
    }

    function sproutCheck()
    {
        playerStats('update', 'sprout');

/*          switch (FlxG.random.int(0, 4))
            {
                case 0: //purchase
                case 1: //minigame
                case 2: //loop board to same space
                case 3: //random question
            }
 */    }

    function updateNum(player:Int, stat:String, num:Int, tens:Int = 0)
        switch (stat)
        {
            case 'chen':
                var curArray = chenArray[player];

                if (num > 9)
                    updateNum(player, stat, num - 10, tens + 1);
                else
                {
                    curArray[0].animation.play('${numArray[tens]}');
                    curArray[1].animation.play('${numArray[num]}');
                }
            case 'sprouts':
                sproutArray[player].animation.play('${numArray[num]}');
        }

    function initBoard()
    {
        if (newGame)
        {
            openSubState(new BoardBegin());

            turnOrder = [];

            FlxG.random.shuffle(characters);

            for (player in characters)
                turnOrder.push(player.player);

            FlxG.save.data.turnOrder = turnOrder;
            FlxG.save.flush();
        }
        else
        {
            // openSubState(new PostMinigame(playerCount));
            
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
        dice = new Dice(curChar.x, curChar.y - 100);
        
        gayCam.follow(curChar);
        gayCam.fade(0.25, true, () -> add(dice));

        turnStart = true;
    }

    function changeTurn()
    {
        activePlayer += 1;

        if (board != 'party')
        {
            activePlayer = FlxMath.wrap(activePlayer, 0, playerCount - 1);

            if (activePlayer == 0)
            {
                cycle ++;
                cycleText.text = '$cycle/$cycleCount';

                saveData();
            }
        }

        gayCam.fade(0.25, startTurn);

        curChar = characters[activePlayer];

        if (activePlayer < playerCount && !newGame)
            curChar.animation.play('think');
    }

    function playerControls()
    {
        inputs = FlxG.inputs.addInput(new FlxActionManager());

        joystick = new FlxActionAnalog();

        up = new FlxActionDigital();
        down = new FlxActionDigital();
        left = new FlxActionDigital();
        right = new FlxActionDigital();

        interact = new FlxActionDigital();
        withdraw = new FlxActionDigital();

        buttons = new FlxActionSet('buttons', [interact, withdraw]);
        directions = new FlxActionSet('directions', [up, down, left, right]);

        inputs.addAction(joystick);
        inputs.addActions([up, down, left, right, interact, withdraw]);

        joystick.addGamepad(LEFT_ANALOG_STICK, MOVED);

        up.addKey(UP, PRESSED);
        down.addKey(DOWN, PRESSED);
        left.addKey(LEFT, PRESSED);
        right.addKey(RIGHT, PRESSED);

        up.addGamepad(DPAD_UP, PRESSED);
        down.addGamepad(DPAD_DOWN, PRESSED);
        left.addGamepad(DPAD_LEFT, PRESSED);
        right.addGamepad(DPAD_RIGHT, PRESSED);

        interact.addKey(SPACE, JUST_PRESSED);
        interact.addGamepad(B, JUST_PRESSED);
        
        withdraw.addKey(ESCAPE, JUST_PRESSED);
        withdraw.addGamepad(A, JUST_PRESSED);

        for (controller in controllers)
        {
            inputs.activateSet(inputs.getSetIndex('buttons'), GAMEPAD, controller.id);
            inputs.activateSet(inputs.getSetIndex('joystick'), GAMEPAD, controller.id);
        }
    }

    function changeSelection(num:Int)
    {
        selected = FlxMath.maxAdd(selected, num, stock.length - 1, 0);

        for (num => item in stockSprites)
            item.alpha = (num == selected) ? 1 : 0.5;

        itemText.text = stock[selected][2];
    }

    function saveData()
    {
        FlxG.save.data.newGame = false;

        FlxG.save.data.cycle = cycle;
        FlxG.save.data.turnOrder = turnOrder;
        FlxG.save.data.locations = locations;
        FlxG.save.data.locationsAlt = locationsAlt;

        FlxG.save.data.playerPaths = playerPaths;
        
        FlxG.save.data.chen = chen;
        FlxG.save.data.sprouts = sprouts;

        FlxG.save.data.lands = lands;

        FlxG.save.data.itemSprites = itemSprites;

        FlxG.save.data.inventory1 = characters[0].inventory;
        FlxG.save.data.inventory2 = characters[1].inventory;
        FlxG.save.data.inventory3 = characters[2].inventory;
        FlxG.save.data.inventory4 = characters[3].inventory;

        FlxG.save.data.boardGame = boardGame;

        FlxG.save.flush();
    }
}