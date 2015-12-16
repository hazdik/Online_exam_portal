package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Servlets.ExecuteQuery;
import Servlets.UpdateQuery;
/**
 * Servlet implementation class Feedback
 */
@WebServlet("/feedback_submit")
public class Feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Feedback() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		String subject = session.getAttribute("sub").toString();
		ResultSet rs=null;
	
		int l=0,h=0;
		try{
		 
		String getAvg= "select * from feedback_results where subject='"+subject+"'";
	//---------------------------------------------------------------------------------------------------	
		rs= ExecuteQuery.exeQuery(getAvg);
	//---------------------------------------------------------------------------------------------------	
		rs.first();
		l =rs.getInt("quesid");
		rs.last();
		h=rs.getInt("quesid");
		System.out.println("Low:"+l +" high:"+ h);
		}catch(Exception ex){
			ex.printStackTrace();
		}
	
		ArrayList<Integer> sRe_list= new ArrayList<Integer>();
		ArrayList<String> q_list = new ArrayList<String>();
		ArrayList<Float> aRe_list= new ArrayList<Float>();
		ArrayList<Integer> count_list = new ArrayList<Integer>();

		Iterator<Integer> itr_sRe;
		Iterator<Float> itr_aRe;
		Iterator<Integer> itr_count;
		
		try {
			rs.first();
		
		for(int i=l;i<=h;i++){
			
			q_list.add(request.getParameter("question"+i));
			if(request.getParameter("response"+ i)!=null){
				sRe_list.add(Integer.parseInt(request.getParameter("response"+ i)));
			}else{
				sRe_list.add(0);
			}

				aRe_list.add(rs.getFloat("average_response"));
				count_list.add(rs.getInt("count"));
				rs.next();
				
			
		}
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		for(itr_aRe=aRe_list.iterator(), itr_count= count_list.iterator(), itr_sRe = sRe_list.iterator(); itr_sRe.hasNext();){
				
			float aRe= itr_aRe.next();
			int sRe = itr_sRe.next();
			int cou = itr_count.next();
		
			if(sRe!=0){				
				aRe= (sRe + aRe)/2;
				cou= cou+1;
			}
			String strDouble = String.format("%.2f", aRe);
			aRe= Float.parseFloat(strDouble);
	
	//-------------------------------------------------------------------------------------------------------------------------------------------		
			UpdateQuery.updQuery("update feedback_results set average_response="+ aRe +", count="+cou+" where quesid="+(l)+" and subject='"+subject+"'");
	//--------------------------------------------------------------------------------------------------------------------------------------------------			
			l++;
			}
			
		System.out.println("OK feedback");
	
		PrintWriter out = response.getWriter();
		out.println("<p >Your Feedback has been Submiited</p>");
		out.println("<a href=\"afterLogin.jsp\">HOME</a>");
			
	
		}
	
}

	
		