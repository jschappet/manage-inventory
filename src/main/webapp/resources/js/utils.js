function disableEnterKeySubmission( focusNext ){
	$( 'body' ).on( 'keydown', 'input, select', function( e ){ // exclude textarea, we want to be able to have new lines in these
		var self = $( this );
		var form = self.parents( 'form:eq(0)' );
		var focusable, next;
		if ( e.keyCode == 13 ) {
			focusable = form.find( 'input,a,select,button' ).filter( ':visible' ); // exclude textarea, we want to be able to have new lines in these 
			next = focusable.eq( focusable.index( this ) + 1 );
			if ( next.length ) {
				if ( focusNext ) {
					next.focus();
				}
			} else {
				// do nothing 
			}
			return false;
		}
	} );
}

function ApplicationTimeout( args ){

	var ctime = undefined;
	var timeleft = new Date();
	var interval = undefined;

	var options = {
		timeoutUrl : undefined,
		keppAliveUrl : undefined,
		modalDelay : 1140000, // milliseconds = 19 minute
		postNoticeDelay : 60000, // milliseconds = 1 minute
		modal : undefined,
		continueButton : undefined,
		timerContainer : undefined,
		labelUpdateDelay : 500
	};

	jQuery.extend( true, options, args );

	this.start = function(){
		start();
	};

	this.reset = function(){
		reset();
	};

	options.continueButton.click( function(){
		options.modal.modal( 'hide' );
		$.ajax( {
			url : options.keppAliveUrl,
			cache : false,
			dataType : 'json'
		} ).always( function(){
			reset();
		} );
	} );

	function start(){
		ctime = setTimeout( function(){
			keepAlive();
		}, options.modalDelay );
		if ( options.timerContainer.length > 0 ) {
			if ( interval ) {
				clearInterval( interval );
			}
			timeleft = new Date().getTime() + options.modalDelay;
			interval = setInterval( function(){
				setTheLabel();
			}, options.labelUpdateDelay );
		}
	}

	function keepAlive(){
		options.modal.modal( 'show' );
		clearTimeout( ctime );
		if ( options.timerContainer.length > 0 ) {
			if ( interval ) {
				clearInterval( interval );
			}
			timeleft = new Date().getTime() + options.postNoticeDelay;
			interval = setInterval( function(){
				setTheLabel();
			}, options.labelUpdateDelay );
		}
		ctime = setTimeout( function(){
			window.location.assign( options.timeoutUrl );
		}, options.postNoticeDelay );
	}

	function reset(){
		clearTimeout( ctime );
		start();
	}

	function setTheLabel(){
		var now = new Date().getTime();
		var totalSecondsLeft = ( timeleft - now ) / 1000;
		var hoursLeft = Math.floor( totalSecondsLeft / 3600 );
		totalSecondsLeft = totalSecondsLeft % 3600;
		var minutesLeft = Math.floor( totalSecondsLeft / 60 );
		totalSecondsLeft = Math.floor( totalSecondsLeft % 60 );
		var label = '';
		if ( hoursLeft > 0 || totalSecondsLeft > 0 || minutesLeft > 0 ) {
			if ( hoursLeft > 0 ) {
				label += formatTimeValue( hoursLeft ) + ':';
			}
			label += formatTimeValue( minutesLeft ) + ":" + formatTimeValue( totalSecondsLeft );
		} else {
			label = "00:00";
		}
		options.timerContainer.text( label );
	}

	function formatTimeValue( value ){
		return ( value < 10 ? "0" : "" ) + value;
	}
}

