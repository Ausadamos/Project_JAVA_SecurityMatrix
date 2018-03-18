package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Bean.AddProfileBean;
import Connect.ConnectionManager;

public class DeleteProfileDAO {

	
	
	
	
	static Connection Con = null;
	static ResultSet rs = null;
	
	
	
	
	
	
	
	public int removeUserID_TranID(int user) {

		//System.out.println("userID = "+ user);

		String sql = " DELETE FROM `users_tranid` WHERE users_tranid.Id_User = ?  ";
		PreparedStatement pstmt = null;
		Con = ConnectionManager.getConnection();
		
		try {

		

				pstmt = Con.prepareStatement(sql);

				pstmt.setInt(1,user);
			
				pstmt.executeUpdate();
		

			pstmt.close();
			Con.close();

			return 1;

		} catch (SQLException e) {

			return 0;

		}

	}
	
	//-----------------------

	
	public int removeUserID(int user,String NameUserLog,String name,int getId_CompanyUserLogin  ,String getNamePersonal) {

		

		String sql = " DELETE FROM `users` WHERE users.IdUser = ?  ";
		String sql3 = " INSERT INTO `history`(`OldUserProfile`,`UserLoginTodo`, `IdTypeHistory`,NamePersonnel,Id_Company) VALUES (?,?,8,?,?)";

		
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		Con = ConnectionManager.getConnection();
		
		try {

			//-----------------ŧ log---------------------
			
			 pstmt2 = Con.prepareStatement(sql3);

				
			 pstmt2.setString(1,name);
			 pstmt2.setString(2,NameUserLog);
			 pstmt2.setString(3,getNamePersonal);
			 pstmt2.setInt(4,getId_CompanyUserLogin);	
			 
			 pstmt2.executeUpdate();
			
			
			
			
			
		//---------------------------------------------
			
			
			
			
			
			
			
			

				pstmt = Con.prepareStatement(sql);

				pstmt.setInt(1,user);
			
				pstmt.executeUpdate();
		

			pstmt.close();
			Con.close();

			return 1;

		} catch (SQLException e) {

			return 0;

		}

	}
	
	
	//------------------------
	public int CheckUser(String name  , int getId_Company) {
		
		
		int addResult = 0;
		PreparedStatement pstmt = null;
		//AddProfileBean bean = new AddProfileBean();
		
		//-----------------
		
		
		String sql = "SELECT `IdUser`, `name` FROM `users` WHERE users.name = ? AND users.Id_Company = ?;";

		try {
			// connect to DB
			Con = ConnectionManager.getConnection();
			pstmt = Con.prepareStatement(sql);
			
			pstmt.setString(1,name);
			 pstmt.setInt(2,getId_Company);
			rs = pstmt.executeQuery();
			boolean test = rs.next();
			
		//	int addResult = 0;
		
			if (test) {
				//System.out.println("Sorry, duplicate your User!!!! ");
			
				addResult = 1 ;
			}
			
			else if (!test) {
			//	System.out.println("good");

				

				addResult = 0 ;
				
			
			}
			

			pstmt.close();
			Con.close();
			rs.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return addResult;
	}
		
}
