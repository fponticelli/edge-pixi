package edge.pixi.systems;

import edge.Entity;
import edge.ISystem;
import pixi.core.renderers.SystemRenderer;
import pixi.core.display.Container;
import edge.pixi.components.Display;

class Renderer implements ISystem {
  public var stage(default, null) : Container;
  public var renderer(default, null) : SystemRenderer;
	var entities : View<{ d : Display }>;

  public function new(renderer : SystemRenderer, ?stage : Container) {
    if(null != stage)
      this.stage = stage;
    else
      this.stage = new Container();
    this.renderer = renderer;
  }

	public function entitiesAdded(e : Entity, data : { d : Display }) {
    stage.addChild(data.d.node);
  }

  public function entitiesRemoved(e : Entity, data : { d : Display }) {
    stage.removeChild(data.d.node);
  }

  public function update() {
    renderer.render(stage);
  }
}