function setupAutoComplete( args ){

	var options = {
		fields : [],
		url : undefined,
		var_name : undefined,
		target : undefined,
		tmp_html : undefined,
		buttonId : undefined,
		loadingId : undefined,
		loadingUrl : undefined
	};

	$.extend( true, options, args );

	if ( options.buttonId ) {
		$( '#' + options.buttonId ).click( function(){
			var hasLength = false;
			for ( var i = 0; i < options.fields.length; i++ ) {
				var field = options.fields[ i ];
				if ( $( '#' + field.elementId ).val().trim().length > 2 ) {
					hasLength = true;
				}
			}
			if ( hasLength ) {
				var params = [];
				for ( var i = 0; i < options.fields.length; i++ ) {
					var field = options.fields[ i ];
					params.push( {
						"name" : field.name,
						"value" : $( '#' + field.elementId ).val().trim()
					} );
				}
				params.push( {
					"name" : "var_name",
					"value" : options.var_name
				} );
				$.ajax( {
					url : options.url,
					data : params,
					cache : false,
					beforeSend : function(){
						if ( options.loadingId && options.loadingUrl ) {
							$( '#' + options.loadingId ).html( '<img src="' + options.loadingUrl + '" alt="loading..." />' );
						} else if ( options.loadingId ) {
							$( '#' + options.loadingId ).html( 'loading...' );
						}
					},
					success : function( data ){
						if ( options.loadingId ) {
							$( '#' + options.loadingId ).html( '' );
						}
						// if( data.trim().length > 1 ){
						$( '#' + options.target ).html( data );
						// } else {
						//	$( '#' + options.target ).html( "<em>No results found</em>" );
						// }
					}
				} );
			} else {
				$( '#' + options.target ).html( options.tmp_html );
			}
		} );
	} else {
		var selector = '';
		var count = 0;
		for ( var i = 0; i < options.fields.length; i++ ) {
			var field = options.fields[ i ];
			if ( count > 0 ) {
				selector += ', ';
			}
			selector += '#' + field;
			count++;
		}
		$( selector ).keyup( function(){
			var hasLength = false;
			for ( var i = 0; i < options.fields.length; i++ ) {
				var field = options.fields[ i ];
				if ( $( '#' + field.elementId ).val().trim().length > 2 ) {
					hasLength = true;
				}
			}
			if ( hasLength ) {

				var params = [];
				for ( var i = 0; i < options.fields.length; i++ ) {
					var field = options.fields[ i ];
					params.push( {
						"name" : field.name,
						"value" : $( '#' + field.elementId ).val().trim()
					} );
				}
				params.push( {
					"name" : "var_name",
					"value" : options.var_name
				} );

				$.ajax( {
					url : options.url,
					data : params,
					cache : false,
					beforeSend : function(){
						if ( options.loadingId && options.loadingUrl ) {
							$( '#' + options.loadingId ).html( '<img src="' + options.loadingUrl + '" alt="loading..." />' );
						} else if ( options.loadingId ) {
							$( '#' + options.loadingId ).html( 'loading...' );
						}
					},
					success : function( data ){
						if ( options.loadingId ) {
							$( '#' + options.loadingId ).html( '' );
						}
						// if( data.trim().length > 1 ){
						$( '#' + options.target ).html( data );
						// } else {
						//	$( '#' + options.target ).html( "<em>No results found</em>" );
						// }
					}
				} );
			} else {
				$( '#' + options.target ).html( options.tmp_html );
			}
		} );
	}
}

function regExpCheck( regex, stringToCheck ){
	return ( new RegExp( regex ) ).test( stringToCheck );
}

function isTimeOfDay( stringToCheck ){
	var pattern = new RegExp( /^(((0?[1-9]|1[012])(:[0-5][0-9])?(\s)?([a|A|p|P][m|M])))\b/ );
	return pattern.test( stringToCheck );
}

function isTimeHour( stringToCheck ){
	var pattern = new RegExp( /^(0{0,1}?[1-9]|1[012])$/ );
	return pattern.test( stringToCheck );
}

function isTimeMinute( stringToCheck ){
	var pattern = new RegExp( /^(0{0,1}?[0-9]|[0-5][0-9])$/ );
	return pattern.test( stringToCheck );
}

function isInteger( stringToCheck ){
	var pattern = new RegExp( /^\d+$/ );
	return pattern.test( stringToCheck );
}

function isDecimal( stringToCheck ){
	var pattern = new RegExp( /^(\d+\.?\d*|\.\d+)$/ );
	return pattern.test( stringToCheck );
}

function isEmailAddress( emailAddress ){
	var pattern = new RegExp( /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i );
	return pattern.test( emailAddress );
}

function isPhoneNumber( stringToCheck ){
	var pattern = new RegExp( /^\+?[0-9]{0,15}$/ );
	return pattern.test( stringToCheck );
}

function isSocialSecurityNumber( stringToCheck ){
	var pattern = new RegExp( /^\d{9}$/ );
	return pattern.test( stringToCheck );
}

function checkEnter( e ){
	e = e || event;
	var txtArea = /textarea/i.test( ( e.target || e.srcElement ).tagName );
	return txtArea || ( e.keyCode || e.which || e.charCode || 0 ) !== 13;
}

function dateIsAfterToday( textDate ){
	if ( isDate( textDate ) ) {
		var then = new Date( textDate );
		var today = new Date();
		if ( then > today ) {
			return true;
		}
	}
	return false;
}

