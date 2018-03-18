package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.UpdateProfileBean;
import Connect.ConnectionManager;

public class UpdateProfileDAO {

	
	static Connection Con = null;
	static ResultSet rs = null;
	

	
public ArrayList<UpdateProfileBean> ListAdd(String name , int getId_Company) {
	PreparedStatement pstmt = null;

  //  System.out.println("name มาแล้ว"+name);
	ArrayList<UpdateProfileBean> Ab = new ArrayList<UpdateProfileBean>();
	
	
	String sql = " SELECT * FROM `users_tranid`,users,tranid WHERE users_tranid.Id_User = users.IdUser AND users_tranid.Id_TranID = tranid.IdTranID AND users.name = ? AND users.Id_Company = ? ORDER BY tranid.IdTranID ";
	try {
		Con = ConnectionManager.getConnection();
		pstmt = Con.prepareStatement(sql);
		
		 
		
		
		
		 pstmt.setString(1,name);
		 pstmt.setInt(2,getId_Company);
	//	 System.out.println(sql);
		 rs = pstmt.executeQuery();

		 
		 
		 if(rs.next()){
			 System.out.println("มีข้อมูล");
			 
			 rs = pstmt.executeQuery();
			 while (rs.next()) {
				 
					UpdateProfileBean tranID = new UpdateProfileBean();
					
					tranID.setID_Users_TranID(rs.getInt("iD_Users_TranID"));
					tranID.setId_User(rs.getInt("id_User"));
					tranID.setId_TranID(rs.getInt("id_TranID"));
					
					
					tranID.setId_User(rs.getInt("id_User"));
					tranID.setName(rs.getString("name"));
					tranID.setId_TranID(rs.getInt("id_TranID"));

					tranID.setCode(rs.getString("code"));
					tranID.setDetail(rs.getString("detail"));
					
					Ab.add(tranID);

				}
			 
		 }else{
			 System.out.println("ไม่มีข้อมูล");
			 Ab = null;
		 }
		
		pstmt.close();
		Con.close();
		rs.close();
	} catch (Exception e) {
		e.printStackTrace();
	}

	return Ab;
}
	
	//---------------


public ArrayList<UpdateProfileBean> ListAddToText() {
	PreparedStatement pstmt = null;

    //System.out.println("name มาแล้ว"+name);
	ArrayList<UpdateProfileBean> Ab = new ArrayList<UpdateProfileBean>();
	
	
	String sql = " SELECT users.name,tranid.Code FROM `users_tranid`,users,tranid WHERE users_tranid.Id_User = users.IdUser AND users_tranid.Id_TranID = tranid.IdTranID ORDER BY users.name,tranid.Code ";
	try {
		Con = ConnectionManager.getConnection();
		pstmt = Con.prepareStatement(sql);
		
		 
		
		
		
		// pstmt.setString(1,name);
		 
	//	 System.out.println(sql);
		 rs = pstmt.executeQuery();

		 
	
			 
		
			 while (rs.next()) {
				 
					UpdateProfileBean tranID = new UpdateProfileBean();
					
					
					
					
					tranID.setName(rs.getString("name"));
					

					tranID.setCode(rs.getString("code"));
		
					
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
	
	//-----------------------------
	
	


public int SearchUserID(String name  , int getId_Company) {
	PreparedStatement pstmt = null;
	 int name2 = 0;
    System.out.println("name มาแล้ว"+name);
	//ArrayList<UpdateProfileBean> Ab = new ArrayList<UpdateProfileBean>();
	
	
	String sql = " SELECT `IdUser` FROM `users` WHERE users.name= ? AND users.Id_Company = ?";
	try {
		Con = ConnectionManager.getConnection();
		pstmt = Con.prepareStatement(sql);
		
		 
		
		
		
		 pstmt.setString(1,name);
		 pstmt.setInt(2,getId_Company);
	//	 System.out.println(sql);
		 rs = pstmt.executeQuery();

		 
		
		
			 if (rs.next()) {
				 
				//	UpdateProfileBean tranID = new UpdateProfileBean();
					
					 name2 = rs.getInt("IdUser");
					
					
					

				}else{
					name2 = 0;
				}
			 
		
		
		pstmt.close();
		Con.close();
		rs.close();
	} catch (Exception e) {
		e.printStackTrace();
	}

	return name2;
}
	
//----------------------------------------------


public int CountUserID_TranID() {
	PreparedStatement pstmt = null;
	 int name2 = 0;
    //System.out.println("name มาแล้ว"+name);
	//ArrayList<UpdateProfileBean> Ab = new ArrayList<UpdateProfileBean>();
	
	
	String sql = " SELECT COUNT(`ID_Users_TranID`) AS COUNT FROM `users_tranid`";
	try {
		Con = ConnectionManager.getConnection();
		pstmt = Con.prepareStatement(sql);
		
		 
		
		
		
		// pstmt.setString(1,name);
		 
	//	 System.out.println(sql);
		 rs = pstmt.executeQuery();

		 
		
		
			 if (rs.next()) {
				 
				//	UpdateProfileBean tranID = new UpdateProfileBean();
					
					 name2 = rs.getInt("COUNT");
					
					
					

				}
			 
		
		
		pstmt.close();
		Con.close();
		rs.close();
	} catch (Exception e) {
		e.printStackTrace();
	}

	return name2;
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
