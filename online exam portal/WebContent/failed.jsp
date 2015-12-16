<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" >
</head>
<body>

${pageContext.request.contextPath}

<div class="main">
		<form action="checkLogin" method="post" name="form-name">
    		<h1>USER  Login  </h1>
    		
  			<div class="inset">
  			<p><%=request.getAttribute("errorMessage") %></p><br>
	  			<p>
	    		 <label for="email">Username</label>
   	 			<input type="text" placeholder=""  name="username" required autocomplete="off"/>
				</p>
  				<p>
				    <label for="password">Password</label>
				    <input type="password" placeholder="" name="password" required autocomplete="off"/>
  				</p>
				  <p>
				    <input type="checkbox" name="remember" id="remember">
				    <label for="remember">Remember me for 14 days</label>
				  </p>
 			 </div>
 	 
			  <p class="p-container">
			    <span><a href="${pageContext.request.contextPath}/forgetPassword  ">Forgot password ?</a></span>
			    <input type="submit" value="Login" name="submit">
			  </p>
		</form>
	</div>  
			
</body>
</html>