
<%@page import="java.sql.Connection"%>
<%@page import="Servlets.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="Servlets.Usercheck"%>
<%@page import="Servlets.ExecuteQuery" %>
<%@page import="Servlets.Teacher" %>
<%@page import="java.util.Date" %>

<%

	
	response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
   response.addHeader("Pragma", "no-cache"); 
   response.addDateHeader ("Expires", 0);
%>
<%
	String uType = Usercheck.checkUser(request, response);
	if(!uType.equals("teacher")){
	response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", "login.jsp"); 
}
	
	String sub= session.getAttribute("sub").toString();
	 Teacher t = (Teacher)session.getAttribute("teacher_object");

	Date date = new Date();
	

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Feedback Control Panel</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/feedbackAdmin.css" />
</head>
<body>
	<header>
		<nav id="nav">
			<div class="first">
				<a href="#/work" class="logo-btn"></a>
			</div>
			<ul class="nav">
				<li style="display: none"><a class="port-btn"></a><span></span></li>
				<li><a href="EditQuiz.jsp" class="work-btn">Quiz</a><span></span></li>
				<li><a href="forum.jsp" class="services-btn">Discussion</a><span></span></li>
				<li><a href="feedback_ad" class="contact-btn">Feedback</a><span></span></li>
				
			</ul>
			<div class="last">
				<a href="logout" class="fb-btn" title="Logout"></a>
			</div>
		</nav>



	</header>
	<h2 align="center">Feedback Student Response</h2>
	<p>Teacher : <%= t.getfname() %></p>
	<p>Subject : <%= sub %></p>
	<p><%= date %></p>

	<div class="table">
		<table>

			<tr class="title">
				<td><p class="column-title">Questions</p></td>
				<td><p class="column-title">Average Student Response</p></td>
				<td><p class="column-title">Count</p></td>

			</tr>

			<%
				String ques;
					
					ArrayList<String> ques_list=new ArrayList<String>();
					ArrayList<String> res_list=new ArrayList<String>();
					ArrayList<String> count_list=new ArrayList<String>();
					Iterator<String> itr_que;
					Iterator<String> itr_res;
					
					Iterator<String> itr_count;
					int i=1;
					
				
						 String sql = "Select * from  feedback_results where subject= '"+sub+"' ";
						 
						
						 ResultSet set=ExecuteQuery.exeQuery(sql);
						 
						
						while(set.next()){
						ques_list.add(set.getString("questions"));
						res_list.add(set.getString("average_response"));
						count_list.add(set.getString("count"));
						
					
						}
					for(itr_que=ques_list.iterator(), itr_res= res_list.iterator(), itr_count= count_list.iterator() ;  itr_que.hasNext();){
						String questio =    itr_que.next().toString();
					    String respo   =    itr_res.next().toString();
					    String count   =    itr_count.next().toString();
					
			%>


			<tr>
				<td><p><%=questio%></p></td>
				<td><p><%=respo%></p></td>
				<td><p><%=count%></p></td>


			</tr>

			<%
				i++;}
						
			%>
		</table>
	</div>
	<div align="center" class="reset">
		<a href="resetFeedback" onClick="check(event)">Reset Feedback</a>
	</div>

	<script>
		function check() {

			var r = confirm("All the fields will reset");

			if (r == true) {

 			} else {
				event.preventDefault();
			}
		}
	</script>
</body>
</html>