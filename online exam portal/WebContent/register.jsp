<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    
  
    	String none="none";
   
   		System.out.println(request.getAttribute("status"));
  		if(	request.getAttribute("status")!= null){
    		String status= 	request.getAttribute("status").toString();
	    	if(status.equals("false")){
	    		
	    		System.out.println("Register.jsp = false ");
	    		none="block";
	    	}
    	
   		}
   
   System.out.println(none);
    %>
   
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
		 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
		 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<style>
		.name input{
			width:49%;
		}
		
		.name input[type=date]{
			width: 34%;
		}
  	</style>
</head>
 
<body>
	<div class="main">
		<form action="checkRegister" method="post" name="form-name">
    		<h1>User Registration  </h1>
  			<div class="inset">
  			
  			<p 	align="center" class="name">
	  					
	  				<input type="text" placeholder="First Name"  name="fname" required autocomplete="off"/>
	  				<input type="text" placeholder="Last Name"  name="lname" required autocomplete="off"/>
	  			</p>
	  			
	  			
	  			<div class="name" align="center">
	  					<p  class="error"  style="display:<%= none%>">* The username is not available</p>
	  				<input type="text" placeholder="Username"  name="username" required autocomplete="off"/>
	  		
				    <input type="password" placeholder="Password" name="password" required autocomplete="off"/>
  				</div>
				  	<p class="name" align ="center">
	    		
   	 			<input type="email" placeholder="E-mail"  name="email" required autocomplete="off"/>
   	 			
				</p>
					<p class="name" align ="center">
				<input type="date" placeholder="Date of Birth"  name="dob" required autocomplete="off"/>
				  </p>
				  <p align="center"> <input type="radio" name="gender" value="female"  checked="checked"> Female &nbsp;&nbsp;<input type="radio" name="gender"  value="male" required> Male </p> 
				 <br> 	<p align="center"> <input type="radio" name="type" value="student" onclick="hide()" > Student &nbsp;&nbsp;<input type="radio" name="type" onclick="show()" value="teacher" required> Teacher </p> 
				  	<p align="left"  id="teacher" style="display:none">
	    		Subject
   	 			<select  name="subject"  id="select" required>
   	 			
			    
			    	<option value="COA">COA</option>
			    	<option value="OOP">OOP</option>
			    	<option value="DBMS">DBMS</option>
			    </select>
				</p>
				<p align="left"  id="student" style="display:none">
	    		Year
   	 			<select  name="year"  id="select" required>
   	 			
			    
			    	<option value="first">I Year</option>
			    	<option value="second">II Year</option>
			    	<option value="third">III Year</option>
			    	<option value="fourth">IV Year</option>
			    	
			    </select>
				</p>
 			 </div>
 	  				
			  <p class="p-container">
			    
			    <input type="submit" value="Register" name="submit">
			  </p>
		</form>
	</div>  
<script>
	function show(){
	//	alert("fd");
	//	document.getElementById("select").removeAttribute("disabled");
		document.getElementById("teacher").removeAttribute("style");
		//alert("df");
		document.getElementById("student").setAttribute("style", "display: none");
		
		//alert("df");
	}
	
	function hide(){
		//alert("ok");
	//	document.getElementById("select").setAttribute("disabled", "disabled");
		document.getElementById("teacher").setAttribute("style", "display: none");
		document.getElementById("student").setAttribute("style", "display: block");
		//alert("dfss");
		
	}
</script>
			
</body>
</html>