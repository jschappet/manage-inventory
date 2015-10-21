function intializePage(){
	$( 'table.table-datatable' ).each(function( i, el ){
		$( el ).dataTable();
	});
}