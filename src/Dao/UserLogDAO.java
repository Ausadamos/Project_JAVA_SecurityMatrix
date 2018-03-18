package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Bean.UserLogBean;

import Connect.ConnectionManager;

public class UserLogDAO {

	
	static Connection Con = null;
	static ResultSet rs = null;

	public UserLogBean loginUsers(String Username, String Password) {
		// preparing some objects for connection
		PreparedStatement pstmt = null;
		UserLogBean bean = new UserLogBean();

		//String sql = "SELECT * FROM profile where Username=? ";
		String sql = "SELECT * , company.Id_Company,personnel.fname,personnel.lname FROM profile,company,personnel where profile.Id_Personnel = personnel.Id_Personnel AND personnel.Id_Company = company.Id_Company AND Username= ? and Password= ?";

		try {
			// connect to DB
			Con = ConnectionManager.getConnection();
			pstmt = Con.prepareStatement(sql);
			
			pstmt.setString(1, Username);
			pstmt.setString(2, Password);
			
			rs = pstmt.executeQuery();
			
			boolean test = rs.next();
			
			
			// System.out.println(more);
			if (!test) {
				System.out.println("ไม่มี username ในระบบ");
				bean.setValid(false);
			}
			// if user exists set the isValid variable to true
			else if (test) {
				System.out.println("login Sucsesfull");

				bean.setPassword(rs.getString("Password")); //1
				bean.setStatus(rs.getInt("Status"));//2
				bean.setUsername(rs.getString("Username"));//3
				bean.setIdProfile(rs.getInt("IdProfile"));//4
				bean.setId_Company(rs.getInt("id_Company"));//5
		
				bean.setFname(rs.getString("fname"));//6
				bean.setLname(rs.getString("lname"));//7
				bean.setValid(true);

				pstmt.close();
				Con.close();
				rs.close();

			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return bean;
	}
	
	
	
	
	
	
	
	
	
	
}
