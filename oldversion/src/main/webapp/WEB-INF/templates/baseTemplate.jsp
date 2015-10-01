<!DOCTYPE html>
<html lang="en">
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/include.jsp"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

	<head>
		<tiles:insertAttribute name="head" />
	</head>
	<body>
	
		<tiles:insertAttribute name="nav" />
		<tiles:insertAttribute name="branding" />
		<div class="container-fluid" id="container">
			<div class="row-fluid" id="body">
				<div class="span2">
					<div class="well sidebar-nav hidden-phone">
						<tiles:insertAttribute name="menu" />
					</div>
					<div class="well sidebar-nav visible-phone hidden-desktop hidden-tablet">
						<tiles:insertAttribute name="small_menu" />
					</div>
				</div>
				<div class="span10">
					<tiles:insertAttribute name="body" />
				</div>
			</div>
		
	
<!-- 			<div id="footer" class="row-fluid"> -->
<!-- 				<div class="span12"> -->
<%-- 					<tiles:insertAttribute name="footer" /> --%>
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
<nav class="navbar navbar-default navbar-fixed-bottom" role="navigation">
   <div class="navbar-header">
      <a class="navbar-brand" href="#">TutorialsPoint</a>
   </div>
   <div>
      <ul class="nav navbar-nav">
         <li class="active"><a href="#">iOS</a></li>
         <li><a href="#">SVN</a></li>
         <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
               Java <b class="caret"></b>
            </a>
            <ul class="dropdown-menu">
               <li><a href="#">jmeter</a></li>
               <li><a href="#">EJB</a></li>
               <li><a href="#">Jasper Report</a></li>
               <li class="divider"></li>
               <li><a href="#">Separated link</a></li>
               <li class="divider"></li>
               <li><a href="#">One more separated link</a></li>
            </ul>
         </li>
      </ul>
   </div>
</nav>
	
	</body>
</html>