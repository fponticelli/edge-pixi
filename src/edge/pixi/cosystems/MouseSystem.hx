package edge.pixi.cosystems;

import pixi.core.display.Container;
import pixi.plugins.eventemitter.EventTarget;
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

    js.Browser.document.addEventListener("mousedown", mouseDown);
    js.Browser.document.addEventListener("mouseup", mouseUp);
    this.stage.on("mousemove", mouseMove);
  }

	public function before() {
		dx = x - lx;
		dy = y - ly;
	}

	public function after() {
		firstDown = false;
		lx = x;
		ly = y;
	}

  function mouseMove(e : EventTarget) {
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
