import pixi.core.renderers.SystemRenderer;
import pixi.core.renderers.Detector;
import js.Browser;

import edge.pixi.components.*;
import edge.pixi.systems.*;

class Main {
	public function new(renderer : SystemRenderer) {
    var world = new edge.World();

		var bunny = world.engine.create([
			DisplaySprite.fromImagePath("assets/bunny.png"),
			new Position(100, 100)
		]);

		// physics
		world.physics.add(new UpdatePosition());

    // rendering systems
    world.render.add(new Renderer(renderer));

		// run
		world.start();
	}

	static function main() {
		var options : RenderingOptions = {
            resolution : 1,
            backgroundColor : 0x090909
          },
        renderer = Detector.autoDetectRenderer(800, 600, options);
    Browser.document.body.appendChild(renderer.view);
    new Main(renderer);
	}
}
