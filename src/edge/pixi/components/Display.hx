package game.components;

import edge.IComponent;
import pixi.core.sprites.Sprite;
import pixi.core.sprites.Texture;

class Display implements IComponent {
  var sprite : Sprite;

	public static function fromImagePath(path : String) {
		return new Display(Texture.fromImage(image));
	}
}
