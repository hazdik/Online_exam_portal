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

/**
 * Servlet implementation class CreateQuiz
 */
@WebServlet("/createquiz")
public class CreateQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateQuiz() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("iop");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		 	System.out.println("sdfa");
		 String subject = "select * from teacher where username= '"+session.getAttribute("user")+"'";
		ResultSet rs= ExecuteQuery.exeQuery(subject);
		String sub ="";
		try{rs.next();
		 sub= rs.getString("subject").toString();
		}catch(Exception e){
			e.printStackTrace();
		}
		 	String myquizid=request.getParameter("myquizid");
		    System.out.println("insert into exam_info(quizid, noofques) values ('"+myquizid+"', 0)");
		    UpdateQuery.updQuery("insert into exam_info(quizid, noofques, subject) values ('"+myquizid+"', 0,'"+sub+"' )");
		   // response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
		//	response.setHeader("Location", "TeacherQuiz.jsp");
			RequestDispatcher rd= request.getRequestDispatcher("TeacherQuiz.jsp");
			rd.forward(request, response);
	}

}
