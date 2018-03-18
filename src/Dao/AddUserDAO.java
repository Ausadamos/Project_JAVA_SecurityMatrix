package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Bean.AddUserBean;
import Connect.ConnectionManager;



public class AddUserDAO {

	static Connection Con = null;
	static ResultSet rs = null;
	
	public int AddUser(String name,String getUsername,String Password,String NameUserLog,int browser,int getId_CompanyUserLogin  ,String getNamePersonal) {
	
	
		int addResult = 0;
		
		
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		//AddProfileBean bean = new AddProfileBean();
		
		//-----------------
		
		
		String sql = " SELECT * FROM `profile` WHERE profile.Id_Personnel = ? OR profile.Username = ? ";

		try {
			// connect to DB
			Con = ConnectionManager.getConnection();
		
			
			
			PreparedStatement ps22 = Con.prepareStatement(sql);
			
			ps22.setInt(1,browser);
			
			ps22.setString(2,name);
		
			
			
			//System.out.println(name+browser);
			
			
			rs = null;
			rs = ps22.executeQuery();
			
			boolean test = rs.next();
			
		
		
			if (test) {
				System.out.println("Sorry, duplicate your Username or IDNTT ");
				//bean.setValid(false);
				ps22.close();
				Con.close();
			}
			
			else if (!test) {
				System.out.println("Pass Username");

				

	
				
				String sql2 = "INSERT INTO `profile`(`Username`,CopyUser,Password,`Id_Personnel`) VALUES (  ? , ? , ? ,?)";
				String sqlHistory = " INSERT INTO `history`(`NewUserLogin`,`UserLoginTodo`, `IdTypeHistory`,NamePersonnel,Id_Company) VALUES (?,?,4,?,?	)";


				try {
					Con = ConnectionManager.getConnection();

		
					PreparedStatement ps = Con.prepareStatement(sql2);

				
					ps.setString(1,name);
					ps.setString(2,getUsername);
					ps.setString(3,Password);
					ps.setInt(4,browser);
					addResult = ps.executeUpdate();
				
					
				//---------------ŧlog----------------
					
					 pstmt2 = Con.prepareStatement(sqlHistory);

						
					 pstmt2.setString(1,name);				
					 pstmt2.setString(2,NameUserLog);
					 pstmt2.setString(3,getNamePersonal);
					 pstmt2.setInt(4,getId_CompanyUserLogin);		
				
					 
					 pstmt2.executeUpdate();
					
					
					
					
					
					
					//---------------------------------------
					ps.close();
					Con.close();
					
				
					
				} catch (SQLException e) {
					e.printStackTrace();
				}

				
				

			

				
				Con.close();
				rs.close();

			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		
		
		//-----------------
		
	
	
	
		
		
		return addResult;
		}
	
	
	
	

public ArrayList<AddUserBean> ListUser() {
	PreparedStatement pstmt = null;

	ArrayList<AddUserBean> Ab = new ArrayList<AddUserBean>();
	
	
	String sql = " SELECT `IdProfile`, `Username`, `Password`, `Status`,personnel.fname,personnel.lname,personnel.IdNTT,company.Id_Company,company.NameCompany FROM `profile`,company,personnel WHERE profile.Id_Personnel = personnel.Id_Personnel AND personnel.Id_Company = company.Id_Company ";
	try {
		Con = ConnectionManager.getConnection();
		pstmt = Con.prepareStatement(sql);
		
		
		rs = pstmt.executeQuery();

		while (rs.next()) {
			AddUserBean tranID = new AddUserBean();
			tranID.setIdProfile(rs.getInt("IdProfile"));
			tranID.setUsername(rs.getString("Username"));
			tranID.setStatus(rs.getInt("Status"));
			
			tranID.setFname(rs.getString("fname"));
			tranID.setLname(rs.getString("lname"));
			tranID.setIdNTT(rs.getString("IdNTT"));
			tranID.setId_Company(rs.getInt("Id_Company"));
			tranID.setNameCompany(rs.getString("NameCompany"));
	
		//	*no password*
		
			
			

			Ab.add(tranID);

		}
		pstmt.close();
		Con.close();
		rs.close();
	} catch (Exception e) {
		e.printStackTrace();
	}

	return Ab;
}
	
	
	
	


public ArrayList<AddUserBean> ListUserButAdmin() {
	PreparedStatement pstmt = null;

	ArrayList<AddUserBean> Ab = new ArrayList<AddUserBean>();
	
	
	String sql = " SELECT `IdProfile`, `Username`, `Password`, `Status`,personnel.fname,personnel.lname,personnel.IdNTT,company.Id_Company,company.NameCompany FROM `profile`,company,personnel WHERE profile.Id_Personnel = personnel.Id_Personnel AND personnel.Id_Company = company.Id_Company  AND profile.Status != 1 ";
	try {
		Con = ConnectionManager.getConnection();
		pstmt = Con.prepareStatement(sql);
		
		
		rs = pstmt.executeQuery();

		while (rs.next()) {
			AddUserBean tranID = new AddUserBean();
			tranID.setIdProfile(rs.getInt("IdProfile"));
			tranID.setUsername(rs.getString("Username"));
			tranID.setStatus(rs.getInt("Status"));
			
			tranID.setFname(rs.getString("fname"));
			tranID.setLname(rs.getString("lname"));
			tranID.setIdNTT(rs.getString("IdNTT"));
			tranID.setId_Company(rs.getInt("Id_Company"));
			tranID.setNameCompany(rs.getString("NameCompany"));
	
		//	*no password*
		
			
			

			Ab.add(tranID);

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
