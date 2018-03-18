package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import Connect.ConnectionManager;

public class EditUserDAO {

	static Connection Con = null;
	static ResultSet rs = null;

	public int EditUser(int IdProfile,int LevelUser) {
		
		
		int addResult = 0;
		
	//	PreparedStatement pstmt = null;
		
		//AddProfileBean bean = new AddProfileBean();
		
		//-----------------
		
					String sql2 = " UPDATE `profile` SET `Status`= ? WHERE profile.IdProfile =  ? ";
					

					try {
						Con = ConnectionManager.getConnection();

						PreparedStatement ps = Con.prepareStatement(sql2);

					
						ps.setInt(1,LevelUser);
						ps.setInt(2,IdProfile);
						
						addResult = ps.executeUpdate();
					
						System.out.print("addResult"+addResult);
					

						ps.close();
				
						Con.close();
						
						
				//		rs.close();

				
						
					
						
					} catch (SQLException e) {
						e.printStackTrace();
					}
					
					
					
					
			
				
				
			
	return addResult;
	
	
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
