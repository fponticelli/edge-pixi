package edge.pixi.systems;

import edge.Entity;
import edge.ISystem;
import edge.pixi.components.Display;
import edge.pixi.components.Position;

class UpdatePosition implements ISystem {
  public function update(d : Display, p : Position) {
    d.node.x = p.x;
    d.node.y = p.y;
  }
}
