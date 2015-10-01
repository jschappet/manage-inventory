String.prototype.endsWith = String.prototype.endsWith || function(suffix) {
    return this.indexOf(suffix, this.length - suffix.length) !== -1;
};
String.prototype.trim = String.prototype.trim || function() {
	return this.replace(/^\s+|\s+$/g, '');
};
String.prototype.ltrim = String.prototype.ltrim || function() {
	return this.replace(/^\s+/, '');
};
String.prototype.rtrim = String.prototype.rtrim || function() {
	return this.replace(/\s+$/, '');
};
String.prototype.fulltrim = String.prototype.fulltrim || function() {
	return this.replace(/(?:(?:^|\n)\s+|\s+(?:$|\n))/g, '').replace(/\s+/g, ' ');
};

Array.prototype.addAll = Array.prototype.addAll || function( elements ){
	if( elements != undefined ){
		for( var l=0; l < elements.length; l++){
			this.push(elements[l]);
		}
	}
	return this;
};

function listCookies(){
	return $.cookie();
}

function deleteCookie(name) {
	$.cookie(name, null, { expires: 0, path : '/' });
}

function getCookie(c_name) {
	return $.cookie(c_name);
}

function setCookie(c_name, value, exdays) {
	$.cookie(c_name, value, { expires: exdays, path: '/', secure: false });
}

$.fn.dataTableExt.oApi.fnFakeRowspan = function ( oSettings, iColumn, bCaseSensitive ) {
    /* Fail silently on missing/errorenous parameter data. */
    if (isNaN(iColumn)) {
        return false;
    }
      
    if (iColumn < 0 || iColumn > oSettings.aoColumns.length-1) {
        alert ('Invalid column number choosen, must be between 0 and ' + (oSettings.aoColumns.length-1));
        return false;
    }
      
    var oSettings = oSettings,
        iColumn = iColumn,
        bCaseSensitive = (typeof(bCaseSensitive) != 'boolean' ? true : bCaseSensitive);
  
    oSettings.aoDrawCallback.push({ "fn": fakeRowspan, "sName": "fnFakeRowspan" });
  
    function fakeRowspan () {
        var firstOccurance = null,
            value = null,
            rowspan = 0;
        jQuery.each(oSettings.aoData, function (i, oData) {
            var val = oData._aData[iColumn],
                cell = oData.nTr.childNodes[iColumn];
            /* Use lowercase comparison if not case-sensitive. */
            if (!bCaseSensitive) {
                val = val.toLowerCase();
            }
            /* Reset values on new cell data. */
            if (val != value) {
                value = val;
                firstOccurance = cell;
                rowspan = 0;
            }
              
            if (val == value) {
                rowspan++;
            }
              
            if (firstOccurance !== null && val == value && rowspan > 1) {
                oData.nTr.removeChild(cell);
                firstOccurance.rowSpan = rowspan;
            }
        });
    }
      
    return this;
};

function nameAutoComplete(first,last,url,var_name,div,tmp_html){
	var fname = $('#'+first).val().trim();
	var lname = $('#'+last).val().trim();
	if(fname.length > 2 || lname.length > 2){
		$.ajax( {
			url : url,
			beforeSend : function(){},
			data : {
				first : fname,
				last : lname,
				var_name : var_name
			},
			success : function(data) {
				if(data.trim().length > 1){
					$('#'+div).html(data);
				}else{
					$('#'+div).html("<em>No results found</em>");
				}
			}
		});
	}else{
		$('#'+div).html(tmp_html);
	}
}

