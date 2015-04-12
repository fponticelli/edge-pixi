package edge.pixi.systems;

import edge.Entity;
import edge.ISystem;
import edge.pixi.components.Position;
import edge.pixi.components.PositionVelocity;

class UpdatePositionVelocity implements ISystem {
  public function update(r : Position, rs : PositionVelocity) {
    r.x += rs.dx;
    r.y += rs.dy;
  }
}
