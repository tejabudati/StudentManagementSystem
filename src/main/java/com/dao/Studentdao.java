package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dbutil.DBUtil;

public class Studentdao {
	
	public boolean isStudentExist(String phone) {
		String sql = "SELECT id FROM students WHERE Phone_Number=?";
		
		try(
				Connection con = DBUtil.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				)
		{
			
			 
	         ps.setString(1, phone);

	         return ps.executeQuery().next();
			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		return false;
		
	}
	
	public boolean createstudent(
			String name, 
			String dob, 
			String email, 
			String phone, 
			String address, 
			String course, 
			String department, 
			String bloodGroup, 
			String gender) {
		
		String sql = "INSERT INTO students(Full_Name, DOB, Email, Phone_Number, Address, Course, Department, blood_group, gender) VALUES(?,?,?,?,?,?,?,?,?)";
		
		try(
				Connection con = DBUtil.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				){
			
			 ps.setString(1, name);
	         ps.setString(2, dob);
	         ps.setString(3, email);
	         ps.setString(4, phone);
	         ps.setString(5, address);
	         ps.setString(6, course);
	         ps.setString(7, department);
	         ps.setString(8, bloodGroup);
	         ps.setString(9, gender);

	         return ps.executeUpdate() > 0;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
		
	}

	public StudentModel getStudentById(String id) {
		// TODO Auto-generated method stub
		
		String sql = "SELECT * FROM students WHERE id = ?";
		
		try(
		        Connection con = DBUtil.getConnection();
		        PreparedStatement ps = con.prepareStatement(sql)
		    ){

		        ps.setString(1, id);

		        ResultSet rs = ps.executeQuery();

		        if(rs.next()){

		            StudentModel s = new StudentModel();

		            s.setId(rs.getInt("id"));
		            s.setName(rs.getString("Full_Name"));
		            s.setDob(rs.getString("DOB"));
		            s.setEmail(rs.getString("Email"));
		            s.setPhone(rs.getString("Phone_Number"));
		            s.setAddress(rs.getString("Address"));
		            s.setCourse(rs.getString("Course"));
		            s.setDepartment(rs.getString("Department"));
		            s.setBloodGroup(rs.getString("blood_group"));
		            s.setGender(rs.getString("gender"));
		            s.setStatus(rs.getString("status"));

		            return s;
		        }

		    }catch(Exception e){
		        e.printStackTrace();
		    }
		
		return null;
	}

	public boolean updateStudent(
			String id, 
			String name, 
			String dob, 
			String email, 
			String address, 
			String status) {
		// TODO Auto-generated method stub
		
		String sql = "UPDATE students SET Full_Name=?, Email=?, Address=?, status=? WHERE id=?";
		
		try(
				Connection con = DBUtil.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				){
			
			 ps.setString(1, name);
	         ps.setString(2, email);
	         ps.setString(3, address);
	         ps.setString(4, status);
	         ps.setString(5, id);

	         return ps.executeUpdate() > 0;
//		System.out.println("UPDATE HIT");
//		System.out.println("ID = " + id);
//		System.out.println("NAME = " + name);
//		System.out.println("EMAIL = " + email);
//		System.out.println("ADDRESS = " + address);
//		System.out.println("STATUS = " + status);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return false;
	}
	
	public boolean deleteStudentById(String id) {
		
		String sql = "DELETE FROM students WHERE id=?";
		
		try(
				Connection con = DBUtil.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				
				){
			
			ps.setInt(1, Integer.parseInt(id));
			
			return ps.executeUpdate() > 0;
			
		}catch (Exception e){
			
			e.printStackTrace();
			
		}
		
		return false;
		
	}

	 public List<StudentModel> getAllStudents() {

	        List<StudentModel> list = new ArrayList<>();

	        String sql = "SELECT * FROM students";

	        try (
	            Connection con = DBUtil.getConnection();
	            PreparedStatement ps = con.prepareStatement(sql);
	            ResultSet rs = ps.executeQuery()
	        ) {

	            while (rs.next()) {
	                StudentModel s = new StudentModel();

	                s.setId(rs.getInt("id"));
	                s.setName(rs.getString("Full_Name"));
	                s.setDob(rs.getString("DOB"));
	                s.setGender(rs.getString("gender"));
	                s.setPhone(rs.getString("Phone_Number"));
	                s.setEmail(rs.getString("Email"));
	                s.setCourse(rs.getString("Course"));
	                s.setDepartment(rs.getString("Department"));
	                s.setStatus(rs.getString("status"));

	                list.add(s);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return list;
	    }
	

}
