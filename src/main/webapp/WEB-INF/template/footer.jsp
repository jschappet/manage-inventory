<%@ include file="/WEB-INF/include.jsp"%>

<nav class="navbar navbar-default navbar-fixed-bottom hidden-xs" role="navigation" style="background-color: white;">
	<hr style="margin: 0px;" />
	<div style="padding: 15px;">
		<ul class="nav navbar-nav hidden-phone" style="margin-right: 15px;">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown"> Sites <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a target="_blank" title="link opens in new tab/window" href="http://www.icts.uiowa.edu">ICTS Home </a></li>
					<li><a target="_blank" title="link opens in new tab/window" href="http://www.uiowa.edu">University of Iowa Home</a></li>
					<li class="divider"></li>
					<li><a target="_blank" title="link opens in new tab/window" href="http://www.nih.gov">National Institutes of Health (NIH)</a></li>
				</ul>
			</li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown"> Support <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li class="dropdown-header">Version: <fmt:bundle basename="message"><fmt:message key="application.version" /></fmt:bundle></li>
					<%--
					<li><a  href="#" class="jiraButton">Provide Feedback</a></li>
					--%>
					<li class="divider"></li>
					<li><a target="_blank" title="I-CART" href="https://i-cart.icts.uiowa.edu/">Request ICTS Service</a></li>
					<li><a target="_blank" title="link opens in new tab/window" href="http://www.icts.uiowa.edu/wiki">ICTS Wiki</a></li>
					<li><a target="_blank" title="link opens in new tab/window" href="https://www.icts.uiowa.edu/jira">ICTS Support </a></li>
					<li class="divider"></li>
					<li><a target="_blank" title="link opens in new tab/window" href="http://its.uiowa.edu/">ITS Support</a></li>
				</ul>
			</li>
		</ul>
		<a target="_blank" title="link opens in new tab/window" href="http://www.icts.uiowa.edu/">Institute for Clinical and Translational Science</a> | <a target="_blank" title="link opens in new tab/window" href="http://www.uiowa.edu">University of Iowa</a>
		<br />
		Supported in part by NIH grant U54 TR001013
	</div>
</nav>
<script type="text/javascript" src="<c:url value="/resources/bootstrapaccessibilityplugin/plugins/js/bootstrap-accessibility.min.js"/>"></script>