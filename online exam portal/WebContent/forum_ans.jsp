<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page language="java" import="java.sql.*"%>


<%@ page import="javax.servlet.*"%>
<%@ page import ="Servlets.ExecuteQuery"%>
<%@ page import ="Servlets.question"%>
<%@ page import ="Servlets.Usercheck"%>

<% 

    String que="",dat="",aut="",code="",like="";
    int i=1;
  
    ResultSet rs,rs1;

    code=request.getQueryString();

%>

 <head>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
     <style>
     	.like{
     		border: 1px solid black;
     		width: 80px;
     		height: 30px;
     		border-radius: 6px;
     	}
     	
     	.like:hover {
     	border-top : 2px solid black;
     	
     	color: grey;
     	}
     </style>
 </head>

<body>
<%
String uType = Usercheck.checkUser(request, response);
String feed ;
if(!uType.equals("teacher")){
	 feed = "feedbackAdmin.jsp";
}else{
	 feed = "feedback.jsp";
} %>
<header>
		<nav id="nav">
			<div class="first">
				<a href="home.jsp" class="fb-btn"></a>
			</div>
			<ul class="nav">
				<li style="display: none"><a class="port-btn"></a><span></span></li>
				<li><a href="#/work" class="work-btn">Quiz</a><span></span></li>
				<li><a href="forum.jsp" class="services-btn">Discussion</a><span></span></li>
				<li><a href="<%=feed %>" class="contact-btn">Feedback</a><span></span></li>
			</ul>
			<a   ><%=session.getAttribute("user")%></a>
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
        	
        	rs=ExecuteQuery.exeQuery("select * from forum_que where que_code = '"+code+"' ");
            rs.next();
            que=rs.getString(2);
            dat=rs.getString(3);
            aut=rs.getString(4);
            
            rs1=ExecuteQuery.exeQuery("select * from forum_ans where que_code='"+code+"' order by likes desc");
            


            %>  
<font size="25" color="green">    
    <table  width="850" border=2 align="left" cellpadding="2" cellspacing="2">  
        <tr align="left" >	    
            <td  align="left" ><a href="forum_ans.jsp?<%=code%>"><%=que%></a></td>
            <td  align="left" width="150"><%=dat%></td>
            <td  align="left" width="100"><%=aut%></td>
        </tr>
    </table>
</font>

<br><br><br><br>

<table  width="850" border=0 align="left" cellpadding="2" cellspacing="2">
    <th bgcolor="#FF99CC">No</th>
    <th bgcolor="#FF99CC">Answer</th>
    <th bgcolor="#FF99CC">Date & Time</th>
    <th bgcolor="#FF99CC">Author</th>
<th bgcolor="#FF99CC">Upvotes</th>  

 
    <%          while(rs1.next()) {
    que=rs1.getString(2);
        dat=rs1.getString(3);
        aut=rs1.getString(4);
        like=rs1.getString(5);
        %>
    <tr align="left" >	    
        <td bgcolor="gray" bordercolor="#F2F3F4" height="40" width="20" align="left"  ><%=i%></td>
        <td  align="left" bgcolor="#CCFFFF"><%=que%></td>
        <td  align="left" bgcolor="#CCFFFF" width="150"><%=dat%></td>
        <td align="left" bgcolor="#CCFFFF" width="100"><%=aut%></td>
         <td align="left" bgcolor="#CCFFFF" width="100"><%=like%></td>
        <td><button onclick="window.location.href='like.jsp?code=<%=code%>&ans=<%=que%>'" class="like">LIKE</button></td>
    </tr>
	
    <%i++;} 
         %>
</table>  
  <%for(int j=0;j<i;j++){%><br><br><br><%}%>
    

    <form name="form2"  method="post" action="for" >
        
        <input type="text" name="code" value="<%=code%>" hidden="hidden" >
            Your Answer   <input type="text" name="data" size="100" required><br><br>
           
            <input type="submit" class="button" name="Login" value="Post your Answer" >		
       
    </form>
    
    
    <script >
       
     </script>
</body>
 
