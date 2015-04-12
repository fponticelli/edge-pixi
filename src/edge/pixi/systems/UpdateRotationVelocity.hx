package edge.pixi.systems;

import edge.Entity;
import edge.ISystem;
import edge.pixi.components.Rotation;
import edge.pixi.components.RotationVelocity;

class UpdateRotationVelocity implements ISystem {
  public function update(r : Rotation, rs : RotationVelocity)
    r.angle += rs.dangle;
}
