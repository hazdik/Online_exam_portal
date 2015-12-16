package Servlets;

import java.io.IOException;
import Servlets.Usercheck;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Servlets.UpdateQuery;

/**
 * Servlet implementation class link
 */
@WebServlet(urlPatterns = {  "/logout", "/feedback" ,"/subject",
		"/feedback_ad", "/resetFeedback", "/edit_prof", "/fofdgr" })
public class link extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public link() {
		super();
	
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("3");
		HttpSession session = request.getSession();
		String applicationContextPath = request.getContextPath();
		System.out.println(request.getContextPath() + "\n **"
				+ request.getRequestURI());

		if (request.getRequestURI().equals(
				applicationContextPath + "/register")) {
			// HttpSession session=request.getSession();
			System.out.println(session.getAttribute("user"));
//______________________________________________________________________________________________________________________________
			
		} else if (request.getRequestURI().equals(
				applicationContextPath + "/logout")) {
			response.addHeader(
					"Cache-Control",
					"no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
			response.addHeader("Pragma", "no-cache");
			response.addDateHeader("Expires", 0);

			if (session.getAttribute("user") != null) {
				
				System.out.println(session.getAttribute("user")
						+ "I have logout");
				try {
					request.getSession().invalidate();
					
					response.setHeader(applicationContextPath, "index.jsp");
					
					} catch (Exception ex) {
					System.out.println(ex + "Error hai bhaii Error");
				}
				System.out.println("/logout about to dispatch");
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("index.jsp");
				dispatcher.forward(request, response);
				System.out.println("I have logout onto index.jsp");

			} else {
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("index.jsp");
				dispatcher.forward(request, response);
				System.out.println("Chup chaap yehi reh");
			}

		}
//______________________________________________________________________________________________________________________________
		
		else if (request.getRequestURI().equals(
				applicationContextPath + "/afterLogin.jsp")) {
	
			if (session.getAttribute("user") != null) {

			} else {
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
		
			}
//______________________________________________________________________________________________________________________________
			
		} else if (request.getRequestURI().equals(
				applicationContextPath + "/feedback")) {
	
				response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
			
			response.setHeader("Location", "feedback.jsp");
			RequestDispatcher rd = request.getRequestDispatcher("feedback.jsp");
			rd.forward(request, response);
			
//______________________________________________________________________________________________________________________________
			
		} else if (request.getRequestURI().equals(
				
				applicationContextPath + "/feedback_ad")) {
			
			
			session.getAttribute("sub").toString();
			RequestDispatcher rd = request.getRequestDispatcher("Feedback_admin.jsp");
			rd.forward(request, response);
			//response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
			
		//	response.setHeader("Location", "Feedback_admin.jsp");
//______________________________________________________________________________________________________________________________
			
		} else if (request.getRequestURI().equals(
				applicationContextPath + "/resetFeedback")) {
			String us = session.getAttribute("user").toString();
			System.out.println(us);
			
			String uType = "";
		
//--------------------------------------------------------------------------------------------------------------------------------
					uType =Usercheck.checkUser(request, response);
//--------------------------------------------------------------------------------------------------------------------------------
			
			if (uType.equals("teacher")) {

				System.out.println("Going to reset feedback result database");
				
				String sql = "update feedback_results set average_response= 2.5, count=0 where subject ='"+session.getAttribute("sub")+"'";
  
				
//---------------------------------------------------------------------------------------------------------------
							UpdateQuery.updQuery(sql);
//--------------------------------------------------------------------------------------------------------------
				
				response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", "Feedback_admin.jsp");
		

			} else {
				System.out.println("bad user");
				response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", "login.jsp");
			}
//___________________________________________________________________________________________________________________________
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("4");
		System.out.println("3");
		HttpSession session = request.getSession();
		String applicationContextPath = request.getContextPath();
		System.out.println(request.getContextPath() + "\n **"
				+ request.getRequestURI());
		if (request.getRequestURI().equals(
				applicationContextPath + "/edit_prof")) {
		
			
			String uType = Usercheck.checkUser(request, response);
			if(uType.equals("teacher")){
				Teacher t = new Teacher();
				t.edit_detail(request, response, session);
				
				
				session.setAttribute("user", request.getParameter("username").toLowerCase());
			}else{
				Student t = new Student();
			
				t.edit_detail(request, response, session);
				
			}
//______________________________________________________________________________________________________________________________
			response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", "edit.jsp");
		} 
		else if (request.getRequestURI().equals(
				applicationContextPath + "/for")) {
	
				System.out.println("123456756434");
			
//______________________________________________________________________________________________________________________________
			
		}
	}

}
