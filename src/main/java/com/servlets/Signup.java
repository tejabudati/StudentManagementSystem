package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.dao.AdminDao;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
//		System.out.println("HIT");
		
		
		// To identify source (input data coming from)
		String source = request.getParameter("source");
		//get data from Sign-up page
		String name = request.getParameter("full_name").trim();
		String email = request.getParameter("email").trim();
		String password = request.getParameter("password").trim();
		
		AdminDao dao = new AdminDao();
		
		//check for existing email
		if(dao.isEmailExist(email)) {
			
			request.setAttribute("error","Admin already exist");
			
			if("adminCreate".equals(source)) {
				request.getRequestDispatcher("adminCreate.jsp").forward(request,response);
			}else {
				request.getRequestDispatcher("SignUp.jsp").forward(request,response);
			}
			
			return;
			
		}
		
		//insert new admin
		if(dao.registerAdmin(name, email, password)) {
			if("adminCreate".equals(source)) {
				request.setAttribute("success", "Admin created Successfully.");
				request.getRequestDispatcher("adminCreate.jsp").forward(request, response);
			}else {
				request.setAttribute("success", "Sign-Up Successfull.");
				request.getRequestDispatcher("SignUp.jsp").forward(request, response);
			}
			
			
		}else {
			request.setAttribute("error", "Signup failed. Try again");
			
			if("adminCreate".equals(source)) {
				request.getRequestDispatcher("adminCreate.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("SignUp.jsp").forward(request, response);
			}
			
			
		}
		
		
	}

}
