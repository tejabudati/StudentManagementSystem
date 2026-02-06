package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.dao.StudentModel;
import com.dao.Studentdao;

/**
 * Servlet implementation class Student
 */
@WebServlet("/Student")
public class Student extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Student() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getParameter("action");
		
		if("edit".equals(action)) {
			loadStudentForEdit(request, response);
		}
		
		if ("viewAll".equals(action)) {
	        viewAllStudents(request, response);
	        return;
	    }
		
		
	}

	private void viewAllStudents(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Studentdao sdao = new Studentdao();
		
		request.setAttribute("students", sdao.getAllStudents());
		
		request.getRequestDispatcher("display-all-students.jsp").forward(request, response);
		
	}

	private void loadStudentForEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");
		
		Studentdao sdao = new Studentdao();
		request.setAttribute("student", sdao.getStudentById(id));

		request.getRequestDispatcher("student-edit.jsp").forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String action = request.getParameter("action");
		
		if("create".equals(action)) {
			createStudent(request, response);
			return;
		}
		
		if ("edit".equals(action)) {
		    updateStudent(request, response);

		    return;
		}
		
		if("delete".equals(action)) {
			deleteStudent(request, response);
			return;
		}
		
		if("search".equals(action)) {
			
			searchStudentById(request,response);
			return;
			
		}
		
	}


	private void searchStudentById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");

	    Studentdao dao = new Studentdao();
	    StudentModel student = dao.getStudentById(id);

	    if (student != null) {
	        request.setAttribute("student", student);
	    } else {
	        request.setAttribute("error", "No student found with ID " + id);
	    }

	    
	    request.getRequestDispatcher("display-by-id.jsp").forward(request, response);
		
	}

	private void createStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name = request.getParameter("Full_Name").trim();
	    String dob = request.getParameter("DOB").trim();
	    String email = request.getParameter("Email").trim();
	    String phone = request.getParameter("Phone_Number").trim();
	    String address = request.getParameter("Address").trim();
	    String course = request.getParameter("course").trim();
	    String department = request.getParameter("Department").trim();
	    String bloodGroup = request.getParameter("blood_group").trim();
	    String gender = request.getParameter("gender").trim();
	    
	    Studentdao sdao = new Studentdao();
	    
	    //email exist check
	    if(sdao.isStudentExist(phone)) {
	    	request.setAttribute("error", "Student already exist");
	    	request.getRequestDispatcher("student-create.jsp").forward(request, response);
	    	return;
	    }
	    
	    //insert student
	    if(sdao.createstudent(name, dob, email,phone, address,course,department,bloodGroup,gender)) {
	    	
	    	request.setAttribute("success", "Student profile created Successfully");
	    	request.getRequestDispatcher("student-create.jsp").forward(request, response);
	    	
	    }else {
	    	
	    	request.setAttribute("error", "Student creation failed");
	        request.getRequestDispatcher("student-create.jsp").forward(request, response);
	    	
	    }
	    
	    
	    
//	    System.out.println(name + " " + email);
		
	    
	}
	
	private void updateStudent(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    String id = request.getParameter("id");
	    String name = request.getParameter("name");
	    String dob = request.getParameter("dob");
	    String email = request.getParameter("email");
	    String address = request.getParameter("address");
	    String status = request.getParameter("status");

	    Studentdao sdao = new Studentdao();

	    if (sdao.updateStudent(id, name, dob, email, address, status)) {

	    	request.setAttribute("success", "Student updated successfully");
	    	request.getRequestDispatcher("edit-student.jsp").forward(request, response);


	    } else {

	        request.setAttribute("error", "Student update failed");
	        request.getRequestDispatcher("edit-student.jsp").forward(request, response);
	    }
	}
	

	private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");
		
		Studentdao sdao = new Studentdao();
		
		if(sdao.deleteStudentById(id)) {
			
			request.setAttribute("success", "student deleted successfully");
			request.getRequestDispatcher("delete-student.jsp").forward(request, response);
			
		}else {
			request.setAttribute("error", "student not deleted ");
			request.getRequestDispatcher("delete-student.jsp").forward(request, response);
		}
		
	}


}
