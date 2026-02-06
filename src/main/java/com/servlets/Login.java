package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.AdminDao;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//    	System.out.println("Login HIT");
    	
        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();

        AdminDao dao = new AdminDao();

        if(dao.validateAdmin(email, password)) {

            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            
            response.sendRedirect("DashBoard.jsp");


        } else {

        	request.setAttribute("error", "Invalid Email or Password");
        	request.getRequestDispatcher("index.jsp").forward(request, response);

        }
    
//        System.out.println("EMAIL = " + email);
//        System.out.println("PASSWORD = " + password);

        
        

	}

}
