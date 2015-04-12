import pixi.core.renderers.SystemRenderer;
import pixi.core.renderers.Detector;
import js.Browser;

class Main {
	public function new(renderer : SystemRenderer) {

	}

	static function main() {
		var options : RenderingOptions = {
            resolution : 1,
            backgroundColor : 0x090909
          },
        renderer = Detector.autoDetectRenderer(800, 600, options);
    Browser.document.body.appendChild(renderer.view);
    new Main(renderer);
	}
}
