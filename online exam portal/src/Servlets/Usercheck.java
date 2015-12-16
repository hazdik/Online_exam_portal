package Servlets;

import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Servlets.ExecuteQuery;

public class Usercheck {

	public static String checkUser(HttpServletRequest request,
			HttpServletResponse response) {

		HttpSession session = request.getSession();

		String uType = "";
		if (session.getAttribute("user") != null) {
			System.out.println(session.getAttribute("user"));
			String us = session.getAttribute("user").toString();
			String checkquery = "select * from users where username ='" + us
					+ "'";
			System.out.println(us);

			try {

				ResultSet set_check = ExecuteQuery.exeQuery(checkquery);

				while (set_check.next()) {

					uType = set_check.getString("type");

				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}

		} else {
			response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);

			response.setHeader("Location", "login.jsp");
		}

		return uType;
	}

}