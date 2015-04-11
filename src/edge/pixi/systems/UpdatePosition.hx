package game.systems;

import edge.Entity;
import edge.ISystem;
import game.components.Display;
import game.components.Position;

class UpdatePosition implements ISystem {
  public function update(d : Display, p : Position) {
    d.sprite.x = p.x;
    d.sprite.y = p.y;
  }
}