function isDate( txtDate ){
	var objDate, // date object initialized from the txtDate string
	mSeconds, // txtDate in milliseconds
	day, // day
	month, // month
	year; // year

	// date length should be 10 characters (no more no less)
	if ( txtDate.length !== 10 ) {
		return false;
	}

	// third and sixth character should be '/'
	if ( txtDate.substring( 3, 4 ) !== '/' || txtDate.substring( 6, 7 ) !== '/' ) {
		return false;
	}
	// extract month, day and year from the txtDate ( expected format is yyyy-mm-dd )
	// subtraction will cast variables to integer implicitly ( needed for !== comparing )

	year = txtDate.substring( 0, 4 ) - 0;
	month = txtDate.substring( 5, 7 ) - 1; // because months in JS start from 0
	day = txtDate.substring( 8, 10 ) - 0;

	// test year range
	if ( year < 1000 || year > 3000 ) {
		return false;
	}
	// convert txtDate to milliseconds
	mSeconds = ( new Date( year, month, day ) ).getTime();
	// initialize Date() object from calculated milliseconds
	objDate = new Date();
	objDate.setTime( mSeconds );
	// compare input date and parts from Date() object
	// if difference exists then date isn't valid
	if ( objDate.getFullYear() !== year || objDate.getMonth() !== month || objDate.getDate() !== day ) {
		return false;
	}
	// otherwise return true
	return true;
}

String.prototype.endsWith = function( suffix ){
	return this.indexOf( suffix, this.length - suffix.length ) !== -1;
};
String.prototype.trim = function(){
	return this.replace( /^\s+|\s+$/g, '' );
};
String.prototype.ltrim = function(){
	return this.replace( /^\s+/, '' );
};
String.prototype.rtrim = function(){
	return this.replace( /\s+$/, '' );
};
String.prototype.fulltrim = function(){
	return this.replace( /(?:(?:^|\n)\s+|\s+(?:$|\n))/g, '' ).replace( /\s+/g, ' ' );
};

Array.prototype.addAll = Array.prototype.addAll || function( elements ){
	if ( elements != undefined ) {
		for ( var l = 0; l < elements.length; l++ ) {
			this.push( elements[ l ] );
		}
	}
	return this;
};

function listCookies(){
	return $.cookie();
}

function deleteCookie( name ){
	$.cookie( name, null, {
		expires : 0,
		path : '/'
	} );
}

function getCookie( c_name ){
	return $.cookie( c_name );
}

function setCookie( c_name, value, exdays ){
	$.cookie( c_name, value, {
		expires : exdays,
		path : '/',
		secure : false
	} );
}

function nameAutoComplete( first, last, url, var_name, div, tmp_html ){
	var fname = $( '#' + first ).val().trim();
	var lname = $( '#' + last ).val().trim();
	if ( fname.length > 2 || lname.length > 2 ) {
		$.ajax( {
			url : url,
			beforeSend : function(){},
			data : {
				first : fname,
				last : lname,
				var_name : var_name
			},
			success : function( data ){
				if ( data.trim().length > 1 ) {
					$( '#' + div ).html( data );
				} else {
					$( '#' + div ).html( "<em>No results found</em>" );
				}
			}
		} );
	} else {
		$( '#' + div ).html( tmp_html );
	}
}

