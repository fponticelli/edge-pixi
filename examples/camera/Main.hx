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
        ui = new Container(),
        gameWorldRendering = new Renderer(renderer, gameWorld),
        uiRendering = new UIRenderer(renderer, ui);

    // set some dimensions
    gameWorld.width = 1600;
    gameWorld.height = 1200;

    // add some trees to the game world
    for (i in 0...60) {
      var sprite = Display.fromImagePath('assets/bunny.png');
      sprite.node.x = r(1600);
      sprite.node.y = r(1200);
      world.engine.create([ sprite ]);
    }

    var myCam = new Camera(0, 0);
    world.engine.create([
      myCam,
      new Widget(gameWorld)
    ]);

    var stationaryBunny = Widget.fromImagePath('assets/bunny.png');
    stationaryBunny.node.x = 50;
    stationaryBunny.node.y = 400;
    world.engine.create([ stationaryBunny ]);

    // stage.addChild(gameWorld);
    stage.addChild(ui);
    ui.addChild(gameWorld);

    world.render.add(gameWorldRendering);
    world.render.add(new PositionCamera());
    world.render.add(uiRendering);
    world.start();

    thx.Timer.repeat(function () {
      myCam.x++;
      myCam.y++;
    }, 50);
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
