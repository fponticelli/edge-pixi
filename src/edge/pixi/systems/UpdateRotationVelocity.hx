package edge.pixi.systems;

import edge.Entity;
import edge.ISystem;
import edge.pixi.components.Display;
import edge.pixi.components.RotationVelocity;

class UpdateRotationVelocity implements ISystem {
  public function update(d : Display, rs : RotationVelocity)
    d.node.rotation += rs.dangle;
}
