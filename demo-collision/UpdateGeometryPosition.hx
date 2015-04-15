import edge.pixi.components.*;
import pixi.core.graphics.Graphics;
import pixi.core.display.Container;

class UpdateGeometryPosition implements edge.ISystem {
  var stage : Container;

  public function new(stage : Container) {
    this.stage = stage;
  }

  public function before() {
    stage.removeChildren();
  }

  public function update(p : Position, pv : PositionVelocity, ha : HitArea) {
    ha.originX += pv.dx;
    ha.originY += pv.dy;

    var g = new Graphics();
    g.beginFill(0x00aadd);
    g.drawCircle(ha.originX, ha.originY, ha.radius);
    g.endFill();
    stage.addChild(g);
  }
}
