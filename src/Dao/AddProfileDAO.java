package Dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Bean.AddProfileBean;

import Connect.ConnectionManager;



public class AddProfileDAO {

	
	static Connection Con = null;
	static ResultSet rs = null;
	
	public int AddUser(String name,String NameUserLog, int ID_company_UserLog,int getId_CompanyUserLogin  ,String getNamePersonal) {
	
		//ไม่ใช้ id com แล้ว
	
		int addResult = 0;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		AddProfileBean bean = new AddProfileBean();
		
		//-----------------
		
		
		String sql = "SELECT `IdUser`, `name` FROM `users` WHERE users.name = ?  ;";
		String sql3 = " INSERT INTO `history`(`NewUserProfile`,`UserLoginTodo`, `IdTypeHistory`,NamePersonnel,Id_Company) VALUES (?,?,6,?,?	)";

		try {
			// connect to DB
			Con = ConnectionManager.getConnection();
			pstmt = Con.prepareStatement(sql);
			
			pstmt.setString(1,name);
		
		
			rs = pstmt.executeQuery();
			boolean test = rs.next();
			
		//	int addResult = 0;
		
			if (test) {
				System.out.println("Sorry, duplicate your User!!!! ");
				//bean.setValid(false);
				
			}
			
			else if (!test) {
				System.out.println("good");

				

	
				
				String sql2 = " INSERT INTO `users`(`name`,	Id_Company) VALUES ( ? , ? );";
				

				try {
					Con = ConnectionManager.getConnection();

					PreparedStatement ps = Con.prepareStatement(sql2);

				
					ps.setString(1,name);
					ps.setInt(2,ID_company_UserLog);
		
					addResult = ps.executeUpdate();
				

					 pstmt2 = Con.prepareStatement(sql3);
					 pstmt2.setString(1,name);
					 pstmt2.setString(2,NameUserLog);
					 pstmt2.setString(3,getNamePersonal);
					 pstmt2.setInt(4,getId_CompanyUserLogin);	
					 
					 pstmt2.executeUpdate();
					
					
				
					ps.close();
					Con.close();
					
				
					
				} catch (SQLException e) {
					e.printStackTrace();
				}

				
				

			

				pstmt.close();
				Con.close();
				rs.close();

			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
	
	return addResult;
	}
	//-----------------------------เอาid ล่าสุด-----------------------------
	public String getLastAddTranID() {

		String lastAddID = null;

		String sql = " SELECT MAX(`IdUser`) AS num FROM `users`";

		try {
			Con = ConnectionManager.getConnection();

			PreparedStatement ps = Con.prepareStatement(sql);

			rs = ps.executeQuery();

			if (rs.next()) {
				lastAddID = rs.getString("num");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return lastAddID;
	}
	public int AddSelectTranUser(int[] code,int user) {

		// int delResult = 0;
		System.out.print("user มาล่ะ" + user);
		int i = 0;
		while (i < code.length) {
			System.out.print("code มาล่ะ" + code[i]);
			i++;
		}

		String sql = 
			" DELETE FROM `users_tranid` WHERE users_tranid.Id_User = ? and users_tranid.Id_TranID = ?  "
				;
		PreparedStatement pstmt = null;
		Con = ConnectionManager.getConnection();
		try {

			for (int j = 0; j < code.length; j++) {

				pstmt = Con.prepareStatement(sql);

				pstmt.setInt(1,user  );
				pstmt.setInt(2,code[j]);
				pstmt.executeUpdate();

			}

			pstmt.close();
			Con.close();

			return 0;

		} catch (SQLException e) {

			return 1;

		}

	}
	
	//------------------------
	public int AddSelectTranUser_2(int[] code,int user) {

		// int delResult = 0;
		//System.out.print("user มาล่ะ" + user);
		int i = 0;
		
		/*while (i < code.length) {
			System.out.print("code มาล่ะ" + code[i]);
			i++;
		}*/

		String sql = " INSERT INTO `users_tranid`(`Id_User`, `Id_TranID`) VALUES ( ? , ?)  ";

		
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		Con = ConnectionManager.getConnection();
		try {

			for (int j = 0; j < code.length; j++) {

				
				
				pstmt = Con.prepareStatement(sql);

				pstmt.setInt(1,user);
				pstmt.setInt(2,code[j]);
				pstmt.executeUpdate();

			}

			
			
			
			pstmt.close();
			Con.close();

			return 1;

		} catch (SQLException e) {

			return 0;

		}

	}
	
	
	public int DeleteForUpdateSelectTranUser(int name2) {

		
		//int i = 0;
		
		String sql = " DELETE FROM `users_tranid` WHERE users_tranid.Id_User= ?  ";
		PreparedStatement pstmt = null;
		Con = ConnectionManager.getConnection();
		try {

		

				pstmt = Con.prepareStatement(sql);
				pstmt.setInt(1,name2);
				
				pstmt.executeUpdate();

			

			pstmt.close();
			Con.close();

			return 1;

		} catch (SQLException e) {

			return 0;

		}

	}
	
}
