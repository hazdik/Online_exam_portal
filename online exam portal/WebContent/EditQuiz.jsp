<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="Servlets.ExecuteQuery" %>
    <%@page import="java.sql.ResultSet"%>
     <%@page import="Servlets.Teacher"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<Script language="JavaScript">
    function validation() {
    	<%System.out.println("quiz suru");%>
      //  {document.form2.action="TeacherQuiz.jsp?";} 
    }
</Script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/feedback.css" />
</head>
<body>
<form name="form2" method="post" action="createquiz">  
        Quesid <input type="text" name="myquizid" size="10"><br><br>&nbsp
        <input type="submit" class="button" name="Login" value="Create Quiz" >				
</form>

<br><br>
<hr>
Edit Quiz : <br>

<hr>

<% 

ResultSet rs= ExecuteQuery.exeQuery("select * from exam_info  where subject='"+session.getAttribute("sub")+"'");
	int i=1;
	
	while(rs.next()){
		String quizid = rs.getString("quizid");
		
	
%>

    <a href="TeacherQuiz.jsp?myquizid=<%=quizid%> "><%= quizid %></a>
    <br>
   
	
	<% i++;}  %>
	


</body> 
</html>