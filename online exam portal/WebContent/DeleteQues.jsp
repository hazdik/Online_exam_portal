<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="Servlets.UpdateQuery"%>
<%@ page import="Servlets.ExecuteQuery"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
      try {
        	System.out.println("select * from quiz inner join exam_info on quiz.quizid= exam_info.quizid where subject='"+session.getAttribute("sub")+"' ");
     
        	System.out.println("-------------------------------------");
        	
        	Class.forName("COM.ibm.db2os390.sqlj.jdbc.DB2SQLJDriver");
			Connection c=DriverManager.getConnection("jdbc:db2://localhost:50000/company","McRist-","guitar");
			Statement stmst=c.createStatement();
			rs=stmst.executeQuery("select * from quiz inner join exam_info on quiz.quizid= exam_info.quizid where subject='"+session.getAttribute("sub")+"' ");
			System.out.println("-------------------------------------");
				  
		    while(rs.next()) {
		    	System.out.println(rs.getString(1));
                quizid=rs.getString(1);
                System.out.println(rs.getString("ques"));
                ques=rs.getString("ques");
                op1=rs.getString("ans1");
                op2=rs.getString("ans2");
                op3=rs.getString("ans3");
                op4=rs.getString("ans4");
                ans=rs.getString("correct");
                time=rs.getInt("time");
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
    <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/feedbackAdmin.css" />
</head>

<body>
    <br><br><br>
     <table><tr><td>
    <form name="form2" method="post" action="DeleteQues">  
            <tr><td>Quesid</td><td><input type="text" name="quizid" size="10"><br><br></td></tr>
            <tr><td>Ques</td><td><input type="text" name="ques" size="100"><br><br></td></tr>
            <tr><td><input type="submit" class="button" name="Login" value="Delete Question" onclick='validation()'>	</td></tr>				
            <p>&nbsp;</p>
    </table>
    </form>
 </body>