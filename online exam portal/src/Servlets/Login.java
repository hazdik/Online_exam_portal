package Servlets;

import java.io.IOException;
import java.sql.ResultSet;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Servlets.ExecuteQuery;
/**
 * Servlet implementation class Login
 */
@WebServlet("/checkLogin")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		
		
		System.out.println("asdfghjklqweryuiopzxcvbnm");

		HttpSession session = request.getSession();

		if (session.getAttribute("user") != null) {
			String us = session.getAttribute("user").toString();
			
			String checkquery = "select * from users where username= '" + us
 + "'";
			
			
			String uType = "";
			try {
// -----------------------------------------------------------------------------------------------------------------------
				ResultSet set_check = ExecuteQuery.exeQuery(checkquery);
//------------------------------------------------------------------------------------------------------------------------				
				
				
				System.out.println("Login.java"+set_check);
				while (set_check.next()) {

					System.out.println("Login.java : *** 123");
					uType = set_check.getString("type");
					System.out.println("Login.java : ***456");

				}

				if (uType.equals("teacher")) {
			
					System.out.println("Login.java : ***" + uType + "hai yeh toh ");
					response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
					response.setHeader("Location", "afterLoginAdmin.jsp");
				//	RequestDispatcher rd = request
				//			.getRequestDispatcher("afterLoginAdmin.jsp");
				//	rd.forward(request, response);

				} else {
					response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
					response.setHeader("Location", "afterLogin.jsp");
				//	RequestDispatcher rd = request
				//			.getRequestDispatcher("afterLogin.jsp");
				//	rd.forward(request, response);
				}
			} catch (Exception ex) {

			}

		} else {
			response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", "login.jsp");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String username = request.getParameter("username");
		username = username.toLowerCase();
		String password = request.getParameter("password");

		int i = 0;

		try {
		
			String sql = "Select * from  users where username='" + username + "' and password='" + password + "' ";
			
//------------------------------------------------------------------------------------------------------
			ResultSet set = ExecuteQuery.exeQuery(sql);
//------------------------------------------------------------------------------------------------------

			

			System.out
					.println("login.java \n" + username
							+ request.getRequestURI() + "\n"
							+ request.getContextPath());
			String uType = "";
			while (set.next()) {
				i = 1;

				uType = set.getString("type");

			}
			if (i != 0) {
				HttpSession session = request.getSession();
				session.setAttribute("user", username);
				

				if (uType.equals("teacher")) {
					Teacher t = new Teacher();
					String ss= "select * from teacher where username='"+username+"' ";
					ResultSet r= ExecuteQuery.exeQuery(ss);
					
					 r.first();
					 	t.setFName(r.getString(2));
						t.setLName(r.getString(3));
						t.setMail(r.getString(4));
						t.setdob(r.getDate(5).toString());
						t.setGender(r.getString(6));
						t.setSubject(r.getString(7));
					 
						System.out.println(t);
						session.setAttribute("teacher_object", t);
					session.setAttribute("sub", r.getString("subject").toString());
					System.out.println("Login.java doPost" + uType + "hai yeh toh ");
					response.sendRedirect("afterLoginAdmin.jsp");
					//RequestDispatcher rd = request.getRequestDispatcher("afterLoginAdmin.jsp");
					//rd.forward(request, response);

				} else {
					
					Student st= new Student();
				System.out.println("select * from student where username ='"+username+"'");
					set = ExecuteQuery.exeQuery("select * from student where username ='"+username+"'");
					
					set.first();
					st.setFName(set.getString(2));
					st.setLName(set.getString(3));
					st.setMail(set.getString(4));
					st.setdob(set.getDate(5).toString());
					st.setGender(set.getString(6));
					st.setYear(set.getString(7));
					
					System.out.println(st);
					
					response.sendRedirect("afterLogin.jsp");
					
	
				
				}

			} else {
				request.setAttribute("errorMessage", "* Invalid username or password");
				RequestDispatcher rd = request.getRequestDispatcher("failed.jsp");
				
				rd.forward(request, response);
			}
		} catch (Exception sqe) {
			System.out
					.println(" login.java doPost- *** Error : While Fetching records from database \n" + sqe);
		}
		

	}

}
