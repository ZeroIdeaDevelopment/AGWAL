package states;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.system.FlxAssets;

class HFlState extends FlxState
{
	var hflText: FlxText;
	var hflLogo: FlxSprite;

	override public function create():Void
	{
		super.create();
		FlxG.mouse.useSystemCursor = true;
		hflText = new FlxText(1, 1, "Powered by " + FlxG.VERSION, 32);
		hflText.screenCenter();
        hflText.y = 340;
		hflLogo = new FlxSprite(0, 0);
		hflLogo.loadGraphic("assets/images/haxeflixel.png");
        hflLogo.scale.set(.7, .7);
		hflLogo.screenCenter();
		FadeHelper.fadeIn(hflText);
		FadeHelper.fadeIn(hflLogo, playJingle);
		add(hflText);
		add(hflLogo);
	}

	function playJingle(tween: FlxTween):Void {
		var sound = FlxG.sound.load(FlxAssets.getSound("flixel/sounds/flixel"));
		sound.play();
		sound.onComplete = function() {
			FadeHelper.fadeOut(hflText);
			FadeHelper.fadeOut(hflLogo, switchScene);
		}
	}

	function switchScene(tween: FlxTween):Void {
		FlxG.switchState(new PlayState());
	}

	override public function update(elapsed: Float):Void {
		super.update(elapsed);
	}
}
