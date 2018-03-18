package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Connect.ConnectionManager;

public class AddPasswordForNewUserDAO {


	static Connection Con = null;
	static ResultSet rs = null;
	
	public int AddPasswordUser(String name,String Copy,String Password,String NewPassword) {
	
	
		int addResult = 0;
		PreparedStatement pstmt = null;
	
		String sql = " SELECT `IdProfile`, `Username`, `Password`, `Status`, `CopyUser` FROM `profile` WHERE profile.Username = ? AND profile.Password = ? AND profile.Status != 1 ";
	
		
		
		try {
			// connect to DB
			Con = ConnectionManager.getConnection();
			pstmt = Con.prepareStatement(sql);
			
			pstmt.setString(1,name);
			pstmt.setString(2,Copy);
			
			
			
			
			rs = pstmt.executeQuery();
			boolean test = rs.next();
			
		
		
			if (test) {
				System.out.print(" u ตรงกับ copy แล้ว");
				String sql2 = "UPDATE `profile` SET `Password`= ? , `Status` = 3  WHERE profile.Username = ? ";
				

				try {
					Con = ConnectionManager.getConnection();

					PreparedStatement ps = Con.prepareStatement(sql2);

				
					ps.setString(1,Password);
					ps.setString(2,name);
				
				
					addResult = ps.executeUpdate();
				
					
				
					ps.close();
					Con.close();
					
				
					
				} catch (SQLException e) {
					e.printStackTrace();
				}

				
				
				
				
				
				
				
			
				
				
				
			
			}
			
			else if (!test) {
			
				addResult = 0;
				System.out.print("u ไม่ตรงกับ copy");

			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		
		
		//-----------------
		
	
	
	
		
		
		return addResult;
	
	
	
	
	
	
	
	
	
	
	
	
	
	}
	
	public int AddPasswordAdmin(String name,String Copy,String Password,String NewPassword) {
		
		
		int addResult = 0;
		PreparedStatement pstmt = null;
	
		String sql = " SELECT `IdProfile`, `Username`, `Password`, `Status`, `CopyUser` FROM `profile` WHERE profile.Username = ? AND profile.Password = ?  ";
	
		
		
		try {
			// connect to DB
			Con = ConnectionManager.getConnection();
			pstmt = Con.prepareStatement(sql);
			
			pstmt.setString(1,name);
			pstmt.setString(2,Copy);
			
			
			
			
			rs = pstmt.executeQuery();
			boolean test = rs.next();
			
		
		
			if (test) {
				System.out.print(" u ตรงกับ copy แล้ว");
				String sql2 = "UPDATE `profile` SET `Password`= ?   WHERE profile.Username = ? ";
				

				try {
					Con = ConnectionManager.getConnection();

					PreparedStatement ps = Con.prepareStatement(sql2);

				
					ps.setString(1,Password);
					ps.setString(2,name);
				
				
					addResult = ps.executeUpdate();
				
					
				
					ps.close();
					Con.close();
					
				
					
				} catch (SQLException e) {
					e.printStackTrace();
				}

				
				
				
				
				
				
				
			
				
				
				
			
			}
			
			else if (!test) {
			
				addResult = 0;
				System.out.print("u ไม่ตรงกับ copy");

			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		
		
		//-----------------
		
	
	
	
		
		
		return addResult;
	
	
	
	
	
	
	
	
	
	
	
	
	
	}
	
	
	
	
	
	
	
	
}
