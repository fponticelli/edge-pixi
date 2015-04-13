import pixi.core.renderers.SystemRenderer;
import pixi.core.renderers.Detector;
import js.Browser;

import edge.pixi.components.*;
import edge.pixi.systems.*;

class MouseBunnyCreator extends edge.pixi.cosystems.MouseSystem implements edge.ISystem {
	var engine : edge.Engine;

	public function new(stage : pixi.core.display.Container) {
		super(stage);
	}

	static function r() {
		return (Math.random() < 0.5 ? -1 : 1) * Math.random() * Math.random();
	}

	function createBunny(x : Float, y : Float) {
		var sprite = DisplaySprite.fromImagePath("assets/bunny.png");
		sprite.sprite.anchor.x = 0.5;
		sprite.sprite.anchor.y = 0.5;
		return engine.create([
			sprite,
			new Position(x, y),
			new Rotation(0),
			new RotationVelocity(r() * 0.3),
			new PositionVelocity(r()+dx, r()+dy)
		]);
	}

	function update() {
		if(isDown) {
			for(i in 0...10)
			createBunny(x, y);
		}
	}
}
