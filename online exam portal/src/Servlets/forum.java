package Servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class forum
 */
@WebServlet("/forum")
public class forum extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public forum() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("tdsydgf");
		System.out.println("adg");
	    question q= new question();
		HttpSession session = request.getSession();
		
	    q.que = request.getParameter("data");
		q.aut = request.getParameter("aut");
		 q.code = request.getParameter("ids");
		  request.setAttribute("dfsa", "dsfsdf");
		 
		 
			Date dt = new Date();
			LocalDate dNow = LocalDate.now();
			
			//q.dat = dt.toString();
			q.dat= dNow.toString();
			System.out.println("INSERT INTO forum_que VALUES('" + q.que + "','" + q.dat + "','" + session.getAttribute("user") + "', 0)");
			UpdateQuery.updQuery(" INSERT INTO forum_que(que, date, author, reply) VALUES('" + q.que + "','" + q.dat + "','" + session.getAttribute("user") + "', 0)");
			response.sendRedirect("forum.jsp");
		 
	}

}
