package edge.cosystem;

import pixi.core.display.Container;
import pixi.core.utils.EventData;
import pixi.core.math.Point;

class MouseSystem {
  var stage : Container;
  var x : Float;
	var y : Float;
	var lx : Float;
	var ly : Float;
	var dx : Float;
	var dy : Float;
  var isDown : Bool;
  var firstDown : Bool;

  public function new(stage : Container) {
    this.stage = stage;
    this.stage.interactive = true;
    x = y = lx = ly = dx = dy = 0;
    isDown = false;
    firstDown = false;

    this.stage.on("mousemove", mouseMove);
    this.stage.on("mousedown", mouseDown);
    this.stage.on("mouseup", mouseUp);
  }

	function before() {
		dx = x - lx;
		dy = y - ly;
	}

	function after() {
		firstDown = false;
		lx = x;
		ly = y;
	}

  function mouseMove(e : EventData) {
    var pt = (e.data.global : Point);
    x = pt.x;
    y = pt.y;
  }

  function mouseDown(_) {
    isDown = true;
    firstDown = true;
  }

  function mouseUp(_) {
    isDown = false;
  }
}
