(function (console) { "use strict";
var Main = function(renderer) {
};
Main.main = function() {
	var options = { resolution : 1, backgroundColor : 592137};
	var renderer = PIXI.autoDetectRenderer(800,600,options);
	window.document.body.appendChild(renderer.view);
	new Main(renderer);
};
Main.main();
})(typeof console != "undefined" ? console : {log:function(){}});