function setDataTable( args ){
	var options = {
		id 				: undefined,
		url 			: 'datatable.html',
		sServerMethod	: 'POST',
		sPaginationType	: "bootstrap",
	    sDom			: "<'row-fluid'<'span4'l><'span4'r><'span4'f>>t<'row-fluid'<'span6'i><'span6'p>>", 
	    bProcessing 	: true,
	    bServerSide 	: true,
	    sortable		: true,
        searchable		: true,
       	bJQueryUI 		: false,
       	bPaginate 		: true,
        oLanguage		: {
			sEmptyTable		: "No data found matching your criteria.",
           	sInfoEmpty		: "",
           	sProcessing		: 'processing...'
 		},
 		includeSearches : false,
 		extraData 		: undefined,
 		columns 		: undefined,
 		start			: 1,
 		limit			: 10,
 		aLengthMenu		: [[10, 25, 50, 100], [10, 25, 50, 100]],
 		onDraw			: undefined
	};
	
	if( args ){
		jQuery.extend( options, args );
	}
	
	var initSort = null;
	for( var i=0; i < options.columns.length; i++){
		if( options.columns[i].bSortable == true ){
			initSort = i;
			break;
		}
	}
	
	var sortingArr = [];
	if( initSort != null ){
		sortingArr = [[ initSort, "asc" ]];
	}
	
	var table = $('#'+options.id).dataTable( {
		// sServerMethod	: options.sServerMethod,
	    sAjaxSource 	: options.url,
	    sPaginationType	: options.sPaginationType, // "bootstrap",
	    sDom			: options.sDom, // "<'row-fluid'<'span4'l><'span4'r><'span4'f>>t<'row-fluid'<'span6'i><'span6'p>>", // <'row-fluid'<'span12'T>>
	    bProcessing 	: options.bProcessing, // true,
	    bServerSide 	: options.bServerSide, // true,
	    bSort 			: options.sortable, // true,
	    bFilter 		: ( options.includeSearches == true ? false : options.searchable ),
       	bJQueryUI 		: options.bJQueryUI, // false,
       	bPaginate 		: options.bPaginate, // true,
        iDisplayStart 	: options.start, // 1*(start),
        iDisplayLength	: options.limit, // 1*(limit),
        oLanguage		: options.oLanguage,
       	aoColumns		: options.columns,
       	aLengthMenu		: options.aLengthMenu,
       	aaSorting 		: options.aaSorting || sortingArr,
       	fnDrawCallback	: function( oSettings ) {
       		if( options.onDraw && typeof(options.onDraw) === 'function' ){
       			options.onDraw( oSettings );
       		}
        },
 		fnServerData : function ( sSource, aoData, fnCallback ) {
 			if( options.extraData ){
 				for( var i=0; i < options.extraData.length; i++ ){
 					aoData.push({ "name" : options.extraData[i].name, "value" : options.extraData[i].value });
 				}
 			}
 			
 			var aoCols = $('#'+options.id).dataTable().fnSettings().aoColumns;
 			
 			if( options.includeSearches == true ){
 				for( var c=0; c < aoCols.length; c++ ){
 					if( aoCols[c].bSearchable ){
 						if( $("#dtSearch_"+aoCols[c].sName.replace(/\./g,'_')).length > 0 && $("#dtSearch_"+aoCols[c].sName.replace(/\./g,'_')).val().trim() != '' ){
 							aoData.push({ "name" : $("#dtSearch_"+aoCols[c].sName.replace(/\./g,'_')).attr('name'), "value" : $("#dtSearch_"+aoCols[c].sName.replace(/\./g,'_')).val() });
 						}
 					}
 				}
 				aoData.push({ "name" : "bFilter", "value" : false });
 			} else {
 				aoData.push({ "name" : "bFilter", "value" : true });
 			}
 			
 			$.getJSON( sSource, aoData, function (json) { 
   				if( json.error ){
   				    $('#'+options.id).dataTable().fnDestroy();
   				    var tbl = '';
   				    var anOpen = [];
   				    tbl += '<thead><tr><th>Error Loading Datatable</th></tr></thead>';
   				    tbl += '<tbody><tr><td class="control" style="color:red; line-height: 30px;">'+json.error+' <a class="btn btn-danger">details</a></td></tr></tbody>';
   				    $('#'+options.id).html( tbl );
   				    var oTable = $('#'+options.id).dataTable({
				    	bSort 	  : false,
				        bFilter   : false,
				       	bJQueryUI : false,
				       	bPaginate : false, 
				       	sPaginationType	: "bootstrap",
					    sDom			: "<'row-fluid'<'span4'l><'span4'r><'span4'f>>t<'row-fluid'<'span6'i><'span6'p>>",
				       	oLanguage : {
				           	sInfo : "",
				 		}
				    });
   				    $('#'+options.id+' td.control a.btn').live( 'click', function () {
   				    	var nTr = this.parentNode.parentNode;
   				    	var i = $.inArray( nTr, anOpen );
   				    	if ( i === -1 ) {
   				    		oTable.fnOpen( nTr, fnFormatDetails(oTable, nTr), 'details' );
   				    		anOpen.push( nTr );
   				    	} else {
   				    		oTable.fnClose( nTr );
   				    		anOpen.splice( i, 1 );
   				    	}
   				    });
   				    function fnFormatDetails( oTable, nTr ) {
   				    	return '<div class="innerDetails">' + json.stackTrace + '</div>';
   				    }
   				} else {
   					fnCallback( json );
   				}
			});
   		}
	});
	
	 $(window).bind('resize', function () {
		 // table.fnAdjustColumnSizing(); // reloads all data from server
	 });
	
	if( options.includeSearches == true ){
		var head = $('#'+options.id+' thead ');
		var srchs = '';
		var aoCols = $('#'+options.id).dataTable().fnSettings().aoColumns;
		for( var c=0; c < aoCols.length; c++ ){
			if( aoCols[c].bSearchable ){
				srchs += '<td style="padding: 1px; line-height: auto; height: auto;">'+
							'<input type="text" autocomplete="off" id="dtSearch_'+aoCols[c].sName.replace(/\./g,'_')+'" name="'+aoCols[c].sName+'" size="" style="width:100%; padding: 4px 0px; margin: 0px;" />'+
						 '</td>';
			}else{
				srchs += '<td></td>';
			}
		}
		head.append('<tr id="searchRow">' + srchs + '</tr>');
		for( var c=0; c < aoCols.length; c++ ){
			if( aoCols[c].bSearchable ){
				$("#dtSearch_"+aoCols[c].sName.replace(/\./g,'_')).keyup(function(){
					$('#'+options.id).dataTable().fnDraw();
				});
			}
		}
	}
	
	return table;
}

