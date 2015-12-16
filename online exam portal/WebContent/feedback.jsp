<%@page import="Servlets.ExecuteQuery"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Connection"%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="Servlets.Usercheck"%>



<%
	response.addHeader(
			"Cache-Control",
			"no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
	response.addHeader("Pragma", "no-cache");
	response.addDateHeader("Expires", 0);
%>
<html>
<head>
<title>Feedback</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/feedback.css" />
</head>
<body>
	<header>
		<nav id="nav">
			<div class="first">
				<a href="home.jsp" class="logo-btn"></a>
			</div>
			<ul class="nav">
				<li style="display: none"><a class="port-btn"></a><span></span></li>
				<li><a href="ViewQuiz.jsp" class="work-btn">Quiz</a><span></span></li>
				<li><a href="forum.jsp" class="services-btn">Discussiion</a><span></span></li>
				<li><a href="feedback.jsp" class="contact-btn">Feedback</a><span></span></li>
			</ul>
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

	<%
		response.addHeader(
				"Cache-Control",
				"no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
		response.addHeader("Pragma", "no-cache");
		response.addDateHeader("Expires", 0);
	%>
	<%
		String uType = Usercheck.checkUser(request, response);
		if (!uType.equals("student")) {
			response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", "login.jsp");
		} else {
	%>
	<h2 align="center">Feedback Form</h2>
	<form method="post" action="feedback_submit">






		<table>
			<%
				ArrayList<String> list = new ArrayList<String>();
					int i = 0;
					String sub = session.getAttribute("sub").toString();

					ResultSet set = null;
					System.out.println(sub);

					String sql = "Select * from  feedback_results where subject='"
							+ sub + "'";

					set = ExecuteQuery.exeQuery(sql);
					set.first();
					i = set.getInt("quesid");

					set = ExecuteQuery.exeQuery(sql);
					while (set.next()) {

						list.add(set.getString("questions"));

						System.out.println(set.getString("questions"));

					}
					Iterator<String> itr;

					int m = 1;
					for (itr = list.iterator(); itr.hasNext();) {
						String ans = itr.next().toString();
			%>



			<tr>
				<td><%=m%>&nbsp; &nbsp;<%=ans%></td>
				<td style="visibility: hidden"><input type="hidden"
					name="question<%=i%>" value="<%=ans%>" style="display: none"></td>

				<td style="visibility: hidden"><input type="hidden"
					name="quid<%=i%>" value="<%=i%>"></td>
				<td style="color: red"><input type="radio" value=1
					name="response<%=i%>" />Very Poor</td>
				<td style="color: orange"><input type="radio" value=2
					name="response<%=i%>" />Poor</td>
				<td style="color: yellow"><input type="radio" value=3
					name="response<%=i%>" />Average</td>
				<td style="color: lightgreen"><input type="radio" value=4
					name="response<%=i%>" />Good</td>
				<td style="color: green"><input type="radio" value=5
					name="response<%=i%>" />Very Good</td>
			</tr>









			<%
				i++;
						m++;
					}
			%>
		</table>
		<br>
		<div>
			<input type="Submit" value="Submit">


		</div>
		<%
			}
		%>
	</form>
</body>
</html>