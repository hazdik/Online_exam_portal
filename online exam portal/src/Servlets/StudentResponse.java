package Servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;

import Servlets.ExecuteQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/StudentResponse")
public class StudentResponse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StudentResponse() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("Aa bhi ja");
			int i=0;
		    
		    ResultSet rs; 
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
					while(itr.hasNext())
		            {
						answer=itr.next();
			            respo=itr2.next();		
			            if(respo!=" "){
			 			            	out.println("<table width='550' border=2 align='left' cellpadding='2' cellspacing='2'>"
							+ "<tr><th bgcolor='#FF99CC'>Ques"+(i+1)+"</td><td bgcolor='#FF99CC'>response="
							+respo+"</td><td bgcolor='#FF99CC'> ans= "+answer+"<br>");
				            out.println("</td></tr></table>"); 	 
			          }     
				    i++;
		            } 
				}catch(Exception e) {
			  e.printStackTrace();
				}
		out.println("<a href=\"StudentResl\">Final submit</a>");
		}
}