function setDataTable( args ){
	var options = {
		id : undefined,
		url : 'datatable',
		pagingType : 'full_numbers',
		serverSide : true,
		processing : true,
		lengthMenu : [ [ 10, 25, 50, 100 ], [ 10, 25, 50, 100 ] ],
		pageLength : 10,
		dom : "<'row'<'col-xs-6'l><'col-xs-6'>>" + "rt" + "<'row'<'col-xs-6'i><'col-xs-6'p>>",
		individualSearching : true,
		includeClearButton : true,
		searching : true,
		ordering : true,
		responsive : true,
		paging : true,
		jQueryUI : false,
		displayStart : 0,
		language : {
			emptyTable : "No data found matching your criteria."
		},
		columns : undefined,
		autoWidth : false,
		extraData : undefined,
		columns : undefined,
		order : undefined,
		colVis : true,
		stateSave : undefined,
		drawCallback : undefined,
		initCallback : undefined,
		rowCallback : undefined,
		destroyCallback : undefined,
		contentType : 'application/json'
	};

	if ( args ) {
		jQuery.extend( true, options, args );
	}

	var initSort = null;
	for ( var i = 0; i < options.columns.length; i++ ) {
		if ( options.columns[ i ].orderable == true ) {
			initSort = i;
			break;
		}
	}

	var colVisExclude = [];
	for ( var i = 0; i < options.columns.length; i++ ) {
		if ( options.columns[ i ].name == 'urls' ) {
			colVisExclude.push( i );
		} else if ( options.columns[ i ].colVisExclude == true ) {
			colVisExclude.push( i );
		}

		if ( options.columns[ i ].defaultContent == undefined ) {
			options.columns[ i ].defaultContent = '';
		}
	}

	var sortingArr = [];
	if ( initSort != null ) {
		sortingArr = [ [ initSort, "asc" ] ];
	}

	var theActualUrl;
	if ( typeof options.url === 'function' ) {
		theActualUrl = options.url.call();
	} else {
		theActualUrl = options.url;
	}

	var table = $( '#' + options.id ).on( 'init.dt', function( e, settings, json ){
		if ( options.initCallback && typeof options.initCallback === 'function' ) {
			options.initCallback();
		}
	} ).on( 'column-visibility.dt', function( e, settings, column, visible ){
		// if responsive === true or using ColVis then this will be called when columns are hidden, 
		// we need to hide the elements in the header search row too
		if ( visible ) {
			$( '#dataTableSearchRowTd_' + column, '#' + options.id ).show();
		} else {
			$( '#dataTableSearchRowTd_' + column, '#' + options.id ).hide();
		}
	} ).on( 'destroy.dt', function( e, settings ){
		$( 'tr.dataTableSearchRow', '#' + options.id ).remove();
		if ( options.destroyCallback && typeof options.destroyCallback === 'function' ) {
			options.destroyCallback();
		}
	} ).DataTable( {
		orderCellsTop : true,
		stateSave : options.stateSave == undefined ? $.fn.dataTable.defaults.stateSave == true : options.stateSave,
		serverSide : options.serverSide,
		processing : options.processing,
		lengthMenu : options.lengthMenu,
		dom : ( options.colVis == true ? "C" : "" ) + "<'row'<'col-xs-6'l><'col-xs-6'" + ( options.individualSearching == true || options.searching != true ? "" : "f" ) + ">>" + "rt" + "<'row'<'col-xs-6'i><'col-xs-6'p>>",
		colVis : options.colVis != true ? undefined : {
			overlayFade : 0,
			buttonText : 'Show/Hide Columns',
			showAll : 'Show All',
			showNone : 'Hide All',
			restore : 'Reset',
			align : 'right',
			exclude : colVisExclude
		},
		ordering : options.ordering,
		searching : options.searching,
		paging : options.paging,
		jQueryUI : options.jQueryUI,
		displayStart : options.displayStart,
		pageLength : options.pageLength,
		language : options.language,
		columns : options.columns,
		autoWidth : options.autoWidth,
		order : options.order || sortingArr,
		rowCallback : function( row, data ){
			if ( options.rowCallback && typeof options.rowCallback === 'function' ) {
				options.rowCallback( row, data );
			}
		},
		responsive : options.responsive !== true ? false : {
			details : {
				renderer : function( api, rowIdx ){
					
					if( options.colVis == true ){
						$.fn.dataTable.ColVis.fnRebuild( table );
					}
					
					// select hidden columns for the given row
					var data = api.cells( rowIdx, ':hidden' ).eq( 0 ).map( function( cell ){

						var header = $( api.column( cell.column ).header() );

						var contents = api.cell( cell ).data();
						if ( contents == null || contents == '' ) {
							contents = '<span class="label label-danger">NA</span>';
						}

						if ( options.columns[ cell.column ].name == 'urls' ) {
							return '<li>' + contents + '</li>';
						} else {
							return '<li>' + header.text() + ' : ' + contents + '</li>';
						}

					} ).toArray().join( '' );

					return data ? $( '<ul />' ).append( data ) : false;
				}
			}
		},
		ajax : {
			url : theActualUrl,
			dataType : 'json',
			type : 'post',
			contentType : options.contentType,
			data : function( object, settings ){

				object[ 'columnCount' ] = options.columns.length;
				object[ 'individualSearch' ] = options.individualSearching === true ? true : false;

				if ( options.extraData ) {
					var e_data;
					if ( typeof options.extraData === 'function' ) {
						e_data = options.extraData.call();
					} else {
						e_data = options.extraData;
					}
					for ( var i = 0; i < e_data.length; i++ ) {
						var value;
						if ( typeof e_data[ i ].value === 'function' ) {
							value = e_data[ i ].value.call();
						} else {
							value = e_data[ i ].value;
						}
						if ( object[ e_data[ i ].name ] === undefined ) {
							object[ e_data[ i ].name ] = value;
						} else {
							$.error( 'duplicate datatable variable name : ' + e_data[ i ].name + ', value  = ' + value );
						}
					}
				}

				return ( options.contentType == 'application/json' ? JSON.stringify( object ) : object );
			}
		},
		drawCallback : function( settings ){
			if ( options.drawCallback && typeof ( options.drawCallback ) === 'function' ) {
				options.drawCallback( settings );
			}
		},
		initComplete : function(){

			var _table = this;

			// http://www.cambiaresearch.com/articles/15/javascript-char-codes-key-codes
			var ignoredKeyCodes = [ 9, 13, 16, 17, 18, 27, 37, 38, 39, 40 ];

			if ( options.individualSearching == true && options.searching == true ) {

				var head = $( _table.api().table().header() );

				var tr = document.createElement( 'tr' );
				$( head ).append( tr );
				$( tr ).attr( 'role', 'row' );
				$( tr ).attr( 'class', 'dataTableSearchRow' );

				_table.api().columns().every( function(){

					var _column = this;

					var columnIndex = _column.index();
					var column = options.columns[ columnIndex ];

					var td = document.createElement( 'td' );
					$( tr ).append( td );
					$( td ).attr( 'id', 'dataTableSearchRowTd_' + columnIndex );
					$( td ).css( 'padding', '1px' );
					$( td ).css( 'line-height', 'auto' );
					$( td ).css( 'height', 'auto' );

					if ( _column.visible() !== true ) {
						$( td ).css( 'display', 'none' );
					}

					if ( column.searchable ) {

						if ( column.searchInput ) {
							if ( column.searchInput.id == undefined ) {
								$.error( 'id not defined for search input for column ' + JSON.stringify( column ) );
							} else if ( column.searchInput.html == undefined ) {
								$.error( 'html not defined for search input for column ' + JSON.stringify( column ) );
							} else {
								$( td ).append( column.searchInput.html );
								if( _column.search() && _column.search().trim != '' ){
									$( '#' + column.searchInput.id, '#' + options.id ).val( _column.search() );
								}
								$( '#' + column.searchInput.id, '#' + options.id ).keyup( function( e ){
									if ( ignoredKeyCodes.indexOf( e.keyCode ) == -1 ) {
										_column.search( $( this ).val(), false ).draw();
									}
								} );
							}
						} else {
						
							var inputId = options.id + '-dtSearch-' + columnIndex;

							var div = document.createElement( 'div' );
							$( td ).append( div );
							$( div ).addClass( ( options.includeClearButton == true ? 'input-group' : 'form-group' ) );
							$( div ).css( 'margin', '0' );

							var label = document.createElement( 'label' );
							$( div ).append( label );
							$( label ).attr( 'for', inputId );
							$( label ).addClass( 'sr-only' );
							$( label ).html( column.placeholder || column.title || column.name );

							var input = document.createElement( 'input' );
							input.type = 'text';
							$( div ).append( input );

							$( input ).attr( 'id', inputId );
							$( input ).attr( 'autocomplete', 'off' );
							$( input ).addClass( 'form-control' );
							$( input ).attr( 'placeholder', column.placeholder || column.title || column.name );
							if( _column.search() && _column.search().trim != '' ){
								$( input ).val( _column.search() );
							}

							$( input ).keyup( function( e ){
								if ( ignoredKeyCodes.indexOf( e.keyCode ) == -1 ) {
									_column.search( $( this ).val(), false ).draw();
								}
							} );
							
							if( options.includeClearButton == true ){
								
								var span = document.createElement( 'span' );
								$( div ).append( span );
								$( span ).addClass( 'input-group-btn' );
								
								var button = document.createElement( 'button' );
								button.type = 'button';
								$( span ).append( button );
								$( button ).addClass( 'btn btn-default' );
								$( button ).attr( 'title', 'clear search value for ' + ( column.placeholder || column.title || column.name ) );
								$( button ).html( 'X' );
								
								$( button ).click( function( e ){
									if( $( input ).val().trim() != '' ){
										$( input ).val( '' );
										_column.search( '', false ).draw();
									}
								} );
								
							}
							
						}
					}
				} );
			}
		}
	} );

	return table;
}

