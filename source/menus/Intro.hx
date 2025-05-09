package menus;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.addons.text.FlxTypeText;

import managers.Everything;

class Intro extends Everything
{
    var text:FlxTypeText;

    var dialogue:Array<String>;

    var progress:Int = 0;

    var skipped:Bool = false;

    override function create()
    {
        text = new FlxTypeText(0, 300, 1000, '', 28);
        text.completeCallback = () -> skipped = true;
        text.alignment = CENTER;
        text.screenCenter(X);
        add(text);

        var skipText:FlxText = new FlxText(1100, 675, 500, 'ESC to menu', 20);
        add(skipText);

        dialogue = [
            'Welcome to Fortune Party\n(title subject to change)',
            'This will be similar to other popular party-style games but is planned to be a mesh of a few different party games I love',
            'Currently, only one main inpiration has been implemented as a very basic level',
            'This is my first (mostly) full-solo project and I have many ideas I\'m excited to add but wasn\'t able to fit it all in before the Blank Page game jam\'s deadline',
            'I will continue to work on this game to bring in all my ideas in the future',
            'For now though, I\'ve made a simple quick demo as a showcase of what I\'ve done and hope to do\n\nCurrently only single-player with a couple small minigames but of course intend to add in multiplayer at some point',
            'It\'s been my dream for a long time to create my own games with my own twists on already-existing concepts and potentially some brand new concepts',
            'I\'m proud to have even gotten this far myself and look forward to what the future brings for my \"career\" as an indie game dev',
            'Please enjoy and feel free to give feedback'
        ];

        writeText(0);

        super.create();
    }

    override function update(elapsed:Float)
    {
        if (controls.ENTER)
            if (progress > dialogue.length - 1 && skipped)
                FlxG.switchState(Title.new);
            else
                if (skipped)
                    writeText(progress);
                else
                {
                    text.skip();

                    skipped = true;
                }

        if (FlxG.keys.justPressed.ESCAPE)
            FlxG.switchState(Title.new);

        super.update(elapsed);
    }

    function writeText(num:Int)
    {
        skipped = false;

        text.resetText(dialogue[num]);
        text.start(0.04);

        progress += 1;
    }
}