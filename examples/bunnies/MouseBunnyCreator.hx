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
		var sprite = Display.fromImagePath("assets/bunny.png", 0.5, 0.5);
		sprite.node.x = x;
		sprite.node.y = y;
		return engine.create([
			sprite,
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
