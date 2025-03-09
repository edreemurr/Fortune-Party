package gameplay;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxTween;

import assets.BoardInfo;
import assets.Character;
import gameplay.CharacterSelect;

class BoardGame extends BoardInfo
{
	override public function create()
	{
		FlxG.mouse.visible = false;

		#if DEBUG
		FlxG.watch.add(activePlayer, 'Active Player');
		#end

		for (i in 0...spaceArray.length)
		{
			var space:FlxSprite = new FlxSprite(spaceArray[i][1], spaceArray[i][2]).loadGraphic('assets/images/spaces/${spaceArray[i][0]}.png');
			add(space);
		}

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
		if (controls.ENTER && controlsFree)
		{
			diceRoll = rollDice();

			playerMove(diceRoll);
		}

		super.update(elapsed);
	}

	function initTurnOrder()
	{
		FlxG.random.shuffle(characters);

		playerStats();

		controlsFree = true;
	}

	function playerMove(num:Int)
	{
		controlsFree = false;

		if (num > 0)
		{
			var wrap:Int = (playerLocations.get(characters[activePlayer]) + 1) > spaceCount ? -spaceCount : 1;

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
}