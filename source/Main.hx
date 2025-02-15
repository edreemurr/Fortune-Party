package;

import flixel.FlxG;
import flixel.FlxGame;
import managers.Controls;
import managers.FileNans;
import managers.Settings.GameSettings;
import managers.Settings.SaveData;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		
		addChild(new FlxGame(0, 0, gameplay.PlayState));
	}

	private function bootUp():Void
	{
		FlxG.save.bind('saveFile', FileNans.locateSave());

		Controls.instance = new Controls();

		SaveData.loadDefaultButtons();
	}
}