var start = 300;
var timer = start;
var inter;
function timeout( pp ){

	if ( timer > 0 ) {
		timer -= 1;
		setTimeout( "timeout(\'" + pp + "\')", 1500 );
	} else {
		ok = confirm( "Session timed out due to inactivity. \n Would you like to close this session." );
		if ( ok ) {
			location.href = pp;
		}

	}
}

function toggle( divid, display ){
	var ele = document.getElementById( divid );
	if ( display == "hide" ) {
		ele.style.display = "none";
	} else {
		ele.style.display = "inline";

	}
}

function toggleBlock( divid, display ){
	var ele = document.getElementById( divid );
	if ( display == "hide" ) {
		ele.style.display = "none";
	} else {
		ele.style.display = "block";

	}
}

function toggleV( divid ){
	var ele = document.getElementById( divid );

	if ( ele.style.display == "block" || ele.style.display == "inline" ) {

		ele.style.display = "none";

	} else {
		ele.style.display = "inline";

	}
}

function showElement( id, max ){

	var obj = document.getElementById( id );
	var hh = obj.style.height;
	if ( hh == max ) {
		clearInterval( inter );
		return;
	}

	obj.style.visibility = 'visible';
	hh += 2;
	obj.style.height = hh + 'px';
}

function hideElement( id ){
	var obj = document.getElementById( id );
	var hh = obj.style.height;
	if ( hh == 2 ) {
		obj.style.visibility = 'hidden';
		obj.style.height = '0.1em';
		clearInterval( inter );
		return;
	}
	hh -= 2;
	obj.style.height = hh + 'px';
}

