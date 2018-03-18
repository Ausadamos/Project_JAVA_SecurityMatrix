package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import Bean.ListProfileBean;
import Connect.ConnectionManager;

public class ListProfileDAo {

static Connection Con = null;
	static ResultSet rs = null;
	

	
public ArrayList<ListProfileBean> ListProfile() {
	PreparedStatement pstmt = null;

	ArrayList<ListProfileBean> Ab = new ArrayList<ListProfileBean>();
	String sql = " SELECT `IdProfile`, `Username`, `Password`, `Status`, `CopyUser`, personnel.`Id_Personnel`,personnel.fname,personnel.lname,personnel.IdNTT,company.Id_Company,company.NameCompany FROM `profile`,personnel,company WHERE profile.Id_Personnel = personnel.Id_Personnel AND personnel.Id_Company = company.Id_Company";
	try {
		Con = ConnectionManager.getConnection();
		pstmt = Con.prepareStatement(sql);
		
		
		rs = pstmt.executeQuery();

		while (rs.next()) {
			ListProfileBean module = new ListProfileBean();
			
			/*int IdProfile ;
			String Username ;
			String Password ;
			int Status ;
			String CopyUser ;*/
			
			module.setIdProfile(rs.getInt("IdProfile"));
			module.setStatus(rs.getInt("Status"));
			
			module.setCopyUser(rs.getString("CopyUser"));
			module.setPassword(rs.getString("Password"));
			module.setUsername(rs.getString("Username"));
			//--------------------------
			module.setFname(rs.getString("fname"));
			module.setLname(rs.getString("lname"));
			
			module.setId_Personnel(rs.getInt("Id_Personnel"));
				
		
			module.setNameCompany (rs.getString("NameCompany"));
			module.setId_Company(rs.getInt("Id_Company"));
			module.setIdNTT(rs.getString("IdNTT"));

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
	
	

/*
public int ListIDNTT(String browser) {
	PreparedStatement pstmt = null;

	int i = 0;
	String sql = "SELECT `Id_Personnel`FROM `personnel`WHERE personnel.IdNTT = ? ";
	try {
		Con = ConnectionManager.getConnection();
		pstmt = Con.prepareStatement(sql);
		
		pstmt.setString(1,browser);
		
		
		rs = pstmt.executeQuery();

		while (rs.next()) {
	
			
		
			
		i = rs.getInt("Id_Personnel");
				
		
		

		}
		pstmt.close();
		Con.close();
		rs.close();
	} catch (Exception e) {
		e.printStackTrace();
	}

	return i;
}
	
		*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
