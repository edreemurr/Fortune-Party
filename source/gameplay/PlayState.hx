package gameplay;

import flixel.FlxG;
import flixel.math.FlxMath;

import managers.Everything;

import assets.Character;

class PlayState extends Everything
{
	public var player1:Character;
	public var player2:Character;
	public var player3:Character;
	public var player4:Character;

	var players:Array<Character> = [];
	var turnOrder:Array<Character> = [];

	var activePlayer:Int = 0;

	var diceRoll:Int = 0;

	override public function create()
	{
		FlxG.mouse.visible = false;

		#if CRASH_HANDLER
		FlxG.watch.add(activePlayer, 'Active Player');
		#end

		// var background:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		// add(background);

		player1 = new Character();
		players.push(player1);
		add(player1);

		player2 = new Character();
		players.push(player2);
		add(player2);

		player3 = new Character();
		players.push(player3);
		add(player3);

		player4 = new Character();
		players.push(player4);
		add(player4);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (controls.ENTER)
		{
			FlxG.log.notice('ENTER button pressed');

			diceRoll = rollDice();

			playerMove(diceRoll);
			
			activePlayer += 1;
			activePlayer = FlxMath.wrap(activePlayer, 0, players.length - 1);
		}

		super.update(elapsed);
	}

	function rollDice():Int
	{
		var num:Int = FlxG.random.int(1, 6);

		FlxG.log.notice('${players[activePlayer]} rolled $num');

		return num;
	}

	function playerMove(num:Int = null)
		players[activePlayer].x += num * 10;
}