package com.revature;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ersServlet
 */
@WebServlet("/servlet/*")
public class ersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ersServlet() {
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String username, password;
		
		username = request.getParameter("username");
		password = request.getParameter("password");
		
		PrintWriter writer = response.getWriter();
		
		if(username.equals("worker") && password.equals("work")) {
		
			writer.println("Welcome");
		}else{
			writer.println("Invalid username or passeword");
		}//end of else statement
		
	/*	public List<Animal> getAnimals() {
			Session session = HibernateUtil.getSession();
			return session.createQuery("from Animal").list();
		} */
		
		
	}//end of doPost method

}//end of ersServlet class 
