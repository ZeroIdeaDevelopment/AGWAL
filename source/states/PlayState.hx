package states;

import flixel.FlxG;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxState;

class PlayState extends FlxState {

    var warningText: FlxText;
    var pressSpace: FlxText;
    var spaceKeyFadedIn = false;

    override public function create():Void {
        super.create();
        warningText = new FlxText(1, 1, "WARNING:\nYour mum is the big homosex.", 15);
        pressSpace = new FlxText(1, 1, "[Press SPACE to continue]", 12);
        warningText.screenCenter();
        pressSpace.screenCenter();
        pressSpace.y = 480 - 20;
        FadeHelper.fadeIn(warningText, function(tween: FlxTween) {
            var timer = new FlxTimer();
            timer.time = 1;
            timer.start();
            timer.onComplete = function(timer: FlxTimer) {
                FadeHelper.fadeIn(pressSpace, function(tween: FlxTween) {spaceKeyFadedIn = true;});
                add(pressSpace);
            };
        }, null, FlxColor.fromRGB(255, 0, 0, 255));
        add(warningText);
    }

    override public function update(elapsed: Float):Void {
        super.update(elapsed);
        if (spaceKeyFadedIn) {
            if (FlxG.keys.justPressed.SPACE) {
                FadeHelper.fadeOut(warningText, function(tween: FlxTween) {
                    throw "oopsies";
                }, null, FlxColor.fromRGB(255, 0, 0, 255));
                FadeHelper.fadeOut(pressSpace);
                spaceKeyFadedIn = false;
            }
        }
    }

}