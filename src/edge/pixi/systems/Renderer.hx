package edge.pixi.systems;

import edge.Entity;
import edge.ISystem;
import pixi.core.renderers.SystemRenderer;
import pixi.core.display.Container;

class PixiRenderer implements ISystem {
  public var stage(default, null) : Container;
  public var renderer(default, null) : SystemRenderer;

  public function new(stage : Container, renderer : SystemRenderer) {
    this.stage = stage;
    this.renderer = renderer;
  }

  public function update() {
    renderer.render(stage);
  }
}
