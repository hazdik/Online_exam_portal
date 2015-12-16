<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="Servlets.UpdateQuery"%>
<% 
    Connection cn;
    Statement stmt;
    ResultSet rs;
    String quizid=request.getParameter("quizid");
    String ques=request.getParameter("ques");
    String op1=request.getParameter("op1");
    String op2=request.getParameter("op2");
    String op3=request.getParameter("op3");
    String op4=request.getParameter("op4");
    String ans=request.getParameter("ans");
    System.out.println(quizid);
    System.out.println("jsp me hai");
	System.out.println(ques);
	System.out.println(op1);    
    System.out.println(op2);
	System.out.println(op3);
	System.out.println(op4);
	System.out.println(ans);    
        try {
        	
          
            UpdateQuery.updQuery("INSERT INTO QUIZ VALUES('"+quizid+"','"+ques+"','"+op1+"','"+op2+"','"+op3+"','"+op4+"','"+ans+"')" );
            System.out.println("");
            response.sendRedirect("TeacherQuiz.jsp");
            }
        catch(Exception e) {
            e.printStackTrace();
        }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%System.out.print("aaja yaha"); %>
</body>
</html>