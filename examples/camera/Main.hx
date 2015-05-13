import js.Browser;
import pixi.core.display.Container;
import pixi.core.renderers.SystemRenderer;
import pixi.core.renderers.Detector;
import pixi.core.math.Point;

import edge.pixi.components.*;
import edge.pixi.systems.*;

class Main {
  public function new(renderer : SystemRenderer) {
    var world = new edge.World(),
        stage = new Container(),
        gameWorld = new Container(),
        camera = new Container(),
        gameWorldRendering = new Renderer(renderer, gameWorld),
        cameraRendering = new CameraRenderer(renderer, camera);

    // set some dimensions
    gameWorld.width = 1600;
    gameWorld.height = 1200;
    camera.width = 800;
    camera.height = 600;

    // add some trees to the game world
    for (i in 0...60) {

    }

    stage.addChild(gameWorld);
    stage.addChild(camera);

    world.render.add(gameWorldRendering);
    world.start();
  }

  function r(lessThan : Float) {
    return Math.floor(Math.random() * lessThan);
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
