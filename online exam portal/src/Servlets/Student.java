package Servlets;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Servlets.UpdateQuery;

public class Student extends User {
		
		private String Year;
		
		
		
		public String getYear(){
			return Year;
		}
		

		
		public void setYear(String sY){
			this.Year= sY;
		}
		
		
		public void addStudent(Student st){
			System.out.println(st.getfname());
			System.out.println("insert into student values('"+st.Username+"', '"+st.Fname+"', '"+st.Lname+"', '"+st.Mail+"', '1952-09-15', '"+st.Gender+"', '"+st.Year+"')");
			String student_query = "insert into student values('"+st.Username+"', '"+st.Fname+"', '"+st.Lname+"', '"+st.Mail+"', '"+st.Dob+"', '"+st.Gender+"', '"+st.Year+"')";
			UpdateQuery.updQuery(student_query);
			System.out.println("-------------------  Student table modified");
		
		}		
		
		public void edit_detail(HttpServletRequest request, HttpServletResponse response , HttpSession session){
			
			String quer = "update  student set username ='"+request.getParameter("username").toLowerCase()+"', fname ='"+request.getParameter("fname")+"', lname='"+request.getParameter("lname")+"', email= '"+request.getParameter("email")+"' where username= '"+session.getAttribute("user")+"'";
			System.out.println("done");
			UpdateQuery.updQuery(quer);
			session.setAttribute("user", request.getParameter("username").toLowerCase());
		}
		
		@ Override
		public String toString() {  
			  
	        return "Student [FName=" + Fname + ", LName=" + Lname  
	  
	                + ", mail=" + Mail + ", gender=" + Gender + ", dob="  
	  
	                + Dob + ", year="+ Year +"]";  
	  
	    }



	

	



		



		
		
		
}
