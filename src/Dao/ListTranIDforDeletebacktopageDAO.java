package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.ListTranIDBean;
import Bean.ListUserTranID;
import Connect.ConnectionManager;

public class ListTranIDforDeletebacktopageDAO {

	


	static Connection Con = null;
	static ResultSet rs = null;


	

	
public ArrayList<ListTranIDBean> 	ListTranIDforDeletebacktopage(int[] code) {
	PreparedStatement pstmt = null;

	ArrayList<ListTranIDBean> Ab = new ArrayList<ListTranIDBean>();
	
	
	
	String sql = " SELECT `IdTranID`, `Code`, `Detail`, module.`IdModule`,module.NameModule FROM `tranid`,module WHERE tranid.IdModule = module.IdModule AND tranid.IdModule = ?   ";
	
	try {
		Con = ConnectionManager.getConnection();
		
		
		ListTranIDBean tranID = null;
		
		int i = 0;
		
	

		i = 0;

		while(i < code.length){
			//pstmt = null;
			
		
			pstmt = Con.prepareStatement(sql);
			
			pstmt.setInt(1,code[i]);
			
			// rs  = null;
		//	System.out.println("ครั้งที่ "+j+"ค่า ="+code[i]);
			
			
			rs = pstmt.executeQuery();
             
			
			
			while(rs.next()) {
				
				tranID = new ListTranIDBean();
				tranID.setIdTranID(rs.getInt("IdTranID"));
				tranID.setCode(rs.getString("Code"));
				tranID.setDetail(rs.getString("Detail"));
				tranID.setIdModule(rs.getInt("IdModule"));
				tranID.setNameModule(rs.getString("NameModule"));
				

				Ab.add(tranID);

			}
			
		
			
		 i++;
	    
			}

		
		
		pstmt.close();
		Con.close();
		rs.close();
		
	
		
	} catch (Exception e) {
		e.printStackTrace();
	}

	return Ab;
}
	
	
     
	
	

 	
public ArrayList<ListUserTranID> ListTranIDforArray(int IdUser) {
	PreparedStatement pstmt = null;

	ArrayList<ListUserTranID> Ab = new ArrayList<ListUserTranID>();
	
	
	
	String sql = " SELECT `ID_Users_TranID`, `Id_User`, `Id_TranID` FROM `users_tranid` WHERE users_tranid.Id_User = ?   ";
	
	try {
		Con = ConnectionManager.getConnection();
		
		
	

		
		pstmt = Con.prepareStatement(sql);
		pstmt.setInt(1,IdUser);
		
		
		rs = pstmt.executeQuery();


			
		ListUserTranID tranID = null;
			
		
			while(rs.next()) {
				
				tranID = new ListUserTranID();
				
				tranID.setId_TranID(rs.getInt("Id_TranID"));
				tranID.setId_User(rs.getInt("Id_User"));
				tranID.setID_Users_TranID(rs.getInt("ID_Users_TranID"));
			
				

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