function moveOnMax( field, nextFieldName ){
	if ( field.value.length >= field.maxLength ) {
		document.getElementsByName( nextFieldName )[ 0 ].focus();
	}
}
function getdate(){
	var myDate = new Date();
	var output = myDate.getFullYear() + "-" + ( myDate.getMonth() + 1 ) + "-" + myDate.getDate();
	return output;
}

function selectElement( elem, init, type ){
	selectElementMain( elem, init, type, false );
}
function deselectElement( elem, init, type ){
	selectElementMain( elem, init, type, true );
}
function selectElementMain( elem, init, type, deselect ){

	var st = init;
	values = st.split( "|" );

	var elementgroup = document.getElementsByName( elem );

	for ( var a = 0; a < values.length; a++ ) {

		value = values[ a ];

		if ( type == "radio" ) {
			for ( j = 0; j < elementgroup.length; j++ )
				if ( elementgroup[ j ].value == value ) {
					if ( deselect )
						elementgroup[ j ].checked = false;
					else
						elementgroup[ j ].checked = true;
				}

		} else if ( type == "select" && elementgroup[ 0 ] != null && elementgroup[ 0 ] != undefined ) {

			var options = elementgroup[ 0 ].options;
			for ( j = 0; j < options.length; j++ )
				if ( options[ j ].value == value ) {
					if ( deselect )
						options[ j ].selected = false;
					else
						options[ j ].selected = true;
				}

		} else if ( type == "checkbox" ) {
			for ( j = 0; j < elementgroup.length; j++ ) {

				if ( elementgroup[ j ].value == value ) {
					if ( deselect )
						elementgroup[ j ].checked = 0;
					else
						elementgroup[ j ].checked = 1;

				}

			}

		}

	}

}

function resetElement( elem, init, type, deselect ){

	var st = init;
	var values = st.split( "|" );

	var elementgroup = document.getElementsByName( elem );

	for ( var a = 0; a < values.length; a++ ) {

		var value = values[ a ];

		if ( type == "radio" ) {
			for ( var j = 0; j < elementgroup.length; j++ ) {

				elementgroup[ j ].checked = false;

				//	elementgroup[j].checked = true;
			}

		} else if ( type == "select" && elementgroup[ 0 ] != null && elementgroup[ 0 ] != undefined ) {

			var options = elementgroup[ 0 ].options;
			for ( var j = 0; j < options.length; j++ )
				options[ j ].selected = false;

		} else if ( type == "checkbox" ) {
			for ( var j = 0; j < elementgroup.length; j++ ) {

				elementgroup[ j ].checked = 0;

			}

		} else {

			elementgroup[ j ].value = "";

		}

	}

}

function enableDisableElementById( st, enable ){

	var element = document.getElementById( st );

	enableDisableElementByName( element.name, enable );

}
function enableDisableElementByName( name, enable ){

	if ( enable == true )
		jQuery( '[name="' + name + "']" ).removeAttr( 'disabled' );
	else
		jQuery( '[name="' + name + "']" ).attr( 'disabled', 'disable' );
}

function boolToAnswer( bool ){
	if ( bool == 'true' )
		document.write( "Yes" );
	else if ( bool == 'false' )

		document.write( "No" );
	else
		document.write( "N/A" );

}

function processReqChange( req ){
	// only if req shows "loaded"
	if ( req.readyState == 4 ) {
		// only if "OK"
		if ( req.status == 200 ) {
			// ...processing statements go here...
		} else {
			alert( "There was a problem retrieving the XML data:\n" + req.statusText );
		}
	}
}

function sessionKeepAlive( url ){

	touchPage( url );
	setTimeout( "sessionKeepAlive(\'" + url + "\')", 900000 );

}

