package Servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet("/checkRegister")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		

		String username=request.getParameter("username");
		username= username.toLowerCase();
		String password=request.getParameter("password");	
		String usr_type=request.getParameter("type"); 

					
		/*
		 @  Queries Used _________________________________________________________________________________________________________________
	 */
					 String user_query = "insert into users(Username, Password, Type ) values ('"+username+"', '"+password+"', '"+usr_type+"')";
					 String name_check = "select * from users where username ='"+username+"'";
					 
//------------------------------------------------------------------------------------------------------------- 
					 ResultSet rs= ExecuteQuery.exeQuery(name_check);
//-------------------------------------------------------------------------------------------------------------					 

					try {
						if(rs.next()){
							
							System.out.println("The username is not available");
							request.setAttribute("status", "false");
							System.out.println(request.getAttribute("status"));
							request.getRequestDispatcher("register.jsp").forward(request, response);
					
						}else{
							System.out.println("The username is  available");
	//----------------------------------------------------------------------------------------------------------------------------						
						UpdateQuery.updQuery(user_query);
	//-----------------------------------------------------------------------------------------------------------------------------						
							if(usr_type.equals("student")){
								Student st = new Student();
								st.setUsername(request.getParameter("username"));
								st.setFName(request.getParameter("fname"));
								st.setLName(request.getParameter("lname"));
								st.setGender(request.getParameter("gender"));
								st.setMail(request.getParameter("email"));
								st.setdob(request.getParameter("dob"));
								st.setYear(request.getParameter("year"));
								st.addStudent(st);
							
								
							}else{
								Teacher t = new Teacher();
								t.setUsername(request.getParameter("username"));
								t.setFName(request.getParameter("fname"));
								t.setLName(request.getParameter("lname"));
								t.setGender(request.getParameter("gender"));
								t.setMail(request.getParameter("email"));
								t.setdob(request.getParameter("dob"));
								t.setSubject(request.getParameter("subject"));
								t.addTeacher(t);
							}
 
						 request.setAttribute("status", "true");
						 System.out.println("register.java"+request.getRequestURI()+"\n"+request.getContextPath());
						 RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
						 rd.forward(request, response);
						 
						 
						}
					} catch (SQLException e) {
					
						e.printStackTrace();
					}

	}

}
