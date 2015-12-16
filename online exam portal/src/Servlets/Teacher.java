package Servlets;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Teacher extends User{

	private String Subject;
	
	


	public String getsubject(){
		return Subject;
	}
	
//-------------------------------------------------------------------------------------------------------------------
	

	
	public void setSubject(String tS){
		this.Subject= tS;
	}
	
	public void addTeacher(Teacher t){
		System.out.println(t.getfname());
		 String teacher_query= "insert into teacher values('"+t.Username+"', '"+t.Fname+"', '"+t.Lname+"', '"+t.Mail+"', '"+t.Dob+"', '"+t.Gender+"', '"+t.Subject+"')";
		 UpdateQuery.updQuery(teacher_query);
		 
	}
	
	
	
	public void edit_detail(HttpServletRequest request, HttpServletResponse response , HttpSession session){
		
		String quer = "update  teacher set username ='"+request.getParameter("username").toLowerCase()+"', fname ='"+request.getParameter("fname")+"'";
		UpdateQuery.updQuery(quer);
		
		session.setAttribute("user", request.getParameter("username").toLowerCase());
	}
	
	
	@ Override
	public String toString() {  
		  
        return "Teacher [FName=" + Fname + ", LName=" + Lname  
  
                + ", mail=" + Mail + ", gender=" + Gender + ", dob="  
  
                + Dob + ", year=" + Subject +"]";  
  
    }

	
	
	
	
}
