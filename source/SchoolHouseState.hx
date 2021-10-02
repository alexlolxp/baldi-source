package;

import flixel.input.gamepad.FlxGamepad;
import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import io.newgrounds.NG;
import lime.app.Application;

class SchoolHouseState extends MusicBeatState
{
    public var moved:Bool = false;
    public var curSelected:Int = 0;
    public var principal:FlxSprite;
    public var baldo:FlxSprite;
    public var charList:Array<String> = [
        'baldi',
        'principalnull',
        'principal'
    ];
    public var sprites:Array<FlxSprite> = [];

    public var bg:FlxSprite;
    public var bgColors:Array<String> = [
		'#78AE84',
		'#A49F86',
	];
    
    public var finishedSong:Bool = false;
    
    public var diffText:FlxText;
    public var scoreText:FlxText;

    private var curIdx:Int = 0;
    private var backToMenu = false;

    override function create()
    {
        //music
        if (!FlxG.sound.music.playing)
        {
            FlxG.sound.playMusic(Paths.music('freakyMenu'));
        }
        
        //bg
        bg = new FlxSprite(-100).loadGraphic(Paths.image('schoolhouseBG'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		add(bg);

        //sprites (ik this is confusing but this is how to make it actually work lol)
        for (i in 0...charList.length)
        {
            var char = charList[i];
            var curImage:FlxSprite;

            if (i > 3)
            {
                curImage = new FlxSprite(0, 0, Paths.image('da schoolhouse/schoolhouse' + char));
                curImage.screenCenter();
                curImage.visible = i == curIdx;
                curImage.antialiasing = true;          
                sprites.push(curImage);
                add(curImage);
            }
        }
    }

    override function update(elapsed:Float) 
    {
        if (backToMenu)
        {
            super.update(elapsed);
            return;
        }

        if (controls.BACK && !backToMenu)
        {
            FlxG.sound.music.stop();
            FlxG.sound.play(Paths.sound('cancelMenu'));
            backToMenu = true;
            FlxG.switchState(new MainMenuState());
        }

        var gamepad:FlxGamepad = FlxG.gamepads.lastActive;

        if (controls.LEFT || (gamepad != null && gamepad.pressed.DPAD_LEFT))
        {
            changeItem(-1);
        }

        if (controls.RIGHT || (gamepad != null && gamepad.pressed.DPAD_RIGHT))
        {
            changeItem(1);
        }

        super.update(elapsed);
    }

    private function changeItem(increment) 
    {
        curIdx = FlxMath.wrap(curIdx + increment, 0, sprites.length - 1);

        for (i in 0...sprites.length)
        {
        sprites[i].visible = (i == curIdx);
        }

        FlxG.sound.play(Paths.sound('scrollMenu'));
    }
}