function touchPage( url ){

	var req = false;
	// branch for native XMLHttpRequest object
	if ( window.XMLHttpRequest && ! ( window.ActiveXObject ) ) {
		try {
			req = new XMLHttpRequest();
		} catch ( e ) {
			req = false;
		}
		// branch for IE/Windows ActiveX version
	} else if ( window.ActiveXObject ) {
		try {
			//req = new ActiveXObject("Msxml2.XMLHTTP");
			xmlDoc = new ActiveXObject( "Microsoft.XMLDOM" );
			xmlDoc.async = false;
			xmlDoc.validateOnParse = false;
			xmlDoc.resolveExternals = false;
			xmlDoc.preserveWhiteSpace = false;
			xmlDoc.load( url );
			return xmlDoc;
		} catch ( e ) {
			try {
				req = new ActiveXObject( "Microsoft.XMLHTTP" );

			} catch ( e ) {
				req = false;
			}
		}
	}
	if ( req ) {
		req.onreadystatechange = processReqChange( req );
		req.open( "GET", url, false );
		req.send( "" );
		return req.responseXML;
	}
	return "";
}

var showsidebar = true;
function toggleSidebar(){
	var message = '&larr; hide menu';
	if ( showsidebar ) {
		var sidebar = document.getElementById( "leftCol" );
		var center = document.getElementById( "centerCol" );
		sidebar.style.display = 'block';
		center.style.width = '750px';

	} else {
		var sidebar = document.getElementById( "leftCol" );
		var center = document.getElementById( "centerCol" );
		sidebar.style.display = 'none';
		center.style.width = '930px';
		message = 'show menu &rarr;';

	}
	showsidebar = !showsidebar;

	document.getElementById( "showhidebutton" ).innerHTML = '<a href="#" onclick="javascript:toggleSidebar();">' + message + '</a>';

}

function classDisplay( theClass, display ){

	if ( display == "hide" )
		$( "." + theClass ).hide();
	else
		$( "." + theClass ).show();

}

//chk if an object is an array or not.
function isArray( obj ){
	var length = obj.length;

	if ( length == undefined )
		return false;
	else
		return true;
}

function getValueOfElement( element ){

	var values = new Array();
	var valueCount = 0;

	var type = element.type;
	var name = element.name;

	if ( type == "radio" || type == "checkbox" ) {

		var elements = document.getElementsByName( name );
		for ( var ii = 0; ii < elements.length; ii++ ) {

			if ( elements[ ii ].checked ) {
				values[ valueCount ] = elements[ ii ].value;
				valueCount++;

			}

		}

		return values;
	} else if ( type == "select-one" || type == "select-multiple" || type == "select" ) {

		var options = element.options;

		for ( var jj = 0; jj < options.length; jj++ )
			if ( options[ jj ].selected ) {
				values[ valueCount ] = options[ jj ].value;
				valueCount++;

			}

		return values;
	} else {
		values[ 0 ] = element.value;

		return values;
	}

}

function setValueOfElementByName( elementName, value ){

	var elements = document.getElementsByName( elementName );
	if ( elements == undefined )
		return false;

	for ( var i = 0; i < elements.length; i++ ) {
		var type = elements[ i ].type;
		var name = elements[ i ].name;

		if ( type == "radio" ) {
			selectElement( name, value, "radio" );
			return true;
		} else if ( type == "checkbox" ) {
			selectElement( name, value, "radio" );
			return true;
		} else if ( type == "select" ) {
			selectElement( name, value, "select" );
			return true;
		} else if ( type == "textarea" ) {

			elements[ i ].value = value;
			return true;
		} else {
			elements[ i ].value = value;
			return true;
		}

	}

}

function getValueOfElementByName( elementName ){

	var output = "";

	var elementgroup = document.getElementsByName( elementName );
	var type = elementgroup.type;

	if ( type == "radio" ) {
		for ( var j = 0; j < elementgroup.length; j++ )
			if ( elementgroup[ j ].checked == true ) {
				return elementgroup[ j ].value;

			}

	} else if ( type == "select" && elementgroup[ 0 ] != null && elementgroup[ 0 ] != undefined ) {

		var options = elementgroup[ 0 ].options;
		for ( var j = 0; j < options.length; j++ )
			if ( options[ j ].selected == true ) {
				return options[ j ];
			}

	} else if ( type == "checkbox" ) {
		for ( var j = 0; j < elementgroup.length; j++ ) {

			if ( elementgroup[ j ].checked ) {
				output += elementgroup[ j ].value + "|";

			}

		}
		return output.substring( 0, output.length - 1 );

	} else {
		output = elementgroup[ 0 ].value;

		return output;

	}

}

