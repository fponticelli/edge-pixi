import pixi.core.renderers.SystemRenderer;
import pixi.core.renderers.Detector;
import js.Browser;

import edge.pixi.components.*;
import edge.pixi.systems.*;

class Main {
	public function new(renderer : SystemRenderer) {
    var world = new edge.World(),
				rendererSystem = new Renderer(renderer);

		// interaction
		world.physics.add(new MouseBunnyCreator(rendererSystem.stage));

		// physics
		world.physics.add(new UpdatePositionVelocity());
		world.physics.add(new UpdateRotationVelocity());

    // rendering systems
		world.render.add(new UpdatePosition());
		world.render.add(new UpdateRotation());
    world.render.add(rendererSystem);

		world.frame.add(new BunnyExterminator(800, 600, 30));

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
