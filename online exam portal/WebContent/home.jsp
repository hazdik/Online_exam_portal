<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="Servlets.Usercheck" %>

<% response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
//response.setHeader("Location", "home.jsp"); 


if(session.getAttribute("user")== null){
	response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", "login.jsp"); 
}
%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=session.getAttribute("user") %>- Home</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css" />
</head>
<%
	response.addHeader(
			"Cache-Control",
			"no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
	response.addHeader("Pragma", "no-cache");
	response.addDateHeader("Expires", 0);
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	String uType = Usercheck.checkUser(request, response);
	String quiz ;
	if(!uType.equals("teacher")){
		 quiz = "ViewQuiz.jsp";
	}else{
		 quiz = "EditQuiz.jsp";
	}
			
	
	
%>
<body>
	<header>
		<nav id="nav">
			<div class="first">
				<a href="home.jsp" class="fb-btn"></a>
			</div>
			<ul class="nav">
				<li style="display: none"><a class="port-btn"></a><span></span></li>
				<li><a href="<%=quiz %>" class="<%= quiz%>">Quiz</a><span></span></li>
				<li><a href="forum.jsp" class="services-btn">Discussion</a><span></span></li>
				<li><a href="feedback" class="contact-btn">Feedback</a><span></span></li>
			</ul>
			<a   ><%=session.getAttribute("user")%></a>
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
<a href="edit.jsp">EDIT</a>
	


</body>
</html>