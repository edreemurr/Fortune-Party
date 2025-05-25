package;

import openfl.events.GameInputEvent;
import openfl.ui.GameInputDevice;
import openfl.ui.GameInput;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxState;
import lime.app.Application;

import openfl.Lib;
import openfl.display.Sprite;
import openfl.events.Event;

import managers.FileNans;
import managers.Settings.GameSettings;
import managers.Settings.SaveData;

using StringTools;

#if sys
import sys.*;
import sys.io.*;
#elseif js
import js.html.*;
#end

#if CRASH_HANDLER
import haxe.CallStack;
import haxe.io.Path;
import openfl.events.UncaughtErrorEvent;
#end

class Main extends Sprite
{
	public function new()
	{
		super();

		if (stage != null)
			init();
		else
			addEventListener(Event.ADDED_TO_STAGE, init);

        var input = new GameInput();
        var device:GameInputDevice;

        input.addEventListener(GameInputEvent.DEVICE_ADDED, function (event:GameInputEvent)
        {
            device = event.device;
            device.enabled = true;
        });

        stage.addEventListener(Event.ENTER_FRAME, function (event:Event)
            trace ([for (i in 0...device.numControls) device.getControlAt(i).value]));
	}

	private function init(?E:Event):Void
	{
		// if (hasEventListener(Event.ADDED_TO_STAGE))
		// 	removeEventListener(Event.ADDED_TO_STAGE, init);

		bootUp();
	}

	private function bootUp():Void
	{
		if (FlxG.save.data == null)
			FlxG.save.bind('saveFile', FileNans.locateSave());

		SaveData.loadDefaultButtons();

		addChild(new FlxGame(menus.Title, true));

		#if CRASH_HANDLER
		Lib.current.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, onCrash);
		#end

		FlxG.signals.gameResized.add(function(w, h)
		{
			if (FlxG.cameras != null)
				for (cam in FlxG.cameras.list)
					if (cam != null && cam.filters != null)
						resetSpriteCache(cam.flashSprite);

			if (FlxG.game != null)
				resetSpriteCache(FlxG.game);
		});
	}

	static function resetSpriteCache(sprite:Sprite):Void
	{
		@:privateAccess
		{
			sprite.__cacheBitmap = null;
			sprite.__cacheBitmapData = null;
		}
	}
	#if CRASH_HANDLER
	function onCrash(e:UncaughtErrorEvent):Void
	{
		var message:String = '';
		var path:String;
		var callStack:Array<StackItem> = CallStack.exceptionStack(true);
		var today:String = Date.now().toString();

		today = today.replace(' ', '_');
		today = today.replace(':', "'");

		path = './crash/FortuneParty_$today.txt';

		for (stack in callStack)
			switch (stack)
			{
				case FilePos(s, file, line, column):
					message += '$file (line $line)\n';

				default:
					Sys.println(stack);
			}
		message += '\nUncaught Error: ${e.error}';

		if (!FileSystem.exists('./crash/'))
			FileSystem.createDirectory('./crash/');

		File.saveContent(path, 'message\n');

		Sys.println(message);
		Sys.println('Crash dump saved in ${Path.normalize(path)}');

		Application.current.window.alert(message, 'Error');

		Sys.exit(1);
	}
	#end
}