function intializePage(){
	$('.table-datatable').each(function(index,element){
		$(element).dataTable({
			sPaginationType : "bootstrap",        
		    bSort 			: true,
	        bFilter 		: true,
	       	bJQueryUI 		: false,
	       	bPaginate 		: true,
	       	iDisplayLength  : 10,
	       	aLengthMenu		: [[10, 25, 50, -1], [10, 25, 50, "All"]],
	       	aaSorting		: [[ 0, "asc" ]],
	       	bAutoWidth		: false
		});
	});

	var d = new Date();
	$('.dateInput').each(function(index,element){
		$(element).datepicker({
			dateFormat : 'yy-mm-dd'
		});
		if( $( element ).hasClass('defaultNow') && $( element ).val() == '' ){
		    var curr_date = d.getDate();
		    var curr_month = d.getMonth() + 1; //Months are zero based
		    var curr_year = d.getFullYear();
		    $( element ).val( curr_year + "-" + (curr_month < 10 ? "0" : "") + curr_month + "-" + (curr_date < 10 ? "0" : "") + curr_date);
		}
	});

	tinymce.init({
	    selector: "textarea.basic_tinymce",
	    plugins: [
	        "advlist autolink lists link image charmap print preview anchor",
	        "searchreplace visualblocks code fullscreen",
	        "insertdatetime media table contextmenu paste" // moxiemanager 
	    ],
	    toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
	});

	tinymce.init({
	    selector: "textarea.advanced_tinymce",
	    plugins: [
              "advlist autolink lists link image charmap print preview hr anchor pagebreak",
              "searchreplace wordcount visualblocks visualchars code fullscreen",
              "insertdatetime media nonbreaking save table contextmenu directionality",
              "emoticons template paste textcolor" // moxiemanager 
     	],
      	toolbar1: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
      	toolbar2: "print preview media | forecolor backcolor emoticons",
      	image_advtab: true,
      	templates: [
        	{title: 'Test template 1', content: 'Test 1'},
          	{title: 'Test template 2', content: 'Test 2'}
      	]
	});

	tinymce.init({
        selector: "textarea.classic_tinymce",
        plugins: [
            "advlist autolink autosave link image lists charmap print preview hr anchor pagebreak spellchecker",
            "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
            "table contextmenu directionality emoticons template textcolor paste fullpage textcolor"
        ],
        toolbar1: "newdocument fullpage | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect",
        toolbar2: "cut copy paste | searchreplace | bullist numlist | outdent indent blockquote | undo redo | link unlink anchor image media code | inserttime preview | forecolor backcolor",
        toolbar3: "table | hr removeformat | subscript superscript | charmap emoticons | print fullscreen | ltr rtl | spellchecker | visualchars visualblocks nonbreaking template pagebreak restoredraft",
        menubar: false,
        toolbar_items_size: 'small',
        style_formats: [
        	{title: 'Bold text', inline: 'b'},
			{title: 'Red text', inline: 'span', styles: {color: '#ff0000'}},
            {title: 'Red header', block: 'h1', styles: {color: '#ff0000'}},
            {title: 'Example 1', inline: 'span', classes: 'example1'},
            {title: 'Example 2', inline: 'span', classes: 'example2'},
            {title: 'Table styles'},
            {title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
        ],
        templates: [
            {title: 'Test template 1', content: 'Test 1'},
            {title: 'Test template 2', content: 'Test 2'}
        ]
	});
}