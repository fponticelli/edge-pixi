import edge.pixi.components.*;

class BunnyExterminator implements edge.ISystem {
	var entity : edge.Entity;
	var width : Int;
	var height : Int;
	var offset : Int;
	var counter : Int;
	public function new(width : Int, height : Int, offset : Int) {
		this.width = width;
		this.height = height;
		this.offset = offset;
	}

	public function before() {
		counter = 0;
	}

	function update(d : Display) {
		if(d.node.x < -offset || d.node.x > width + offset || d.node.y < -offset || d.node.y > height + offset) {
			entity.destroy();
		} else {
			counter++;
		}
	}

	public function after() {
		//trace('Bunnies $counter');
	}
}
