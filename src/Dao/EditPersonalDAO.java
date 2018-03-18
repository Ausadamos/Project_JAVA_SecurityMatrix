package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Connect.ConnectionManager;



public class EditPersonalDAO {


static Connection Con = null;
	static ResultSet rs = null;
	
	
	public int EditUsername(int IdProfile,String EditUsername,int getId_Company,String NameUserLog,String OLD_USERNAME,int getId_CompanyUserLogin  ,String getNamePersonal) {
		
		
		int addResult = 0;
	
		String sql = " SELECT profile.IdProfile FROM `profile`,personnel,company WHERE profile.Id_Personnel = personnel.Id_Personnel AND personnel.Id_Company = company.Id_Company  AND profile.Username = ? " + 
				"		 AND profile.IdProfile != ? ";
		
		String sql88 = " INSERT INTO `history`(`NewUserLogin`, `OldUserLogin`, `UserLoginTodo`, `Note`, `IdTypeHistory`,NamePersonnel,Id_Company) VALUES (?,?,?,'EditUsername',9,?,?)";
		

					try {
						Con = ConnectionManager.getConnection();

						PreparedStatement ps = Con.prepareStatement(sql);

					
					
						ps.setString(1,EditUsername);
						ps.setInt(2,IdProfile);
						
						 rs = ps.executeQuery();
					
						 if(rs.next()){
							 System.out.println("มีข้อมูล");
								ps.close();
								
								Con.close();
							 
						 }else {
							 
							String sql2 = " UPDATE `profile` SET `Username`= ? WHERE profile.IdProfile = ?  ";
							
							PreparedStatement ps2 = Con.prepareStatement(sql2);
							 
							ps2.setString(1,EditUsername);
							ps2.setInt(2,IdProfile);
						
							addResult = ps2.executeUpdate(); 
							
							//-------------
							
						
							
							PreparedStatement ps3 = Con.prepareStatement(sql88);
							 
							ps3.setString(1,EditUsername);
							ps3.setString(2,OLD_USERNAME);
							ps3.setString(3,NameUserLog);
							ps3.setString(4,getNamePersonal);
							ps3.setInt(5,getId_CompanyUserLogin);	
							
							
							ps3.executeUpdate(); 
							
							
							
							
							
							
							
							
							
							 
							ps.close();
							ps2.close();
							Con.close();
							
							 
						 }
						
						
						
					
						
			
						

				
						
					
						
					} catch (SQLException e) {
						e.printStackTrace();
					}
					
					
					
					
			
				
				
			
	return addResult;
	
	
	
	}
	
	
	public int EditPassword(String NewPassword,String NewPasswordagain,int IdProfile,String getUsername,String 	NameUserLog,int getId_CompanyUserLogin  ,String getNamePersonal) {
		
		
		int addResult = 0;
	
		String sql2 = " UPDATE `profile` SET `Password`= ? WHERE profile.IdProfile = ? ";
		String sql88 = " INSERT INTO `history`(`OldUserLogin`,NewPasswordUserLogin , `UserLoginTodo`, `Note`, `IdTypeHistory`,NamePersonnel,Id_Company) VALUES (?,?,?,'EditPassword',9,?,?	)";

					

					try {
						Con = ConnectionManager.getConnection();

							 
							
							PreparedStatement ps2 = Con.prepareStatement(sql2);
							 
							ps2.setString(1,NewPassword);
							ps2.setInt(2,IdProfile);
						
							addResult = ps2.executeUpdate(); 
							 
					
							//--------------

							
						
							
							PreparedStatement ps3 = Con.prepareStatement(sql88);
							 
							ps3.setString(1,getUsername);
							ps3.setString(2,NewPassword);
							ps3.setString(3,NameUserLog);
							ps3.setString(4,getNamePersonal);
							ps3.setInt(5,getId_CompanyUserLogin);	
							
							
							ps3.executeUpdate(); 
							
							
							
							ps2.close();
							Con.close();
							
							 
					
						
					} catch (SQLException e) {
						e.printStackTrace();
					}
					
					
					
					
			
				
				
			
	return addResult;
	
	
	
	}
	
	
	
	
	
	
	
	
	
	
}
