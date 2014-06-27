var messageArr = [];
var showMessageOptions = {};
function showMessage(bin,message,time){
	var ob = findMessage(messageArr, bin);
	if(ob){
		if(!ob.showing){
			var timeVar = ob.timeVar;
			ob.showing = true;
			$('#'+ob.bin).html(message);
			$('#'+ob.bin).show('blind', showMessageOptions, 500);
			if(time){
				if(timeVar){
					clearTimeout(timeVar);
				}
				ob.timeVar = setTimeout(function(){
					$('#'+bin).hide('blind', showMessageOptions, 500);
					ob.showing = false;
				},time);
			}
		}else{
			if(message){
				ob.message = message;
			}
			$('#'+ob.bin).html(ob.message);
			if(ob.timeVar){
				clearTimeout(ob.timeVar);
			}
			if(ob.time != undefined || time != undefined){
				if(ob.time == undefined){
					ob.time = time;
				}
				if(ob.time){
					ob.timeVar = setTimeout(function(){
						$('#'+ob.bin).hide('blind', showMessageOptions, 500);
						ob.showing = false;
					}, ob.time);
				}
			}
		}
	}else{
		var mes = { "bin" : bin, "showing" : true, "message" : message, "time" : time};
		$('#'+bin).html(message);
		$('#'+bin).show('blind', showMessageOptions, 500);
		if(time){
			mes.timeVar = setTimeout(function(){
				$('#'+bin).hide('blind', showMessageOptions, 500);
				mes.showing = false;
			}, time);
		}
		messageArr.push( mes );
	}
}

function hideMessage(bin){
	var ob = findMessage(messageArr, bin);
	if(ob){
		$('#'+ob.bin).hide('blind', showMessageOptions, 500);
		ob.showing = false;
	}
}

function removeFromArr(arr, index){
	arr.splice(index, 1);
}

function findMessage( arr, bin ){
	var ob = undefined;
	for(var i=0; i<arr.length; i++){
		if(arr[i].bin === bin){
			ob = arr[i];
			ob.index = i;
			return ob;
		}
	}
	return ob;
}