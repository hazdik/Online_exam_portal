<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ page import="javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<Script language="JavaScript">
    function validation() {
    	<%System.out.println("quiz suru");%>
        {
        	document.form2.action="StudentQuiz.jsp?";} 
    	}
</Script>
</head>

<body>
<form name="form2" method="post">  
        Quesid <input type="text" name="quizid" size="10"><br><br>&nbsp
        <input type="submit" class="button" name="Login" value="Start Quiz" onclick='validation()'>		
        
        
        
        		
</form>
</body> 
</html>