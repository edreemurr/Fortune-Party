package gameplay;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxTween;

import assets.Character;
import managers.Everything;
import gameplay.CharacterSelect;

class PlayState extends Everything
{
	public var player1:Character;
	public var player2:Character;
	public var player3:Character;
	public var player4:Character;

	var diceRoll:Int = 0;

	var startPos:Array<Int>;

	var spaceArray:Array<Array<Dynamic>>;

	var playerLocations:Map<Character, Int>;

	override public function create()
	{
		FlxG.mouse.visible = false;

		#if DEBUG
		FlxG.watch.add(activePlayer, 'Active Player');
		#end

		startPos = [600, 650];
		spaceCount = 13;

		spaceArray = [['blue', 634, 546], ['blue', 500, 543], ['red', 380, 490], ['blue', 294, 400], ['green', 325, 285], ['red', 413, 191], ['brown', 511, 115], ['blue', 633, 105], ['blue', 766, 115], ['brown', 872, 154], ['green', 948, 237], ['blue', 971, 343], ['brown', 887, 456], ['red', 768, 522]];

		for (i in 0...spaceArray.length)
		{
			var space:FlxSprite = new FlxSprite(spaceArray[i][1], spaceArray[i][2]).loadGraphic('assets/images/spaces/${spaceArray[i][0]}.png');
			add(space);
		}

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

		for (num => character in characters)
		{
			playerLocations.set(character, -1);
			character.setPosition(startPos[0], startPos[1] - (num * 10));
		}

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

		playerStats();
	}

	function playerMove(num:Int)
	{
		if (num > 0)
		{
			var wrap:Int = (playerLocations.get(characters[activePlayer]) + 1) > spaceCount ? -spaceCount : 1;
			trace (wrap);

			var x:Int = spaceArray[playerLocations.get(characters[activePlayer]) + wrap][1];
			var y:Int = spaceArray[playerLocations.get(characters[activePlayer]) + wrap][2];
			
			FlxTween.tween(characters[activePlayer], {x: x, y: y}, 0.5, {onComplete: function(tween:FlxTween)
			{
				playerLocations.set(characters[activePlayer], playerLocations.get(characters[activePlayer]) + wrap);

				num--;

				playerMove(num);
			}});
		}
		else
			initEvent(spaceArray[playerLocations.get(characters[activePlayer])][0]);
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

		FlxTween.tween(space, {alpha: 0}, 1, {onComplete: function(tween:FlxTween)
		{
			activePlayer += 1;
			activePlayer = FlxMath.wrap(activePlayer, 0, characters.length - 1);

			space.destroy();
			space.kill();
		}});
	}

	function playerStats(event:String = 'create')
	{
		if (event == 'create')
		{
			for (num => char in characters)
			{
				var player:FlxSprite = new FlxSprite(20, 20 + (num * 30)).loadGraphicFromSprite(char);
				player.setGraphicSize(15);
				add(player);

				var stats:FlxText = new FlxText(player.x + 20, player.y, 'Coins: 10', 20);
				add(stats);
			}
		}
	}
}