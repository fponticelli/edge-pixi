package edge.pixi.systems;

import edge.Entity;
import edge.ISystem;
import edge.pixi.components.Display;
import edge.pixi.components.PositionVelocity;

class UpdatePositionVelocity implements ISystem {
  public function update(d : Display, rs : PositionVelocity) {
    d.node.x += rs.x;
    d.node.y += rs.y;
  }
}
