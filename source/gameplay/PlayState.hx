package gameplay;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.ogmo.FlxOgmo3Loader;

import assets.Character;
import managers.Everything;
import gameplay.CharacterSelect;

class PlayState extends Everything
{
	var board:FlxOgmo3Loader;
	var tiles:FlxTilemap;

	public var player1:Character;
	public var player2:Character;
	public var player3:Character;
	public var player4:Character;

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

		playerLocations = new Map<Character, Int>();

		player1 = new Character(CharacterSelect.character1);
		characters.push(player1);
		add(player1);

		if (CharacterSelect.playerCount >= 2)
		{
			player2 = new Character(CharacterSelect.character2);
			characters.push(player2);
			add(player2);
		}

		if (CharacterSelect.playerCount >= 3)
		{
			player3 = new Character(CharacterSelect.character3);
			characters.push(player3);
			add(player3);
		}

		if (CharacterSelect.playerCount >= 4)
		{
			player4 = new Character(CharacterSelect.character4);
			characters.push(player4);
			add(player4);
		}

		for (player in characters)
			playerLocations.set(player, -1);

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

		trace ('Player ${activePlayer + 1} rolled $num');

		return num;
	}

	function initTurnOrder()
	{
		FlxG.random.shuffle(characters);
	}

	function playerMove(num:Int = null)
	{
		if (num > 0)
		{
			var x:Int = spaceArray[playerLocations.get(characters[activePlayer]) + 1][0];
			var y:Int = spaceArray[playerLocations.get(characters[activePlayer]) + 1][1];

			FlxTween.tween(characters[activePlayer], {x: x, y: y}, 0.5, {onComplete: function (tween:FlxTween)
			{
				playerLocations.set(characters[activePlayer], playerLocations.get(characters[activePlayer]) + 1);

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
		activePlayer = FlxMath.wrap(activePlayer, 0, characters.length - 1);
	}

	function placeObjects(object:EntityData)
		for (i => character in characters)
			character.setPosition(object.x, object.y - (i * 10));
}