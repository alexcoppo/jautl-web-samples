/*
    Copyright (c) 2010-2013 Alessandro Coppo
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions
    are met:
    1. Redistributions of source code must retain the above copyright
       notice, this list of conditions and the following disclaimer.
    2. Redistributions in binary form must reproduce the above copyright
       notice, this list of conditions and the following disclaimer in the
       documentation and/or other materials provided with the distribution.
    3. The name of the author may not be used to endorse or promote products
       derived from this software without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
    IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
    OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
    IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
    NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
    DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
    THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
    THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
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
	var blockSize = $("#blockSize").val() || 0;
	var runTime = $("#runTime").val();
	
	var requestUrl = JSPVARS.runBenchmarkUrl;
	requestUrl = requestUrl + "?digestName=" + engineName;
	requestUrl = requestUrl + "&blockSize=" + blockSize;
	requestUrl = requestUrl + "&runTime=" + runTime;
	
	return requestUrl;
};

var displayResultItem = function(id, value) {
	var container = $("#" + id);
	
	container.text(value);
	container.css("display", "table-cell");
};

var doHashClicked = function() {
	ajaxJsonRequest(
		buildHashRequestUrl(),
		function(data, textStatus, jqXHR) {
			displayResultItem("hashResult", data.digestValue);
		},
		false
	);
};

var doBenchmarkClicked = function() {
	var blockSize = $("#blockSize").val() || 0;
	var runTime = $("#runTime").val();

	if (blockSize < 0) {
		alert("Wrong block size value, must be non negative");
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
			displayResultItem("loopTime", data.loopTime);
			displayResultItem("loopsPerSecond", data.loopsPerSecond);
			displayResultItem("throughput", data.throughput);
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
