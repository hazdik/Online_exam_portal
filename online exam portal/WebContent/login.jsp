<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    
    
    %>
    
    <%@page import="Servlets.Student" %>
   <%
   if(session.getAttribute("user")!=null){
	   response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", "checkLogin"); 
	   
   }
  
  
   %>

<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
		 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
		 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home/home.css" >
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
</head>
 
<body>


${pageContext.request.contextPath}
	<div class="main">
		<form action="checkLogin" method="post" name="form-name">
    		<h1>User  Login  </h1>
  			<div class="inset">
	  			<p>
	    		 
   	 			<input type="text" placeholder="Username"  name="username" required autocomplete="off"/>
				</p>
  				<p>
				    
				    <input type="password" placeholder="Password" name="password" required autocomplete="off"/>
  				</p>
				  <p>
				    
				    
				  </p>
 			 </div>
 	 
			  <p class="p-container">
			    <span><a href="register.jsp ">New Member!</a></span>
			    <input type="submit" value="Login" name="submit">
			    
			    
			  </p>
		</form>
	</div>  
			
</body>
</html>