/*
using a datatable in a form
var oTable;
$(document).ready(function() {
    $('#form').submit( function() {
        var sData = oTable.$('input').serialize();
        alert( "The following data would have been submitted to the server: \n\n"+sData );
        return false;
    } );
     
    oTable = $('#example').dataTable();
} );
 */

var start = 300;
var timer = start;
var inter;
function timeout(pp) {
	if (timer > 0) {
		timer -= 1;
		setTimeout("timeout(\'" + pp + "\')", 1500);
	} else {
		ok = confirm("Session timed out due to inactivity. \n Would you like to close this session.");
		if (ok) {
			location.href = pp;
		}

	}
}


function toggle(divid,display) {
	var ele = document.getElementById(divid);
	if(display == "hide") {
    	ele.style.display = "none";
  	}
	else {
		ele.style.display = "inline";
		
	}
}

function toggleBlock(divid,display) {
	var ele = document.getElementById(divid);
	if(display == "hide") {
    	ele.style.display = "none";
  	}
	else {
		ele.style.display = "block";
		
	}
}


function toggleV(divid) {
	var ele = document.getElementById(divid);

	if (ele.style.display == "block" || ele.style.display == "inline") {

		ele.style.display = "none";

	} else {
		ele.style.display = "inline";

	}
} 



function showElement(id, max) {

	var obj = document.getElementById(id);
	var hh = obj.style.height;
	if (hh == max) {
		clearInterval(inter);
		return;
	}

	obj.style.visibility = 'visible';
	hh += 2;
	obj.style.height = hh + 'px';
}

function hideElement(id) {
	var obj = document.getElementById(id);
	var hh = obj.style.height;
	if (hh == 2) {
		obj.style.visibility = 'hidden';
		obj.style.height = '0.1em';
		clearInterval(inter);
		return;
	}
	hh -= 2;
	obj.style.height = hh + 'px';
}

