var uiSetup = function() {
	$("#doHash").button();
	$("#doBenchmark").button();
	$("#tabs").tabs();
	$("#progress-dialog").dialog({
		autoOpen: false,
		modal: true,
		draggable: false,
		resizable: false,
		closeOnEscape: false,
		open: function(event, ui) {
			$(".ui-dialog-titlebar-close", ui.dialog).hide();
		}
	});
};

var loadEnginesList = function(data, textStatus, jqXHR) {
	var anchor = $("#mdengineslist");
	for (var index = 0; index < data.length; index++) {
		var option = $("<option/>");
		var engine = data[index];
		option.val(engine).text(engine);
		anchor.append(option);
	}
};

var buildHashRequestUrl = function() {
	var engineName = $("#mdengineslist").val();
	var stringToHash = $("#stringToHash").val();

	var requestUrl = JSPVARS.computeHashUrl;
	requestUrl = requestUrl + "?digestName=" + engineName;
	requestUrl = requestUrl + "&digestString=" + stringToHash;
	
	return requestUrl;
};

var buildBenchmarkRequestUrl = function() {
	var engineName = $("#mdengineslist").val();
	var blockSize = $("#blockSize").val();
	var runTime = $("#runTime").val();
	
	var requestUrl = JSPVARS.runBenchmarkUrl;
	requestUrl = requestUrl + "?digestName=" + engineName;
	requestUrl = requestUrl + "&blockSize=" + blockSize;
	requestUrl = requestUrl + "&runTime=" + runTime;
	
	return requestUrl;
};

var doHashClicked = function() {
	ajaxJsonRequest(
		buildHashRequestUrl(),
		function(data, textStatus, jqXHR) {
			$("#hashResult").val(data.digestValue);
		},
		false
	);
};

var doBenchmarkClicked = function() {
	var blockSize = $("#blockSize").val();
	var runTime = $("#runTime").val();

	if (blockSize < 1) {
		alert("Wrong block size value, must be greater then 0");
		return;
	}
	if (runTime <= 0) {
		alert("Wrong run time value, must be greater then 0");
		return;
	}

	$("#progress-dialog").dialog("open");
	
	ajaxJsonRequest(
		buildBenchmarkRequestUrl(),
		function(data, textStatus, jqXHR) {
			$("#loopTime").val(data.loopTime);
			$("#loopsPerSecond").val(data.loopsPerSecond);
			$("#throughput").val(data.throughput);
		},
		false
	);
	
	$("#progress-dialog").dialog("close");
};
	
$(document).ready(function(){
	uiSetup();
	$("#doHash").on("click", doHashClicked);
	$("#doBenchmark").on("click", doBenchmarkClicked);
	ajaxJsonRequest(JSPVARS.enumEnginesUrl, loadEnginesList, false);
});
