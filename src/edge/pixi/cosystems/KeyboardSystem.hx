package edge.pixi.cosystems;

import js.Browser;
import js.html.KeyboardEvent;
import thx.Set;

class KeyboardInput {
  var keys : Set<Key>;

  var altGraphKey : Bool;
  var altKey : Bool;
  var ctrlKey : Bool;
  var metaKey : Bool;
  var shiftKey : Bool;

  public function new() {
    Browser.window.addEventListener("keydown", keyDown);
    Browser.window.addEventListener("keyup", keyUp);
    keys = Set.create();
  }

  function keyDown(e : KeyboardEvent) {
    keys.add(e.keyCode);
    setModifiers(e);
  }

  function keyUp(e : KeyboardEvent) {
    keys.remove(e.keyCode);
    setModifiers(e);
  }

  function setModifiers(e : KeyboardEvent) {
    altGraphKey = e.altGraphKey;
    altKey = e.altKey;
    ctrlKey = e.ctrlKey;
    metaKey = e.metaKey;
    shiftKey = e.shiftKey;
  }

  function get_chars()
    return (keys : Array<Int>)
      .map(function(i) return String.fromCharCode(i) + ':$i');

  public function toString() {
      var modifiers = [];
      return 'Keyboard: ${(keys : Array<Key>).map(function(c) return c.toString()).join(", ")}';
    }
}

abstract Key(Int) from Int to Int {
  @:to public function toString() {
    return switch this {
      case c if(c >= 65 && c <= 90 || c >= 48 && c <= 57):
        String.fromCharCode(c);
      case 8:
        "BACKSPACE";
      case 9:
        "TAB";
      case 13:
        "ENTER";
      case 16:
        "SHIFT";
      case 17:
        "CTRL";
      case 18:
        "ALT";
      case 32:
        "SPACE";
      case 37:
        "LEFT";
      case 38:
        "UP";
      case 39:
        "RIGHT";
      case 40:
        "DOWN";
      case 91:
        "CMD";
      case 93:
        "CMD-RIGHT";
      case _:
        'K-$this';
    };
  }
}
