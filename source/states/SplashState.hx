package states;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.system.FlxAssets;

class SplashState extends FlxState
{
	var text: FlxText;
	var zidLogo: FlxSprite;

	override public function create():Void
	{
		super.create();
		FlxG.mouse.useSystemCursor = true;
		text = new FlxText(1, 1, "ZeroIdea Development", 32);
		text.screenCenter();
		text.y = 340;
		zidLogo = new FlxSprite(0, 0);
		zidLogo.loadGraphic("assets/images/zid.png");
		zidLogo.scale.set(.3, .3);
		zidLogo.scale.set(1, 1);
		zidLogo.screenCenter();
		FadeHelper.fadeIn(text);
		FadeHelper.fadeIn(zidLogo, playJingle);
		add(text);
		add(zidLogo);
	}

	function playJingle(tween: FlxTween):Void {
		var sound = FlxG.sound.load("assets/music/zid.ogg");
		sound.play();
		sound.onComplete = function() {
			FadeHelper.fadeOut(text);
			FadeHelper.fadeOut(zidLogo, switchScene);
		}
	}

	function switchScene(tween: FlxTween):Void {
		FlxG.switchState(new HFlState());
	}

	override public function update(elapsed: Float):Void {
		super.update(elapsed);
	}
}
