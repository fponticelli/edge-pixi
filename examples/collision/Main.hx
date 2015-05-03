import js.Browser;
import pixi.core.renderers.SystemRenderer;
import pixi.core.renderers.Detector;
import pixi.core.math.Point;

import edge.pixi.components.*;
import edge.pixi.systems.*;

class Main {
  public function new(renderer : SystemRenderer) {
    var world = new edge.World(),
        renderingSystem = new Renderer(renderer);

    for (i in 0...20) {
      var posX = Math.random() * 800;
      var posY = Math.random() * 600;

      world.engine.create([
        new Position(posX, posY),
        new PositionVelocity(r(), r()),
        new HitArea(new Point(posX, posY), Math.random() * 10 + 15)
      ]);
    }

    world.render.add(renderingSystem);
    world.render.add(new UpdateGeometryPosition(renderingSystem.container));

    world.start();
  }

	static function r() {
		return (Math.random() < 0.5 ? -1 : 1) * Math.random() * Math.random();
	}

  static function main() {
		var options : RenderingOptions = {
            resolution : 1,
            backgroundColor : 0xf2f2f2
          },
        renderer = Detector.autoDetectRenderer(800, 600, options);
    Browser.document.body.appendChild(renderer.view);
    new Main(renderer);
  }
}
