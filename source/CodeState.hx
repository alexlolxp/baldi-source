package;

import openfl.ui.KeyLocation;
import openfl.events.Event;
import haxe.EnumTools;
import openfl.ui.Keyboard;
import openfl.events.KeyboardEvent;
import Replay.Ana;
import Replay.Analysis;
#if cpp
import webm.WebmPlayer;
#end
import flixel.input.keyboard.FlxKey;
import haxe.Exception;
import openfl.geom.Matrix;
import openfl.display.BitmapData;
import openfl.utils.AssetType;
import lime.graphics.Image;
import flixel.graphics.FlxGraphic;
import openfl.utils.AssetManifest;
import openfl.utils.AssetLibrary;
import flixel.system.FlxAssets;

import lime.app.Application;
import lime.media.AudioContext;
import lime.media.AudioManager;
import openfl.Lib;
import Section.SwagSection;
import Song.SwagSong;
import WiggleEffect.WiggleEffectType;
import flixel.FlxBasic;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.atlas.FlxAtlas;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;
import flixel.util.FlxCollision;
import flixel.util.FlxColor;
import flixel.util.FlxSort;
import flixel.util.FlxStringUtil;
import flixel.util.FlxTimer;
import haxe.Json;
import lime.utils.Assets;
import openfl.display.BlendMode;
import openfl.display.StageQuality;
import openfl.filters.ShaderFilter;
import flixel.addons.ui.FlxInputText;
import flixel.addons.ui.FlxUIInputText;

class CodeState extends MusicBeatState
{
var bg:FlxSprite;
var yctp:FlxSprite;

var num1:Int = 0;
var num2:Int = 0;
var num3:Int = 0;
var num4:Int = 0;
var num5:Int = 0;

var numtext1 = new FlxText(FlxG.width / 6, FlxG.height / 2, 0, '0', 23);
var numtext2 = new FlxText(FlxG.width / 6, FlxG.height / 2, 0, '0', 23);
var numtext3 = new FlxText(FlxG.width / 6, FlxG.height / 2, 0, '0', 23);
var numtext4 = new FlxText(FlxG.width / 6, FlxG.height / 2, 0, '0', 23);
var numtext5 = new FlxText(FlxG.width / 6, FlxG.height / 2, 0, '0', 23);

override function create() 
    {
        bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
        bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0;
		bg.setGraphicSize(Std.int(bg.width * 1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;

        yctp = new FlxSprite().loadGraphic(Paths.image('da schoolhouse/baldi/yctp', 'shared'));
        yctp.scrollFactor.x = 0;
		yctp.scrollFactor.y = 0;
		yctp.setGraphicSize(Std.int(yctp.width * 2));
		yctp.updateHitbox();
		yctp.screenCenter();
		yctp.antialiasing = true;
    }
}