package edge.pixi.systems;

import edge.Entity;
import edge.ISystem;
import edge.pixi.components.DisplaySprite;
import edge.pixi.components.Position;

class UpdatePosition implements ISystem {
  public function update(d : DisplaySprite, p : Position) {
    d.sprite.x = p.x;
    d.sprite.y = p.y;
  }
}
