<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
		 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
</head>
 
<body>
	<div class="main">
		<form action="checkLogin" method="post" name="login-form">
    		<h1>Student <lable> Login </lable> </h1>
  			<div class="inset">
	  			<p>
	    		 <label for="email">Roll No.</label>
   	 			<input type="text" placeholder="" required/>
				</p>
  				<p>
				    <label for="password">PASSWORD</label>
				    <input type="password" placeholder="" required/>
  				</p>
				  <p>
				    <input type="checkbox" name="remember" id="remember">
				    <label for="remember">Remember me for 14 days</label>
				  </p>
 			 </div>
 	 
			  <p class="p-container">
			    <span><a href="#">Forgot password ?</a></span>
			    <input type="submit" value="Login">
			  </p>
		</form>
	</div>  
			
</body>
</html>