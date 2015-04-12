package edge.pixi.systems;

import edge.Entity;
import edge.ISystem;
import pixi.core.renderers.SystemRenderer;
import pixi.core.display.Container;

class PixiRenderer implements ISystem {
  public var stage(default, null) : Container;
  public var renderer(default, null) : SystemRenderer;
	var entities : View<{ d : Display}>;

  public function new(stage : Container, renderer : SystemRenderer) {
    this.stage = stage;
    this.renderer = renderer;
  }

	public function entitiesAdded(e : Entity, data : { d : Display}) {
    stage.addChild(data.d.sprite);
  }

  public function entitiesRemoved(e : Entity, data : { d : Display}) {
    stage.removeChild(data.d.sprite);
  }

  public function update() {
    renderer.render(stage);
  }
}
