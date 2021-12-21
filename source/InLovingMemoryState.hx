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
import flixel.input.keyboard.FlxKeyboard;
import flixel.input.keyboard.FlxKey;

class InLovingMemoryState extends MusicBeatState
{
	public static var leftState:Bool = false;
	
	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('Dee', 'shared'));
		bg.screenCenter();
		add(bg);

		FlxG.sound.music.fadeIn(4, 0, 0.7);
	}

	override function update(elapsed:Float)
	{

		if (controls.ACCEPT)
		{
            fancyOpenURL("https://www.suicidestop.com/call_a_hotline.html");
		}

		if (controls.BACK)
		{
			leftState = true;
			FlxG.switchState(new TitleState());
		}
		super.update(elapsed);
	}
}