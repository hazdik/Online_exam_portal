<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Servlets.Student" %>
   
  
<!DOCTYPE html ">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">
	body{
		background-image: url("${pageContext.request.contextPath}/images/2.jpg");
		background-size:cover;
	}
	a{
		position:relative;
		margin-top:100px;
		color:white;
		font-family:sans-serif;
		padding:15px;
		//margin:200px;
		//margin-bottom:100px;
		text-decoration: none;
		font-size: 1.2em;
	}
	
	.select{
		position:relative;
		margin-top:100px;
		//border:1px solid white;
	}
</style>
<%

   response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
   response.addHeader("Pragma", "no-cache"); 
   response.addDateHeader ("Expires", 0);
   %>
<style>
	body{
	//	baground-image: url('${pageContext.request.contextPath}/images/restaurant.png');
		//background-color: red;
	}
</style>
</head>
<body >
<div class="select">

	<a href="login.jsp" >> Login |</a>
	<a href="register.jsp">> Register</a>
	<a href="asdf" >dfg</a>
</div>
</body>
</html>