package Servlets;
import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Servlets.UpdateQuery;

/**
 * Servlet implementation class TeacherQuiz
 */
@WebServlet("/TeacherQuiz")
public class TeacherQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherQuiz() {
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
		    String op1=request.getParameter("op1");
		    String op2=request.getParameter("op2");
		    String op3=request.getParameter("op3");
		    String op4=request.getParameter("op4");
		    String ans=request.getParameter("ans");
		    int time=Integer.parseInt(request.getParameter("time"));
			    System.out.println("INSERT INTO QUIZ VALUES('"+quizid+"','"+ques+"','"+op1+"','"+op2+"','"+op3+"','"+op4+"','"+ans+"','"+time+"')");
			    try {
		        
		           UpdateQuery.updQuery("INSERT INTO QUIZ VALUES('"+quizid+"','"+ques+"','"+op1+"','"+op2+"','"+op3+"','"+op4+"','"+ans+"','"+time+"')" );
		     RequestDispatcher rd = request.getRequestDispatcher("TeacherQuiz.jsp?myquizid="+quizid+"");
		    rd.forward(request, response);
		        //   response.sendRedirect("TeacherQuiz.jsp");
		            }
		        catch(Exception e) {
		            e.printStackTrace();
		        }
		        // TODO Auto-generated method stub
	}

}
