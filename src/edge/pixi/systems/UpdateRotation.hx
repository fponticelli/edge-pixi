package game.systems;

import edge.Entity;
import edge.ISystem;
import game.components.Display;
import game.components.Rotation;

class UpdateRotation implements ISystem {
  public function update(d : Display, r : Rotation) {
    d.sprite.rotation = r.angle;
  }
}
