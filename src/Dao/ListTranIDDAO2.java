package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.ListTranIDBean;
import Connect.ConnectionManager;

public class ListTranIDDAO2 {
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
