package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;

class CreditsState extends MusicBeatState
{
	public static var leftState:Bool = false;
	
	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('da schoolhouse/piracy/piracy baldi/creepercreeper', 'shared'));
		bg.screenCenter();
		
		add(bg);
		
		FlxG.sound.playMusic(Paths.music('creepercreeper'), 0);

		FlxG.sound.music.fadeIn(4, 0, 0.7);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}