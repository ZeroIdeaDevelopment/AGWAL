package;

import flixel.FlxGame;
import openfl.display.Sprite;
import states.SplashState;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, SplashState, 1, 60, 60, true));
	}
}
