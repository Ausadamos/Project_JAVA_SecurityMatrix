package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.ListProfileBean;
import Bean.ListusersBean;
import Connect.ConnectionManager;

public class ListUsersDAO {

	static Connection Con = null;
	static ResultSet rs = null;
	
public ArrayList<ListusersBean> ListUsers() {
	PreparedStatement pstmt = null;

	ArrayList<ListusersBean> Ab = new ArrayList<ListusersBean>();
	String sql = " SELECT * FROM `users` ";
	try {
		Con = ConnectionManager.getConnection();
		pstmt = Con.prepareStatement(sql);
		
		
		rs = pstmt.executeQuery();

		while (rs.next()) {
			ListusersBean module = new ListusersBean();
		
			
			module.setIdUser(rs.getInt("IdUser"));
			module.setName(rs.getString("name"));
			

			Ab.add(module);

		}
		pstmt.close();
		Con.close();
		rs.close();
	} catch (Exception e) {
		e.printStackTrace();
	}

	return Ab;
}
	

public ArrayList<ListusersBean> ListUsers2(int getId_Company) {
	PreparedStatement pstmt = null;

	ArrayList<ListusersBean> Ab = new ArrayList<ListusersBean>();
	String sql = " SELECT * FROM `users` WHERE users.Id_Company = ?  ";
	try {
		Con = ConnectionManager.getConnection();
		pstmt = Con.prepareStatement(sql);
		
		pstmt.setInt(1,getId_Company);
		
		
		rs = pstmt.executeQuery();

		while (rs.next()) {
			ListusersBean module = new ListusersBean();
		
			
			module.setIdUser(rs.getInt("IdUser"));
			module.setName(rs.getString("name"));
			

			Ab.add(module);

		}
		pstmt.close();
		Con.close();
		rs.close();
	} catch (Exception e) {
		e.printStackTrace();
	}

	return Ab;
}
	
	
	
	
	
	
}