function moveOnMax(field, nextFieldName) {
	if (field.value.length >= field.maxLength) {
		document.getElementsByName(nextFieldName)[0].focus();
	}
}
function getdate() {
	var myDate = new Date();
	var output = myDate.getFullYear() + "-" + (myDate.getMonth() + 1) + "-"
			+ myDate.getDate();
	return output;
}

function selectElement(elem, init, type) {
	selectElementMain(elem, init, type, false);
}
function deselectElement(elem, init, type) {
	selectElementMain(elem, init, type, true);
}
function selectElementMain(elem, init, type, deselect) {

	var st = init;
	values = st.split("|");

	var elementgroup = document.getElementsByName(elem);

	for ( var a = 0; a < values.length; a++) {

		value = values[a];

		if (type == "radio") {
			for (j = 0; j < elementgroup.length; j++)
				if (elementgroup[j].value == value) {
					if (deselect)
						elementgroup[j].checked = false;
					else
						elementgroup[j].checked = true;
				}

		} else if (type == "select" && elementgroup[0] != null
				&& elementgroup[0] != undefined) {

			var options = elementgroup[0].options;
			for (j = 0; j < options.length; j++)
				if (options[j].value == value) {
					if (deselect)
						options[j].selected = false;
					else
						options[j].selected = true;
				}

		} else if (type == "checkbox") {
			for (j = 0; j < elementgroup.length; j++) {

				if (elementgroup[j].value == value) {
					if (deselect)
						elementgroup[j].checked = 0;
					else
						elementgroup[j].checked = 1;

				}

			}

		}

	}

}

function resetElement(elem, init, type, deselect) {

	var st = init;
	var values = st.split("|");

	var elementgroup = document.getElementsByName(elem);

	for ( var a = 0; a < values.length; a++) {

		var value = values[a];

		if (type == "radio") {
			for ( var j = 0; j < elementgroup.length; j++) {

				elementgroup[j].checked = false;

				// elementgroup[j].checked = true;
			}

		} else if (type == "select" && elementgroup[0] != null
				&& elementgroup[0] != undefined) {

			var options = elementgroup[0].options;
			for ( var j = 0; j < options.length; j++)
				options[j].selected = false;

		} else if (type == "checkbox") {
			for ( var j = 0; j < elementgroup.length; j++) {

				elementgroup[j].checked = 0;

			}

		} else {

			elementgroup[j].value = "";

		}

	}

}

function enableDisableElementById(st, enable) {

	var element = document.getElementById(st);

	enableDisableElementByName(element.name, enable);

}
function enableDisableElementByName(name, enable) {

	if (enable == true)
		jQuery('[name="' + name + "']").removeAttr('disabled');
	else
		jQuery('[name="' + name + "']").attr('disabled', 'disable');
}

function boolToAnswer(bool) {
	if (bool == 'true')
		document.write("Yes");
	else if (bool == 'false')

		document.write("No");
	else
		document.write("N/A");

}

function processReqChange(req) {
    // only if req shows "loaded"
    if (req.readyState == 4) {
        // only if "OK"
        if (req.status == 200) {
            // ...processing statements go here...
        } else {
            alert("There was a problem retrieving the XML data:\n" +
                req.statusText);
        }
    }
}



function sessionKeepAlive(url) {
	touchPage(url);
	setTimeout("sessionKeepAlive(\'" + url + "\')", 900000);
}

function touchPage(url) {

	var req = false;
	// branch for native XMLHttpRequest object
	if (window.XMLHttpRequest && !(window.ActiveXObject)) {
		try {
			req = new XMLHttpRequest();
		} catch (e) {
			req = false;
		}
		// branch for IE/Windows ActiveX version
	} else if (window.ActiveXObject) {
		try {
			// req = new ActiveXObject("Msxml2.XMLHTTP");
			xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async = false;
			xmlDoc.validateOnParse = false;
			xmlDoc.resolveExternals = false;
			xmlDoc.preserveWhiteSpace = false;
			xmlDoc.load(url);
			return xmlDoc;
		} catch (e) {
			try {
				req = new ActiveXObject("Microsoft.XMLHTTP");

			} catch (e) {
				req = false;
			}
		}
	}
	if (req) {
		req.onreadystatechange = processReqChange(req);
		req.open("GET", url, false);
		req.send("");
		return req.responseXML;
	}
	return "";
}

