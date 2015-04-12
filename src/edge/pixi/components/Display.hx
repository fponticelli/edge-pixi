package edge.pixi.components;

import edge.IComponent;
import pixi.core.sprites.Sprite;
import pixi.core.textures.Texture;

class Display implements IComponent {
  var sprite : Sprite;

	public static function fromImagePath(path : String) {
		return new Display(new Sprite(Texture.fromImage(path)));
	}
}
