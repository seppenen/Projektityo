package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao_user;
import dao.dao;
import model.User;

/**
 * Servlet implementation class Servlet_ravintolat
 */
@WebServlet("/Servlet_Companies")
public class Servlet_Companies extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Servlet_Companies.doGet()");
		dao dao = new dao();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("session");

		
		try {		
			String[] sarakkeet={"business_id", "alias"};
			String strJSON=dao.haeTiedotJSON(sarakkeet,"business","business_name is not NULL AND user_id ", String.valueOf(user.getId()),"");	

					
			PrintWriter out = response.getWriter();
		    response.setContentType("text/html"); 
		  
		    out.println(strJSON);
		    
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
