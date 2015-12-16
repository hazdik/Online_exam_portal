package Servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Foru
 */
@WebServlet("/for")
public class Foru extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Foru() {
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
		 String ans=request.getParameter("data"),dat="",code="";
		 HttpSession session = request.getSession();
		    String aut=request.getParameter("aut");
		    int lik=0;
			 Date dt=new Date();
	         dat=dt.toString();
	         
	         code=request.getParameter("code");
	         System.out.println();
	        // UpdateQuery.updQuery("create trigger trig2 after update on forum_ans referencing new as n for each row update forum_que m set m.reply=m.reply+1 where m.que_code= '"+code+"'");
	         System.out.println("INSERT INTO forum_ans VALUES('"+code+"','"+ans+"','"+dat+"','"+aut+"','"+lik+"')" );
	         UpdateQuery.updQuery( "INSERT INTO forum_ans VALUES('"+code+"','"+ans+"','"+dat+"','"+session.getAttribute("user")+"','"+lik+"')" );
	      //   System.out.println("create trigger trig2 after update on forum_ans referencing new as n for each row update forum_que m set m.reply=m.reply+1 where m.que_code= '"+code+"'");
	      
	         response.sendRedirect("forum_ans.jsp?"+code);
	}

}
