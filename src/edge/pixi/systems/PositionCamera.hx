package edge.pixi.systems;

import edge.ISystem;
import edge.pixi.components.*;

class PositionCamera implements ISystem {
  public function update(c : Camera, w : Widget) {
    w.node.x = -c.x;
    w.node.y = -c.y;
  }
}
