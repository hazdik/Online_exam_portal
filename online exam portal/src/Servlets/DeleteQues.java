package Servlets;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Servlets.UpdateQuery;

/**
 * Servlet implementation class DeleteQues
 */
@WebServlet("/DeleteQues")
public class DeleteQues extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteQues() {
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
		
		    String quizid=request.getParameter("quizid");
		    String ques=request.getParameter("ques");
		    System.out.println("Ques insert ho gaya");
			    
		        	
		            UpdateQuery.updQuery("Delete from quiz where quizid='"+quizid+"' and ques='"+ques+"'");
		            response.sendRedirect("DeleteQues.jsp");
		        
		        // TODO Auto-generated method stub
	}

}
