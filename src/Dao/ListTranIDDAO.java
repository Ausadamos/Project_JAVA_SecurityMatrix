package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.ListTranIDBean;
import Connect.ConnectionManager;

public class ListTranIDDAO {
	static Connection Con = null;
	static ResultSet rs = null;
	

	
public ArrayList<ListTranIDBean> ListTranID() {
	PreparedStatement pstmt = null;

	ArrayList<ListTranIDBean> Ab = new ArrayList<ListTranIDBean>();
	String sql = " SELECT * FROM `tranid`ORDER BY tranid.Code;";
	try {
		Con = ConnectionManager.getConnection();
		pstmt = Con.prepareStatement(sql);
		
		
		rs = pstmt.executeQuery();

		while (rs.next()) {
			ListTranIDBean tranID = new ListTranIDBean();
			
			tranID.setIdTranID(rs.getInt("IdTranID"));
			tranID.setCode(rs.getString("Code"));
			tranID.setDetail(rs.getString("Detail"));
			

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
	
	

	


public ArrayList<ListTranIDBean> ListTranIDShowData(int IdUser) {
	PreparedStatement pstmt = null;

	ArrayList<ListTranIDBean> Ab = new ArrayList<ListTranIDBean>();
	String sql = " SELECT `Id_TranID`, tranid.Code , module.NameModule FROM `users_tranid`,tranid,module WHERE users_tranid.Id_TranID = tranid.IdTranID AND tranid.IdModule = module.IdModule AND users_tranid.Id_User = ? ";
	try {
		Con = ConnectionManager.getConnection();
		pstmt = Con.prepareStatement(sql);
		

		pstmt.setInt(1,IdUser);
		
		rs = pstmt.executeQuery();

		while (rs.next()) {
			ListTranIDBean tranID = new ListTranIDBean();
			
			tranID.setIdTranID(rs.getInt("Id_TranID"));
			tranID.setCode(rs.getString("Code"));
			tranID.setNameModule(rs.getString("NameModule"));
			

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
	

	


public ArrayList<ListTranIDBean> ListTranIDInquiry(int[] TranID2,int IdUser) {
	PreparedStatement pstmt = null;

	ArrayList<ListTranIDBean> Ab = new ArrayList<ListTranIDBean>();
	String sql = " SELECT `Id_TranID`, tranid.Code , module.NameModule FROM `users_tranid`,tranid,module WHERE users_tranid.Id_TranID = tranid.IdTranID AND tranid.IdModule = module.IdModule AND users_tranid.Id_User = ? AND tranid.IdModule = ? ";
	try {
		
		System.out.print("มาหน้าDaoแล้ว");
		Con = ConnectionManager.getConnection();
	

		
		ListTranIDBean tranID = null;
		
	
	
		int i = 0;

		while(i < TranID2.length){
	
			
		
			pstmt = Con.prepareStatement(sql);
			
			pstmt.setInt(1,IdUser);
			pstmt.setInt(2,TranID2[i]);
			
			
			rs = pstmt.executeQuery();
             
			
			
			while(rs.next()) {
				
				tranID = new ListTranIDBean();
				tranID.setIdTranID(rs.getInt("Id_TranID"));
				tranID.setCode(rs.getString("Code"));
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
