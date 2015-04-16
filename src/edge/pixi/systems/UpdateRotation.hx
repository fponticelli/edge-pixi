package edge.pixi.systems;

import edge.Entity;
import edge.ISystem;
import edge.pixi.components.Display;
import edge.pixi.components.Rotation;

class UpdateRotation implements ISystem {
  public function update(d : Display, r : Rotation) {
    d.node.rotation = r.angle;
  }
}