var showsidebar = true;
function toggleSidebar() {
	var message = '&larr; hide menu';
	if (showsidebar) {
		var sidebar = document.getElementById("leftCol");
		var center = document.getElementById("centerCol");
		sidebar.style.display = 'block';
		center.style.width = '750px';

	} else {
		var sidebar = document.getElementById("leftCol");
		var center = document.getElementById("centerCol");
		sidebar.style.display = 'none';
		center.style.width = '930px';
		message = 'show menu &rarr;';

	}
	showsidebar = !showsidebar;

	document.getElementById("showhidebutton").innerHTML = '<a href="#" onclick="javascript:toggleSidebar();">'
			+ message + '</a>';

}


function classDisplay(theClass,display){
		
	if(display == "hide")
		$("."+theClass).hide();
	else
		$("."+theClass).show();

	}

//chk if an object is an array or not.
function isArray(obj) {
	var length = obj.length;
	
if(length == undefined)
	return false;
	else
		return true;
}




function getValueOfElement(element)
{

	var values = new Array();
	var valueCount = 0;
	
	var type = element.type;
	var name = element.name;

	
	if(type =="radio" || type =="checkbox")	
	{
		
		var elements = document.getElementsByName(name);
		for(var ii=0;ii<elements.length;ii++)
		{

			if(elements[ii].checked)
				{
					values[valueCount]=elements[ii].value;
					valueCount++;
					
				}
			
		}

		return values;
	}
	else if(type =="select-one"|| type=="select-multiple" || type=="select")	
	{
		

			var options = element.options;
			
			
			for (var jj = 0; jj < options.length; jj++)
				if (options[jj].selected)
				{
					values[valueCount]=options[jj].value;
					valueCount++;
					
				}
					
			
			return values;
	}
	else
	{
		values[0]=element.value;


		return values;
	}

	

	
}


function setValueOfElementByName(elementName, value) {

	var elements = document.getElementsByName(elementName);
	if (elements == undefined)
		return false;

	for ( var i = 0; i < elements.length; i++) {
		var type = elements[i].type;
		var name = elements[i].name;

		if (type == "radio") {
			selectElement(name, value, "radio");
			return true;
		} else if (type == "checkbox") {
			selectElement(name, value, "radio");
			return true;
		} else if (type == "select") {
			selectElement(name, value, "select");
			return true;
		} else if (type == "textarea") {

			elements[i].value = value;
			return true;
		} else {
			elements[i].value = value;
			return true;
		}

	}

}

function getValueOfElementByName(elementName) {

	var output = "";

	var elementgroup = document.getElementsByName(elementName);
	var type = elementgroup.type;

	if (type == "radio") {
		for ( var j = 0; j < elementgroup.length; j++)
			if (elementgroup[j].checked == true) {
				return elementgroup[j].value;

			}

	} else if (type == "select" && elementgroup[0] != null
			&& elementgroup[0] != undefined) {

		var options = elementgroup[0].options;
		for ( var j = 0; j < options.length; j++)
			if (options[j].selected == true) {
				return options[j];
			}

	} else if (type == "checkbox") {
		for ( var j = 0; j < elementgroup.length; j++) {

			if (elementgroup[j].checked) {
				output += elementgroup[j].value + "|";

			}

		}
		return output.substring(0, output.length - 1);

	} else {
		output = elementgroup[0].value;

		return output;

	}

}

