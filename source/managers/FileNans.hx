package managers;

import flixel.FlxG;

class FileNans
{
    inline public static function locateSave():String
    {
        final company:String = FlxG.stage.application.meta.get('company');
        final file:String = FlxG.stage.application.meta.get('file');

        return '$company/$file';
    }
}