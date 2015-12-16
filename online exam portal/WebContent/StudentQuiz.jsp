<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.util.*"%>
<%@page import="Servlets.ExecuteQuery" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>

<body>
<Script language="JavaScript">
    function validation() {
    	<%System.out.println("quiz suru");%>
    	{document.form2.action="StudentQuiz.java?";} 
    }
</Script>
<form name="form1" method="post" action="StudentQuiz"><br>
<table width="850" border=2 align="left" cellpadding="2" cellspacing="2">
    <th bgcolor="#FF99CC">Ques</th>
    <th bgcolor="#FF99CC">Option one</th>
    <th bgcolor="#FF99CC">Option two</th>
    <th bgcolor="#FF99CC">Option three</th>
    <th bgcolor="#FF99CC">Option four</th>
<%
	int i=0,num=0,totalQues=0,rand,time=0;
    Connection cn;
    Statement stmt,stmt1;
    ResultSet rs,rs1; 
    String quizid=request.getParameter("quizid");
%>
<tr><td><input type='hidden' value="<%=quizid%>" name="quizid" /></td></tr>
<%     try {
    	System.out.println("suru ho gaya"+quizid);
    	
		   rs=ExecuteQuery.exeQuery("select * from quiz where quizid='"+quizid+"'");		  
		   HashSet <String> ts= new HashSet<String>();
		   ArrayList<String> ques = new ArrayList<String>();   
		   ArrayList<Integer> quesTime = new ArrayList<Integer>();   
		   ArrayList<String> op1 = new ArrayList<String>();   
		   ArrayList<String> op2 = new ArrayList<String>();   
		   ArrayList<String> op3 = new ArrayList<String>();   
		   ArrayList<String> op4 = new ArrayList<String>();   
		while(rs.next()) {	   
	    	totalQues++;
	    	quesTime.add(rs.getInt(8));
	        ques.add(rs.getString(2));
            op1.add(rs.getString(3));
            op2.add(rs.getString(4));
            op3.add(rs.getString(5));
            op4.add(rs.getString(6));
        }
		System.out.println("suru ho gaya with"+totalQues+"time hai"+time);
		System.out.println(ques+""+op1+op2+op3+op4);
		for(i=0;i<totalQues;i++){
			rand=(int)(Math.random()*ques.size());
			System.out.println((rand));
			System.out.println(ques.get(rand));
			if(ts.contains(ques.get(rand))==false)
		 	{
				System.out.println("hi"+ques.get(rand));
				ts.add(ques.get(rand));
				num++;
				if(num==((totalQues/3)+1)){
				 break;
				}
		 	}		
		}
		System.out.println("suru ho gaya with"+totalQues);
		System.out.println(ts);
	 	Iterator<String> itr=ques.iterator();
        i=0;
		while(itr.hasNext()){
        	itr.next();
			if(ts.contains(ques.get(i))){
				time+=quesTime.get(i);
%>   
<tr align="left">	    
    <td  align="left"  ><input type="hidden" value=<%=ques.get(i)%> name="ques<%=i%>" /><%=ques.get(i)%></td>
    <td  align="left"  ><input type="radio" value=<%=op1.get(i)%> name="response<%=i%>" /><%=op1.get(i)%></td>
    <td  align="left"  ><input type="radio" value=<%=op2.get(i)%> name="response<%=i%>" /><%=op2.get(i)%></td>
    <td  align="left"  ><input type="radio" value=<%=op3.get(i)%> name="response<%=i%>" /><%=op3.get(i)%></td>
    <td  align="left"  ><input type="radio" value=<%=op4.get(i)%> name="response<%=i%>" /><%=op4.get(i)%></td>   
</tr>
<%			}
			i++;
	  }
	  }catch(Exception e) {
	  e.printStackTrace();
		}
%>
</table> <div>
<input type="submit" id="time" class="button" name="Login" value="Submit" onclick='validation()'>					
<p>&nbsp;</p></div>   
</form>
<p id="demo"></p>

<script>
setInterval(function(){myTimer()},1000);
var i=<%=time%>,min,sec;
function myTimer() {
	min=Math.floor(i/60);
	sec=i%60;
    i--;
    document.getElementById("demo").innerHTML =min+":"+sec;
	if(i==-1)
	{
		document.getElementById("time").click();
			alert("Time up");
	}
}
</script>