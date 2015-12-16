<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="Servlets.UpdateQuery"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%String s,g="",a1="",g1="",a11="";

char w;
int a=0;
int b=0,j,i,r=0;

 a1=request.getParameter("code");
 a11 = request.getParameter("ans");
 
 
 System.out.println("****************"+a1);
 System.out.println(a11);
 System.out.println("update forum_ans set likes =likes + 1 where  ans ='"+a11+"'");
 UpdateQuery.updQuery( "update forum_ans set likes =likes + 1 where  ans ='"+a11+"'" );
 response.sendRedirect("forum_ans.jsp?"+a1);
%>
<body>

</body>
</html>