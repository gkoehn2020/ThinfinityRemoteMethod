helper.dom.ready(function () {

	var jsro = new Thinfinity.JsRO();
	var ro = null;

	jsro.on('model:ro', 'created', function () {
		ro = jsro.model.ro;
	});

	jsro.on('ro', 'runMultiplyInBrowser', function () {
      ro.multiply(3, 4, function (result) {
        alert("Result is " + result);
      });
	});

});
