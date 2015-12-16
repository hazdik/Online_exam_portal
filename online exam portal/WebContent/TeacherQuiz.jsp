<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="Servlets.ExecuteQuery"%>
<%@ page import="Servlets.UpdateQuery"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <Script language="JavaScript">
        function validation() {
        	<%System.out.print("aaaja bhai");%>
        if(document.form2.quizid.value == ""){alert("Please Enter QuesID"); return;}
        else if(document.form2.ques.value == ""){alert("Please Enter Ques"); return;}
        else if(document.form2.op1.value == ""){alert("option missing"); return;}
        else if(document.form2.op2.value == ""){alert("option missing"); return;}
        else if(document.form2.op3.value == ""){alert("option missing"); return;}
        else if(document.form2.op4.value == ""){alert("option missing"); return;}
        else if(document.form2.ans.value == ""){alert("answer missing"); return;}
        else if(document.form2.time.value == ""){alert("time missing"); return;}
            }
    </Script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/feedbackAdmin.css" />
</head>

<body>
<table width="850" border=2 align="left" cellpadding="2" cellspacing="2">
    <th bgcolor="#FF99CC">QuizID</th>
    <th bgcolor="#FF99CC">Ques</th>
    <th bgcolor="#FF99CC">Option one</th>
    <th bgcolor="#FF99CC">Option two</th>
    <th bgcolor="#FF99CC">Option three</th>
    <th bgcolor="#FF99CC">Option four</th>
    <th bgcolor="#FF99CC">Answer</th>
    <th bgcolor="#FF99CC">Time</th>
<%
	

	
    String quizid="",ques="",op1="",op2="",op3="",op4="",ans="";
    int i=1,time;
    
    Statement stmt,stmt1;
    ResultSet rs,rs1;
    String myquizid=request.getParameter("myquizid");
    
    System.out.println(myquizid);
  //  System.out.println("insert into exam_info(quizid, noofques) values ('"+myquizid+"', 0)");
  //  UpdateQuery.updQuery("insert into exam_info(quizid) values ('"+myquizid+"')");
    
    
    
    try {
        	System.out.println("crete karo"+myquizid);
        
			
                 
			   rs=ExecuteQuery.exeQuery("select * from quiz where quizid='"+myquizid+"'ORDER BY QUIZID");		  
		    while(rs.next()) {
                quizid=myquizid;
                ques=rs.getString(2);
                op1=rs.getString(3);
                op2=rs.getString(4);
                op3=rs.getString(5);
                op4=rs.getString(6);
                ans=rs.getString(7);
                time=rs.getInt(8);
%>   
	<tr align="left"  >	    
        <td  height="40" width="20" align="left"  ><%=quizid%></td>
        <td  align="left"  ><%=ques%></td>
        <td  align="left"  ><%=op1%></td>
        <td  align="left"  ><%=op2%></td>
        <td  align="left"  ><%=op3%></td>
        <td  align="left"  ><%=op4%></td>
        <td  align="left"  ><%=ans%></td>    
        <td  align="left"  ><%=time%></td>    
    </tr>
<%                
                 i++;
      		}
  		}catch(Exception e) {
    	  e.printStackTrace();
  		}
%>
</table>    

    <br><br><br>
     <table><tr><td>
    <form name="form2" method="post" action="TeacherQuiz">  
            <input type="hidden" value="<%=myquizid %>" name="quizid" size="10">
            <tr><td>Ques</td><td><input type="text" name="ques" size="100"><br><br></td></tr>
            <tr><td>Option1</td><td><input type="text" name="op1" size="30" ><br><br></td></tr>
            <tr><td>Option2</td><td><input type="text" name="op2" size="30" ><br><br></td></tr>
            <tr><td>Option3</td><td><input type="text" name="op3" size="30" ><br><br></td></tr>
            <tr><td>Option4</td><td><input type="text" name="op4" size="30" ><br><br></td></tr>
            <tr><td>Answer</td><td><input type="text" name="ans" size="30" ><br><br></td></tr>
            <tr><td>Time</td><td><input type="text" name="time" size="30" ><br><br></td></tr>
            <tr><td><input type="submit" class="button" name="Login" value="Post Your Question" onclick='validation()'>	</td></tr>				
            <p>&nbsp;</p>
    </table>
    </form>
    <h2><a href="DeleteQues.jsp">Delete A Question</a></h2>
    <h3><a href="home.jsp">HOme </a></h3>
 </body>