function unsetValueOfElementByName(elementId, value) {
	var elements = document.getElementsByName(elementId);
	if (elements == undefined)
		return false;

	for ( var i = 0; i < elements.length; i++) {
		var type = elements[i].type;
		var name = elements[i].name;

		if (type == "radio") {
			deselectElement(name, value, "radio");
			return true;
		} else if (type == "checkbox") {
			deselectElement(name, value, "radio");
			return true;
		} else if (type == "select") {
			deselectElement(name, value, "select");
			return true;
		} else {
			if (elements[i].value == value)
				elements[i].value = '';
			return true;
		}

	}

}

function resetElementByName(elementname) {

	var elements = document.getElementsByName(elementname);
	if (elements == undefined)
		return false;

	var value = "";

	for ( var i = 0; i < elements.length; i++) {
		var type = elements[i].type;
		var name = elements[i].name;
		if (type == "radio") {
			resetElement(name, value, "radio");
			return true;
		} else if (type == "checkbox") {

			resetElement(name, value, "radio");
			return true;
		} else if (type == "select") {
			resetElement(name, value, "select");
			return true;
		} else {

			elements[i].value = value;
			return true;
		}

	}

}

function compareTwoArraysOfValues(operator, value1, value2) {

	if (operator == "sub") {
		var test = 0;
		for ( var i = 0; i < value1.length; i++) {
			for ( var j = 0; j < value2.length; j++) {
				if (value1[i] == value2[j]) {
					test++;
					continue;
				}

			}

		}

		if (test == value1.length && test > 0)
			return true;
		else
			return false;

	}

	if (operator == "sup") {
		var test = 0;
		for ( var i = 0; i < value2.length; i++) {
			for ( var j = 0; j < value1.length; j++) {
				if (value2[i] == value1[j]) {
					test++;
					continue;
				}

			}

		}

		if (test == value2.length && test > 0)
			return true;
		else
			return false;

	}

	if (value1.length != value2.length) {
		return false;
	}

	if (value1.length == 0) {
		return false;
	}

	for ( var i = 0; i < value1.length; i++) {
		if (!compareValues(operator, value1[i], value2[i])) {
			return false;
		}
	}

	return true;

}


function compareValues(operator, value1,value2)
{
	

	if(value1 == '' || value2 == '' || value1 == null || value2 == null || value1 == undefined || value2==undefined)
		return false;

	

	if(operator == "==")
		return value1 == value2;
	else if(operator == ">=")
		return value1 >= value2;
	else if(operator == ">")
		return value1 > value2;
	else if(operator == "<=")
		return value1 <= value2;
	else if(operator == "<")
		return value1 < value2;
	else if(operator == "!=")
		return value1 != value2;
	else
		return false;

}

function toArray(value)
{
	result = new Array();
	result[0] = value;
	return result;
	
}

function getIdOfElement(element)
{
	type = element.type;

	if(!isArray(element))
	{
		return element.id;

	}
	else
	{
		return element[0].id;
		
	}
	
}

function matchValues(regex, values) {
	var test = true;

	if (regex == '')
		return test;
	var re = new RegExp(regex);

	// alert("values:" +values+" "+values.length);
	for ( var i = 0; i < values.length; i++) {
		var value = values[i];
		if (!value.match(re))
			test = false;
	}

	return test;
}


function checkInput(regex, values, errorDivId) {

	if (document.getElementById(errorDivId) == null)
		return;
	if (regex == '')
		return;

	if (!matchValues(regex, values)) {

		document.getElementById(errorDivId).innerHTML = "invalid input format";

	} else {
		if (document.getElementById(errorDivId).innerHTML != '') {
			document.getElementById(errorDivId).innerHTML = '';
		}
	}
	return;

}



function resizeText(elementId, min) {
	var val = document.getElementById(elementId).value;
	if (val.length > min)
		document.getElementById(elementId).size = val.length;
	else
		document.getElementById(elementId).size = min;

}

function ajaxSimpleUpdate(requestData, page, updateSelector,after) {
	$.ajax({
		type : "GET",
		dataType : "html",
		url : page,
		data : requestData,
		cache : false,
		success : function(data) {
			$(updateSelector).html(data);
			if( after && typeof(after) === 'function' ){
				after.call();
			}
		}
	});
}