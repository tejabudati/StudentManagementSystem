package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dbutil.DBUtil;

public class AdminDao {
	
		
	public boolean isEmailExist(String email) {
		
		String sql = "SELECT id FROM admins WHERE email = ?";
		
		try(
				Connection connection = DBUtil.getConnection();
				PreparedStatement ps = connection.prepareStatement(sql)
			){
			
				ps.setString(1,email);
			
				ResultSet rs = ps.executeQuery();//executes the query
				
				return rs.next();// moves the cursor to next row
			
		}catch(Exception e){
			
			e.printStackTrace();//prints where and why the error happened
			
		}
		
		return false;
		
	}
	
	public boolean registerAdmin(String name, String email, String password) {
		
		String sql = "INSERT INTO admins (full_name, email, password) VALUES (?, ?, ?)";
		
		try(
				Connection connection = DBUtil.getConnection();
				PreparedStatement ps = connection.prepareStatement(sql)
			){
			
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, password);

			return ps.executeUpdate() > 0;
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		return false;
		
	}
	

    public boolean validateAdmin(String email, String password) {

        String sql = "SELECT id FROM admins WHERE email=? AND password=?";

        try (
            Connection con = DBUtil.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            return rs.next();
//            if(rs.next()) {
//            	System.out.println("login success in dao");
//            	return true;
//            }else {
//            	System.out.println("login failed in dao");
//            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
