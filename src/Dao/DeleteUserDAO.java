package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Connect.ConnectionManager;

public class DeleteUserDAO {


	static Connection Con = null;
	static ResultSet rs = null;
	
	
	public int DeleteUserSelect(int[] code,String NameUserLog,int getId_CompanyUserLogin  ,String getNamePersonal) {

		
		
		int i = 0;
		
		String sql = " DELETE FROM `profile` WHERE profile.IdProfile  = ?  ";
		String sqlSelect = " SELECT  `Username` FROM `profile` WHERE profile.IdProfile  =  ?  ";

		String sql3 = " INSERT INTO `history`(`OldUserLogin`,`UserLoginTodo`, `IdTypeHistory`,NamePersonnel,Id_Company) VALUES (?,?,5,?,?)";

		
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		Con = ConnectionManager.getConnection();
		try {

			for (int j = 0; j < code.length; j++) {

				//----------ค้นหา---------------
				//	ListTranIDBean tranID = null;
					
					
					pstmt2 = Con.prepareStatement(sqlSelect);
					
					pstmt2.setInt(1,code[j]);
					
					rs =null;
					
					rs = pstmt2.executeQuery();
		
				
				//	tranID = new ListTranIDBean();
					String nameuser = null;
					
					if (rs.next()) {
						
						nameuser = rs.getString("Username");
			
					}else{
						 System.out.println("ไม่มี ข้อมูล name");
					}
				
	
					//-----------------ลง log---------------------
					
					 pstmt2 = Con.prepareStatement(sql3);

						
					 pstmt2.setString(1,nameuser);
					 pstmt2.setString(2,NameUserLog);
					 pstmt2.setString(3,getNamePersonal);
					 pstmt2.setInt(4,getId_CompanyUserLogin);	
					 
					 pstmt2.executeUpdate();
					
					
					
					
					
				//---------------------------------------------
					 
				pstmt = Con.prepareStatement(sql);

			
				pstmt.setInt(1,code[j]);
				pstmt.executeUpdate();

			}

			pstmt.close();
			Con.close();

			return 1;

		} catch (SQLException e) {

			return 0;

		}

	}
	
	
	
	
	
}
