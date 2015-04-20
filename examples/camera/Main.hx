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

    world.render.add(renderingSystem);
    world.start();
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
