package edge.pixi.systems;

import edge.Entity;
import edge.ISystem;
import pixi.core.renderers.SystemRenderer;
import pixi.core.display.Container;
import edge.pixi.components.Display;

class Renderer implements ISystem {
  public var container(default, null) : Container;
  public var renderer(default, null) : SystemRenderer;
	var entities : View<{ d : Display }>;

  public function new(renderer : SystemRenderer, ?container : Container) {
    this.container = null == container ? new Container() : container;
    this.renderer = renderer;
  }

	public function entitiesAdded(e : Entity, data : { d : Display }) {
    container.addChild(data.d.node);
  }

  public function entitiesRemoved(e : Entity, data : { d : Display }) {
    container.removeChild(data.d.node);
  }

  public function update() {
    renderer.render(container);
  }
}
