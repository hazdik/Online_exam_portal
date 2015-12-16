<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page language="java" import="java.sql.*"%>


<%@ page import="javax.servlet.*"%>
<%@ page import ="Servlets.ExecuteQuery"%>
<%@ page import ="Servlets.question"%>

<%
    question q= new question();
    int i=1;
  
    ResultSet rs,rs1;

%>
<html>
<head>

<style>
*{
	margin:0;
	 padding: 0;
	}
	
	body{
	background-color:  rgb(22, 22, 22);
	overflow-x: hidden
	}
	
	form{
		border: 1px solid black;
		background-color: #f2f3f4;
		padding: 20px;
		border-radius:7px;
		
	}
	input[type=submit] {
		position: relative;
		float: right;
		padding: 5px ;
	margin-bottom : 10px;
	right: 20px;
	 background-color: rgb(81, 151, 140);
	border-radius: 3px;
	width: 70px;
		 border: 1px solid transparent;
		 
		 box-shadow: 0px -3px 5px rgba(255,255,255,0.2) inset;
	}

	
	.form{
	width: 70%;
	position: relative;
	margin: 0px auto;
	margin-top: 80px;'
	background-color: #f2f3f4;
	padding: 10px;
	margin-bottom: 100px;
	}
	
	.table{
		  position: relative;
  width: 100%;
  /* border: 1px solid black; */
  margin: 0px auto;
  background-color: rgb(81, 151, 140);
  padding: 10px;
  
 
		
	}
	.question{
	//	border:1px solid;
		display: block;
		//padding: 5px;
		margin-bottom: 5px;
		
	}
	.question a{
		color: grey;
		text-decoration: none;
		font-size: 1.4em;
	}
	
	.question:hover{
	text-decoration: underline;
	}
	
	.box-discussion{
	width: 80%;
	margin: 0px auto;
		margin-top: 15px ;
		margin-bottom: 25px;
		//border: 2px solid grey;
		background-color: #f2f3f4;
		padding: 10px;
		border-radius: 5px;
		box-shadow: 2px 2px 4px 1px rgb(79, 107, 103) ; 
		
	}
	
	.date{
		position: relative;
		float: right;
		right: 20px;
	}
	
	.reply{
		color: rgb(151, 110, 110);
	}
	
	textarea{
	resize: none;
	border: 1px solid silver;
	box-shadow: 2px 2px 4px silver ;
	
		width: 90%;
		border-radius:4px;
		height: 50px;
		margin-top: 10px;
		padding: 10px;
		height: 110px;
		font-family: Comic Sans MS;
		color: rgb(151, 110, 110);
		
	}
	
	textarea:focus{
		background: rgba(246, 247, 255, 0.78);
	}
	.add-question{
		font-weight: 700;
		font-size: 1.2em;
		font-family:Cambria ;
		color: cadetblue;
		
	}
</style>
</head>

<body>

	
	<div class="table">


    <%    
        try {
        	System.out.println("dht");
            
           
           rs=ExecuteQuery.exeQuery("select * from forum_que order by que_code ");
            System.out.println("s");

            while(rs.next()) {
                q.code=rs.getString(1);
                q.que=rs.getString(2);
                q.dat=rs.getString(3);
                q.aut=rs.getString(4);
                q.rep =rs.getString(5);           
			
    %>
    <div class="box-discussion">
	    <span class="date"> <%= q.dat%><br></span>
	    
	   <p class="question"> <a href="forum_ans.jsp?<%=q.code%>" ><%=q.que%></a></p>
	   
	   
	   <p>By- <%=q.aut%></p>
	<p class="reply">    <%=q.rep%>  Answers to this question</p>
	</div>
    <%
        i++;
                }

            }

            catch(Exception e) {
                e.printStackTrace();
            }

    %>    
  
    
<a href="home.jsp">HOME</a>
    
</div>
    <div class="form">
    
    <form name="form2" method="post" action="forum" >  
        
          <p class="add-question"> Add Question </p> <p><textarea  name="data" required></textarea> <br><br></p>
          
       
                  
            <input type="submit" class="button" name="Login" value="Post" >					
            <p>&nbsp;</p>
        
    </form>
    </div>
</body> 
</html>
                   