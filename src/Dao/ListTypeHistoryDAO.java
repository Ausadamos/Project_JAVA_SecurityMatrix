package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Bean.ListTypeHistoryBean;
import Connect.ConnectionManager;

public class ListTypeHistoryDAO {

	static Connection Con = null;
	static ResultSet rs = null;
	

	
public ArrayList<ListTypeHistoryBean> ListTypeHistory() {
	PreparedStatement pstmt = null;

	ArrayList<ListTypeHistoryBean> Ab = new ArrayList<ListTypeHistoryBean>();
	String sql = " SELECT `IdTypeHistory`, `NameTypeHistory` FROM `typehistory` ";
	try {
		Con = ConnectionManager.getConnection();
		pstmt = Con.prepareStatement(sql);
		
		
		rs = pstmt.executeQuery();

		while (rs.next()) {
			ListTypeHistoryBean module = new ListTypeHistoryBean();
			
			module.setIdTypeHistory(rs.getInt("IdTypeHistory"));
			module.setNameTypeHistory(rs.getString("NameTypeHistory"));
		
			

			Ab.add(module);

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
