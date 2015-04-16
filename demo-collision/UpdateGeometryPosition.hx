import edge.pixi.components.*;
import pixi.core.graphics.Graphics;
import pixi.core.display.Container;
import pixi.core.math.Point;
import edge.View;

class UpdateGeometryPosition implements edge.ISystem {
  var stage : Container;

  public function new(stage : Container) {
    this.stage = stage;
  }

  public function before() {
    stage.removeChildren();
  }

  public function isOverlapping(origin : Point, radius : Float, targets : View<{ hitArea : HitArea }>) : Bool {
    for (t in targets) {
      var tOrigin = t.data.hitArea.origin;
      var tRadius = t.data.hitArea.radius;
      var dx = origin.x - tOrigin.x;
      var dy = origin.y - tOrigin.y;
      var distance = Math.sqrt(dx * dx + dy * dy);

      // FIXME: hacky way to filter out the current entity from list of targets
      if (origin.x == tOrigin.x && origin.y == tOrigin.y) continue;

      if (distance < t.data.hitArea.radius + radius) {
        return true;
      }
    }
    return false;
  }

  var targets : View<{ hitArea : HitArea }>;
  var entity : edge.Entity;

  public function update(p : Position, pv : PositionVelocity, ha : HitArea) {
    var g = new Graphics();

    ha.origin.x += pv.x;
    ha.origin.y += pv.y;

    if (isOverlapping(ha.origin, ha.radius, targets)) {
      g.beginFill(0xee3333);
    } else {
      g.beginFill(0x00aadd);
    }

    g.drawCircle(ha.origin.x, ha.origin.y, ha.radius);
    g.endFill();
    stage.addChild(g);
  }
}
