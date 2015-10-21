<%@ include file="/WEB-INF/include.jsp"%>

<c:if test="${ isUserSwitched eq true }">
	<c:redirect url="/"/>
</c:if>

<c:url value="/do-switch-user" var="formActionUrl" />
<c:url value="/" var="cancelUrl" />

<div class="row">
	<div class="col-xs-12 col-md-6">
		<form action="${ formActionUrl }" method="post" id="switch_user_form">
			<fieldset>
			
				<legend>Switch User</legend>
				
				<div id="error_div" style="display: none;" class="alert alert-danger"></div>
				
				<c:if test="${ param.error and not empty param.message }">
					<script type="text/javascript">
						$(function(){
							showMessage( 'error_div', '${ param.message }' );
						});
					</script>
				</c:if>
				
				<div class="form-group">
					<label for="first" class="control-label">First Name</label>
					<div class="controls">
						<input id="first" type="text" class="form-control" />
					</div>
				</div>
				
				<div class="form-group">
					<label for="last" class="control-label">Last Name</label>
					<div class="controls">
						<input id="last" type="text" class="form-control" />
					</div>
				</div>
				
				<button type="button" id="search_button" class="btn btn-success">Search</button> <span style="margin-left: 10px;" id="loading_results"></span>
		
				<div class="form-group">
					<div id="results" style="margin: 15px 0;">
						Enter a first and last name and click 'Search' to view results.
					</div>
				</div>
		
				<input type="submit" value="Switch" class="btn btn-primary" />
				<a href="${ cancelUrl }" class="btn btn-default">Cancel</a>
				
			</fieldset>
		</form>
	</div>
</div>

<c:if test="${ not empty error }">
	<script type="text/javascript">
		showMessage( 'error_div', '${ error }' );
	</script>
</c:if>

<c:url value="/rest/ldap/search" var="auto_url" />
<c:url value="/resources/images/loading.gif" var="loading_url" />
<script type="text/javascript">
	$( function(){
		
		$( '#first, #last' ).attr( "autocomplete", "off" );
		$( '#first' ).focus();

		var submitActor = null;
		var submitButtons = $( 'input[type=submit]', '#switch_user_form' );
		submitButtons.click( function( event ){
			submitActor = this;
		} );

		$( '#switch_user_form' ).on( 'submit', function(){

			if ( submitActor === null ) {
				// must have hit enter, set to save button 
				submitActor = submitButtons[ 0 ];
			}

			if( submitActor.value == 'Switch' ){
				try {
					if ( $( 'input[name=j_username]:checked' ).val() == undefined ) {
						if ( $( 'input[name=j_username]' ).length > 0 ) {
							showMessage( 'error_div', 'Please select a name from the list.' );
						} else {
							showMessage( 'error_div', 'Please search for a person and select them from the list.' );
						}
						return false;
					} else {
						hideMessage( 'error_div', 'Please select a name from the list.' );
					}
				} catch ( e ) {
					// oops 
				}
			}
			return true;
		} );
		
		setupAutoComplete( {
			fields : [ {
				'elementId' : 'first',
				'name' : 'first'
			}, {
				'elementId' : 'last',
				'name' : 'last'
			} ],
			url : '${ auto_url }',
			var_name : 'j_username',
			target : 'results',
			tmp_html : 'Enter a first and last name and click \'Search\' to view results.',
			buttonId : 'search_button',
			loadingId : 'loading_results',
			loadingUrl : '${ loading_url }'
		} );
		
	} );
</script>