package Servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;

import Servlets.UpdateQuery;
import Servlets.ExecuteQuery;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/StudentQuiz")
public class StudentQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StudentQuiz() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession session = request.getSession();
			int i=0,marks=0;
		   
		    ResultSet rs,rs1; 
		    PrintWriter out = response.getWriter();
			String quizid=request.getParameter("quizid");
		     try {
		    	System.out.println("phir se suru ho gaya"+quizid);
		    
					   rs=ExecuteQuery.exeQuery("select * from quiz where quizid='"+quizid+"'");		  
				   System.out.println("RESULTS");
				   ArrayList<String> ans = new ArrayList<String>();   
				   ArrayList<String> resp = new ArrayList<String>();
				   while(rs.next()) {
		            ans.add(rs.getString(7));  
		            if(request.getParameter("response"+ i)==null)
		            	resp.add(" ");
		            else
		            	resp.add(request.getParameter("response"+ i));
		            i++;
				   }
		            System.out.println(ans);
		            System.out.println(resp);
		            Iterator<String> itr=ans.iterator();
		            Iterator<String> itr2=resp.iterator();
		            String answer,respo;
		            i=0;
		            String id=session.getAttribute("user").toString();
		            rs1=ExecuteQuery.exeQuery("select * from results where quizid='"+quizid+"' and id='"+id+"'");		  	         
				  if(!rs1.next()){
					while(itr.hasNext())
		            {
						answer=itr.next();
			            respo=itr2.next();		
			            if(respo!=" "){
			 			            	out.println("<table width='550' border=2 align='left' cellpadding='2' cellspacing='2'>"
							+ "<tr><th bgcolor='#FF99CC'>Ques"+(i+1)+"</td><td bgcolor='#FF99CC'>response="
							+respo+"</td><td bgcolor='#FF99CC'> ans= "+answer+"<br>");
				             if(respo.equals(answer)){
				            	 marks++;
				            	 System.out.println("Sahi Javab");
				                 out.println("</td><td bgcolor='#FF99CC'> CORRECT"); 	 
						     }
				             else{
				            	 System.out.println("no no galat Javab");
				                 out.println("</td><td bgcolor='#FF99CC'> WRONG");
				             }
				             out.println("</td></tr></table>"); 	 
			            }     
				    i++;
		            } 
					System.out.println("marks="+marks);	         
					out.println("<br><br><br><br><br><br><br><br><p >Your answers has been Submiited</p>");
								out.println("<b>Your score="+marks);
				   UpdateQuery.updQuery("INSERT INTO RESULTS VALUES('"+id+"','"+quizid+"','"+marks+"')" );
				  }
				  else{
					   System.out.println("Dubara mat puchna");	         
						out.println("\nNote:You have already given this quiz");
				   }
				
				  }catch(Exception e) {
			  e.printStackTrace();
				}
		out.println("<a href=\"home.jsp\">HOME</a>");
	}
}