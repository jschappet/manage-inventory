function nebulaShowError(messageId,message) {
	$("#formid_"+messageId+"_error").html(message);
}

function nebulaClearError(messageId,message) {
	$("#formid_"+messageId+"_error").html("");
}

function nebulaAlert(message) {
	alert(message);
}