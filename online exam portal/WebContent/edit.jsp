<%@page import="Servlets.ExecuteQuery" %>
<%@page import="Servlets.Usercheck" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html lang="en" class="no-js lt-ie9 lt-ie8 lt-ie7 logged-in "> <![endif]-->
<!--[if IE 7]>         <html lang="en" class="no-js lt-ie9 lt-ie8 logged-in "> <![endif]-->
<!--[if IE 8]>         <html lang="en" class="no-js lt-ie9 logged-in "> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en" class="no-js logged-in ">
<!--<![endif]-->
<head>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/public-main.css" />
</head>

<% 

if(session.getAttribute("user")== null){
	response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", "login.jsp"); 
}
	String uType = Usercheck.checkUser(request, response);
	
	String que  = "select * from "+uType+" where username = '"+session.getAttribute("user")+"'";
	
	ResultSet rs= ExecuteQuery.exeQuery(que);
	try{rs.first();
	
%>

<%
	response.addHeader(
			"Cache-Control",
			"no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
	response.addHeader("Pragma", "no-cache");
	response.addDateHeader("Expires", 0);
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<body class="sidebar-page page-accounts">


	<div class="root">

		<div class="page">


			<header class="top-bar top-bar-new">
				<div class="top-bar-wrapper">
					<div class="logo">
					
					</div>

					<div class="top-bar-left">
						<ul class="top-bar-actions">
							<li><a class="top-bar-home" href="login.jsp" label=Home><i></i></a>
							</li>
						</ul>
					</div>

					<div class="top-bar-right account-state" id="top_bar_right">
						<ul class="top-bar-actions">


							<li id="link_profile" class="link-profile has-dropdown"><a
								href="javascript:;"> <b></b> <strong><%= session.getAttribute("user")%></strong>
							</a></li>

						</ul>
					</div>
				</div>
			</header>
			<!-- .top-bar -->




			<div class="sidebar">
				<div class="wrapper">
					<nav class="sidebar-nav">
						<div class="sidebar-content">

							<h2>
								<i></i>Your Account<span class="separator"> &bull; </span><span
									class="subtitle"></span>
							</h2>
							<ul>
								<li class="active"><a href="" id="ab"> Edit Profile <i
										class="disclosure"></i>

								</a></li>
								<li><a href=""> Change Password <i class="disclosure"></i>

								</a></li>

								<li><span id='rC1'></span></li>
							</ul>

						</div>
					</nav>
				</div>
			</div>
			<div class="main">
				<div class="wrapper">
					<section class="nav-page-content" role="main">

						<header>
							<h1>Edit Profile</h1>
						</header>
				<form method="POST" accept-charset="utf-8" action="edit_prof" class="adjacent bordered">

							<p class="form-text">
								<label for="fname"> First Name</label> <span><input
									name="fname" value="<%=rs.getString("fname") %> " maxlength="30" type="text"
									id="first_name" /></span>
							</p>

							<p class="form-text">
								<label for="lname"> Last Name</label> <span><input
									name="lname" value="<%=rs.getString("lname") %>" maxlength="30" type="text"
									id="first_name" /></span>
							</p>



							<p class="form-text">
								<label for="email">Email</label> <span><input
									type="email" name="email" value="<%=rs.getString("email") %>"
									id="email" /></span>
							</p>




							<p class="form-text">
								<label for="username">Username</label> <span><input
									name="username" maxlength="30" type="text" id="username"
									value="<%=rs.getString("username") %>" /></span>
							</p>

							<p class="form-select">
							
							<%
							String male="" , female="" ;
							if(rs.getString("gender").equals("male")) male = "selected";else female= "selected"; %>
								<label for="gender">Sex</label> <span><select
									name="gender" id="gender">
										<option value="3">--------</option>
										<option value="male" <%=male %>>Male</option>
										<option value="female" <%=female %>>Female</option>
								</select></span>
							</p>

							<p class="form-actions">
								<input type="submit" class="button-green" value="Save" />
							</p>

						</form>


						<p class="remove-account">
							<a href="" onClick="sd()">I&#39;d like to delete my account </a>
						</p>

					</section>
				</div>
				<!-- .main -->
				
				
			</div>
			<!-- .main -->


		</div>
		<!-- .page -->


<%}catch(Exception e){
		PrintWriter odut = response.getWriter();
		odut.println("Error Occure please login again");
		response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
		
		response.setHeader("Location", "login.jsp"); 
	}%>

	</div>
	<!-- .root -->

<script>
	function sd(){
		
		alert(" Your account will be deleted permanently");
	}
</script>
</body>
</html>