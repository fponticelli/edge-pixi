package edge.pixi.components;

import edge.IComponent;
import pixi.core.sprites.Sprite;
import pixi.core.textures.Texture;

class DisplaySprite implements IComponent {
  var sprite : Sprite;

	public static function fromImagePath(path : String) {
		return new DisplaySprite(new Sprite(Texture.fromImage(path)));
	}
}
