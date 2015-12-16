<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@page import="Servlets.Usercheck" %>


<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/css/afterLogin.css" />
<style type="text/css">

</style>
</head>

<% Usercheck.checkUser(request, response); %>
<%


response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
//response.setHeader("Location", "afterLoginAdmin.jsp");
	response.addHeader(
			"Cache-Control",
			"no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
	response.addHeader("Pragma", "no-cache");
	response.addDateHeader("Expires", 0);
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<body>
	<header>
		<nav id="nav">
			<div class="first">
				<a href="#/work" class="logo-btn"></a>
			</div>
			
			
			<div class="last">
				
				<a href="logout" class="fb-btn" title="Logout"></a>
			</div>
		</nav>


		<article class="logo">
			<div class="flip">
				<div class="flipper">
					<div class="sides front"></div>
					<div class="sides back"></div>
				</div>
			</div>
			<img src="" class="fade">
			<div class="back-btn">
				<div>
					<a href="#/work"></a>
				</div>
			</div>
		</article>
	</header>

	<h1>Select One Subject</h1>
	
	<div>
	
		<ul class="subject-list">
			<li><a href="setSubject?sub=COA" title="Computer Organisation and Architecture" >COA</a></li>
			<li><a href="setSubject?sub=DBMS" title="Database and Management System">DBMS</a></li>
			<li><a href="setSubject?sub=OOP" title="Object Oreinted Programming">OOP</a></li>
		</ul>
	</div>


</body>
</html>