function unsetValueOfElementByName( elementId, value ){
	var elements = document.getElementsByName( elementId );
	if ( elements == undefined )
		return false;

	for ( var i = 0; i < elements.length; i++ ) {
		var type = elements[ i ].type;
		var name = elements[ i ].name;

		if ( type == "radio" ) {
			deselectElement( name, value, "radio" );
			return true;
		} else if ( type == "checkbox" ) {
			deselectElement( name, value, "radio" );
			return true;
		} else if ( type == "select" ) {
			deselectElement( name, value, "select" );
			return true;
		} else {
			if ( elements[ i ].value == value )
				elements[ i ].value = '';
			return true;
		}

	}

}

function resetElementByName( elementname ){

	var elements = document.getElementsByName( elementname );
	if ( elements == undefined )
		return false;

	var value = "";

	for ( var i = 0; i < elements.length; i++ ) {
		var type = elements[ i ].type;
		var name = elements[ i ].name;
		if ( type == "radio" ) {
			resetElement( name, value, "radio" );
			return true;
		} else if ( type == "checkbox" ) {

			resetElement( name, value, "radio" );
			return true;
		} else if ( type == "select" ) {
			resetElement( name, value, "select" );
			return true;
		} else {

			elements[ i ].value = value;
			return true;
		}

	}

}

function compareTwoArraysOfValues( operator, value1, value2 ){

	if ( operator == "sub" ) {
		var test = 0;
		for ( var i = 0; i < value1.length; i++ ) {
			for ( var j = 0; j < value2.length; j++ ) {
				if ( value1[ i ] == value2[ j ] ) {
					test++;
					continue;
				}

			}

		}

		if ( test == value1.length && test > 0 )
			return true;
		else
			return false;

	}

	if ( operator == "sup" ) {
		var test = 0;
		for ( var i = 0; i < value2.length; i++ ) {
			for ( var j = 0; j < value1.length; j++ ) {
				if ( value2[ i ] == value1[ j ] ) {
					test++;
					continue;
				}

			}

		}

		if ( test == value2.length && test > 0 )
			return true;
		else
			return false;

	}

	if ( value1.length != value2.length ) {
		return false;
	}

	if ( value1.length == 0 ) {
		return false;
	}

	for ( var i = 0; i < value1.length; i++ ) {
		if ( !compareValues( operator, value1[ i ], value2[ i ] ) ) {
			return false;
		}
	}

	return true;

}

function compareValues( operator, value1, value2 ){

	if ( value1 == '' || value2 == '' || value1 == null || value2 == null || value1 == undefined || value2 == undefined )
		return false;

	if ( operator == "==" )
		return value1 == value2;
	else if ( operator == ">=" )
		return value1 >= value2;
	else if ( operator == ">" )
		return value1 > value2;
	else if ( operator == "<=" )
		return value1 <= value2;
	else if ( operator == "<" )
		return value1 < value2;
	else if ( operator == "!=" )
		return value1 != value2;
	else
		return false;

}

function toArray( value ){
	result = new Array();
	result[ 0 ] = value;
	return result;

}

function getIdOfElement( element ){
	type = element.type;

	if ( !isArray( element ) ) {
		return element.id;

	} else {
		return element[ 0 ].id;

	}

}

function matchValues( regex, values ){
	var test = true;

	if ( regex == '' )
		return test;
	var re = new RegExp( regex );

	// alert("values:" +values+" "+values.length);
	for ( var i = 0; i < values.length; i++ ) {
		var value = values[ i ];
		if ( !value.match( re ) )
			test = false;
	}

	return test;
}

function checkInput( regex, values, errorDivId ){

	if ( document.getElementById( errorDivId ) == null )
		return;
	if ( regex == '' )
		return;

	if ( !matchValues( regex, values ) ) {

		document.getElementById( errorDivId ).innerHTML = "invalid input format";

	} else {
		if ( document.getElementById( errorDivId ).innerHTML != '' ) {
			document.getElementById( errorDivId ).innerHTML = '';
		}
	}
	return;

}

function resizeText( elementId, min ){
	var val = document.getElementById( elementId ).value;
	if ( val.length > min )
		document.getElementById( elementId ).size = val.length;
	else
		document.getElementById( elementId ).size = min;

}

function ajaxSimpleUpdate( requestData, page, updateSelector, after ){
	$.ajax( {
		type : "GET",
		dataType : "html",
		url : page,
		data : requestData,
		cache : false,
		success : function( data ){
			$( updateSelector ).html( data );
			if ( after && typeof ( after ) === 'function' ) {
				after.call();
			}
		}
	} );
}