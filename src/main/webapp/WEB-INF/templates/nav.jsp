<%@ include file="/WEB-INF/include.jsp"%>

<div class="navbar navbar-inverse navbar-fixed-top fluid">
	<div class="navbar-inner">
		<div class="container-fluid">
		
			<a data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar"> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</a> 
			
			<c:url value="/index.html" var="indexUrl"/>
			<a class="brand" href="${ indexUrl }">ICTS</a>
			
			<div class="btn-group pull-right">
				<sec:authorize access="!isAuthenticated()">
					<a href="#" data-toggle="dropdown" class="btn dropdown-toggle">
						&nbsp;Welcome&nbsp;<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
	           			<c:url value="/login.html" var="loginUrl"/>
	              		<li><a href="${ loginUrl }">Login</a></li>
	           		</ul>
				</sec:authorize>
			
				<sec:authorize access="isAuthenticated()">
					<a href="#" data-toggle="dropdown" class="btn dropdown-toggle">
						&nbsp;Welcome&nbsp;${ username }&nbsp;<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
	              		<su:isSwitched>
			 				<li><a href="<c:url value='/exit_switch_user'/>">Exit Switch</a></li>
			 			</su:isSwitched>
			 			<sec:authorize access="hasRole('ROLE_ICTS-DEVSUPPORT')">
				 			<su:isNotSwitched>
				 				<li><a href="<c:url value='/switch_user.html'/>">Switch User</a></li>
				 			</su:isNotSwitched>
				 		</sec:authorize>
	              		<li><a href="<c:url value="/logout" />">Sign Out</a></li>
	           		</ul>
				</sec:authorize>
			</div>
			
			<div class="nav-collapse">
				<ul class="nav">
					<li><a href="<c:url value="/index.html" />">Home</a></li>
					<li><a href="<c:url value="/contact.html" />">Contact</a></li>
					<li><a href="<c:url value="/faq.html" />">FAQ</a></li>
					<%-- 
					<li><a href="<c:url value="/about.html" />">About</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li class="nav-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul>
					</li>
					--%>
				</ul>
			</div>
		</div>
	</div>
</div>