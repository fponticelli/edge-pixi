package game.systems;

import edge.Entity;
import edge.ISystem;
import pixi.core.display.Container;
import game.components.Display;
import game.components.Position;

class UpdateStage implements ISystem {
  var stage : Container;
  var entities : View<{ d : Display}>;

  public function new(stage : Container) {
    this.stage = stage;
  }

  public function entitiesAdded(e : Entity, data : { d : Display}) {
    stage.addChild(data.d.sprite);
  }

  public function entitiesRemoved(e : Entity, data : { d : Display}) {
    stage.removeChild(data.d.sprite);
  }

  public function update() {}
}
