package edge.pixi.components;

import edge.IComponent;
import pixi.core.display.Container;
import pixi.core.sprites.Sprite;
import pixi.core.textures.Texture;

class Widget implements IComponent {
  var node : Container;

  public static function fromImagePath(path : String, ?anchorx = 0.0, ?anchory = 0.0) {
    var sprite = new Sprite(Texture.fromImage(path));
    sprite.anchor.x = anchorx;
    sprite.anchor.y = anchory;
    return new Widget(sprite);
  }
}
