package gameplay;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.ogmo.FlxOgmo3Loader;

import managers.Everything;

import assets.Character;

class PlayState extends Everything
{
	var board:FlxOgmo3Loader;
	var tiles:FlxTilemap;

	public static var player1:Character;
	public static var player2:Character;
	public static var player3:Character;
	public static var player4:Character;

	var players:Array<Character> = [];

	var activePlayer:Int = 0;
	var diceRoll:Int = 0;

	var spaceArray:Array<Array<Int>>;

	var playerLocations:Map<Character, Int>;

	override public function create()
	{
		FlxG.mouse.visible = false;

		#if DEBUG
		FlxG.watch.add(activePlayer, 'Active Player');
		#end

		spaceArray = [[240, 190], [200, 190], [175, 190], [145, 190], [110, 190], [80, 175], [65, 144], [65, 110], [80, 80], [112, 64], [145, 80], [175, 95], [210, 95], [240, 80], [270, 50]];

		board = new FlxOgmo3Loader(AssetPaths.test__ogmo, AssetPaths.demo__json);

		tiles = board.loadTilemap(AssetPaths.tiles__png, 'spaces');
		tiles.follow();
		add(tiles);

		for (i in 0...4)
			tiles.setTileProperties(i, NONE);

		player1 = new Character(FlxColor.RED);
		players.push(player1);
		add(player1);

		player2 = new Character(FlxColor.BLUE);
		players.push(player2);
		add(player2);

		player3 = new Character(FlxColor.GREEN);
		players.push(player3);
		add(player3);

		player4 = new Character(FlxColor.YELLOW);
		players.push(player4);
		add(player4);

		playerLocations = new Map<Character, Int>();
		playerLocations.set(player1, -1);
		playerLocations.set(player2, -1);
		playerLocations.set(player3, -1);
		playerLocations.set(player4, -1);

		board.loadEntities(placeObjects, 'players');

		initTurnOrder();

		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (controls.ENTER)
		{
			diceRoll = rollDice();

			playerMove(diceRoll);
		}

		super.update(elapsed);
	}

	function rollDice():Int
	{
		var num:Int = FlxG.random.int(1, 6);

		trace ('${players[activePlayer]} rolled $num');

		return num;
	}

	function initTurnOrder()
	{
		FlxG.random.shuffle(players);

		trace (players[0], players[1], players[2], players[3]);
	}

	function playerMove(num:Int = null)
	{
		if (num > 0)
		{
			var x:Int = spaceArray[playerLocations.get(players[activePlayer]) + 1][0];
			var y:Int = spaceArray[playerLocations.get(players[activePlayer]) + 1][1];

			FlxTween.tween(players[activePlayer], {x: x, y: y}, 0.5, {onComplete: function (tween:FlxTween)
			{
				playerLocations.set(players[activePlayer], playerLocations.get(players[activePlayer]) + 1);

				num--;

				playerMove(num);
			}});
		}
		else
			initEvent();
	}

	function initEvent()
	{
		activePlayer += 1;
		activePlayer = FlxMath.wrap(activePlayer, 0, players.length - 1);
	}

	function placeObjects(object:EntityData)
        switch (object.name)
        {
            case 'player1': PlayState.player1.setPosition(object.x, object.y);
            case 'player2': PlayState.player2.setPosition(object.x, object.y);
            case 'player3': PlayState.player3.setPosition(object.x, object.y);
            case 'player4': PlayState.player4.setPosition(object.x, object.y);
            default: FlxG.log.warn('Never seen "${object.name}" before in my life fam');
        }
}