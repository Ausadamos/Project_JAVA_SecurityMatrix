package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Bean.ListTranIDBean;
import Connect.ConnectionManager;

public class SearchFromEditDeleteTranIDDAO {

	
	
	static Connection Con = null;
	static ResultSet rs = null;


	

	
public ArrayList<ListTranIDBean> ListTranIDFromSearch(int[] code) {
	PreparedStatement pstmt = null;

	ArrayList<ListTranIDBean> Ab = new ArrayList<ListTranIDBean>();
	
	
	
	String sql = " SELECT `IdTranID`, `Code`, `Detail`, module.`IdModule`,module.NameModule FROM `tranid`,module WHERE tranid.IdModule = module.IdModule AND tranid.IdModule = ?   ";
	
	try {
		Con = ConnectionManager.getConnection();
		
		
		ListTranIDBean tranID = null;
		
		int i = 0;
		
		while(i < code.length){
		System.out.println(i + "=" + code[i]);
	    i++;
	    
			}

		
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
