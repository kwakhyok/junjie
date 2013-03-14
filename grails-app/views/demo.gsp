<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="demo_layout"/>
		<r:require modules="bootstrap"/>
		<title>Welcome to Grails</title>
	</head>
	<<body id="container" >
		<h1> Hello World </h1>
		<ul class="nav nav-pills">
		  <li class="active">
		    <a href="#">Home</a>
		  </li>
		  <li><a href="#">profile</a></li>
		  <li><a href="#">messages</a></li>
		</ul>
		<g:form class="well" id="loginForm">
	
			
			<g:submitButton class="btn btn-primary" value="submit" name="submit" />
			<g:link class="btn btn-info" href="#">Info</g:link>
		</g:form>	
		<div id="jqueryTest" style="display:none">JQuery works!</div>	
		
		<div id="mymodal" class="modal hide fade">
		  <div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		    <h3>Modal header</h3>
		  </div>
		  <div class="modal-body">
		    <p>One fine body…</p>
		  </div>
		  <div class="modal-footer">
		    <a href="#" class="btn">Close</a>
		    <a href="#" class="btn btn-primary">Save changes</a>
		  </div>
		</div>
		
		
		<div class="dropdown">
		  <a class="dropdown-toggle" id="dLabel" role="button" data-toggle="dropdown" data-target="#" href="/page.html">
		    Dropdown
		    <b class="caret"></b>
		  </a>
		  <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
		    ...
		  </ul>
		</div>
		
		
		<script type="text/javascript" src="${createLinkTo(dir:'js', file:'bootstrap.js')}"></script>
	</body>	
</html>