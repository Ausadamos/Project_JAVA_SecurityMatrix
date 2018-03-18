package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.ListPersonnelBean;
import Bean.ListProfileBean;
import Connect.ConnectionManager;

public class ListPersonnelDAO {

static Connection Con = null;
	static ResultSet rs = null;
	

	
public ArrayList<ListPersonnelBean> ListTranID() {
	PreparedStatement pstmt = null;

	ArrayList<ListPersonnelBean> Ab = new ArrayList<ListPersonnelBean>();
	String sql = " SELECT `Id_Personnel`, IdNTT, `fname`, `lname`, company.Id_Company,company.NameCompany FROM `personnel`,company WHERE personnel.Id_Company = company.Id_Company AND company.NameCompany != 'NTT'";
	try {
		Con = ConnectionManager.getConnection();
		pstmt = Con.prepareStatement(sql);
		
		
		rs = pstmt.executeQuery();

		while (rs.next()) {
			ListPersonnelBean module = new ListPersonnelBean();
			
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
	

public ArrayList<ListPersonnelBean> ListPersonnelprivate(int getId_Company) {
	PreparedStatement pstmt = null;

	ArrayList<ListPersonnelBean> Ab = new ArrayList<ListPersonnelBean>();
	String sql = " SELECT personnel.Id_Personnel, IdNTT, `fname`, `lname`, company.Id_Company,company.NameCompany ,profile.Username FROM `personnel`,company,profile WHERE personnel.Id_Company = company.Id_Company AND profile.Id_Personnel = personnel.Id_Personnel AND company.Id_Company = ? ";
	try {
		Con = ConnectionManager.getConnection();
		pstmt = Con.prepareStatement(sql);
		

		pstmt.setInt(1,getId_Company);
		
		rs = pstmt.executeQuery();

		while (rs.next()) {
			ListPersonnelBean module = new ListPersonnelBean();
			
			module.setFname(rs.getString("fname"));
			module.setLname(rs.getString("lname"));
			
			module.setId_Personnel(rs.getInt("Id_Personnel"));
				
		
			module.setNameCompany (rs.getString("NameCompany"));
			module.setId_Company(rs.getInt("Id_Company"));
			module.setIdNTT(rs.getString("IdNTT"));
			module.setUsername(rs.getString("Username"));
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
public ArrayList<ListProfileBean> ListPersonnelForSelect() {
	PreparedStatement pstmt = null;

	ArrayList<ListProfileBean> Ab = new ArrayList<ListProfileBean>();
	String sql = " SELECT `IdProfile` FROM `profile`";
	try {
		Con = ConnectionManager.getConnection();
		pstmt = Con.prepareStatement(sql);
		
		
		rs = pstmt.executeQuery();

		while (rs.next()) {
			ListProfileBean module = new ListProfileBean();
			
			module.setIdProfile(rs.getInt("IdProfile"));
			

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
	*/

public int ListIDNTT(String browser) {
	PreparedStatement pstmt = null;

	int i = 0;
	String sql = "SELECT `Id_Personnel`FROM `personnel`WHERE personnel.IdNTT = ? ";
	try {
		Con = ConnectionManager.getConnection();
		pstmt = Con.prepareStatement(sql);
		
		pstmt.setString(1,browser);
		
		
		rs = pstmt.executeQuery();

		
		if(rs.next()){
			
		rs = null;
		rs = pstmt.executeQuery();
		
			while (rs.next()) {
				
				
				i = rs.getInt("Id_Personnel");
						
			
				}

		}else{
			i = 0;
			
			
		}
		
		pstmt.close();
		Con.close();
		rs.close();
	} catch (Exception e) {
		e.printStackTrace();
	}

	return i;
}
	
		
	
	
	
	
}
