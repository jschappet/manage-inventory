<%@ include file="/WEB-INF/include.jsp"%>

<div class="hero-unit">
	<h1>manage-inventory</h1>
	<p>
		Bacon ipsum dolor sit amet sirloin pork chop pancetta, kielbasa beef ribs shankle hamburger salami sausage. 
		Spare ribs capicola shankle short ribs, bacon chicken ground round. Jerky ribeye meatball bacon sausage. 
		Tail pork loin pastrami capicola shank andouille tri-tip bacon bresaola tenderloin prosciutto swine sirloin.
	</p>
	<a href="#myModal" class="btn btn-primary btn-large" data-toggle="modal">Learn More</a>
</div>

<div id="myModal" class="modal hide fade">
	<div class="modal-header">
		<h3>manage-inventory</h3>
	</div>
	<div class="modal-body">
		<p>Welcome to manage-inventory.</p>
	</div>
	<div class="modal-footer">
		<a class="btn btn-primary" id="okModalButton">Ok</a>
		<a class="btn" id="closeModalButton">Close</a> 
	</div>
</div>

<script type="text/javascript">
	$('#closeModalButton, #okModalButton').click(function(){
		$('#myModal').modal('hide');
	});
</script>
