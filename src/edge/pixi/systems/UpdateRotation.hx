package game.systems;

import edge.Entity;
import edge.ISystem;
import edge.pixi.components.DisplaySprite;
import edge.pixi.components.Rotation;

class UpdateRotation implements ISystem {
  public function update(d : DisplaySprite, r : Rotation) {
    d.sprite.rotation = r.angle;
  }
}
