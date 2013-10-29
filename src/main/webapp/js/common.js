var ajaxJsonRequest = function(url, successCallback, async) {
	jQuery.ajax({
		url : url,
		dataType : "json",
		success: successCallback,
		error : function(jqXHR, textStatus, errorThrown) {
			console.debug("ajaxJsonRequest Error -------");
			console.debug(textStatus);
			console.debug(errorThrown);
			console.debug("-----------------------------");
		},
		async: async
	});	
};
